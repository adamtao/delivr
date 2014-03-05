# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ($) ->
	stripe_public_key = $('meta[name="stripe-key"]').attr('content')
	if stripe_public_key
		Stripe.setPublishableKey(stripe_public_key)
		cart.setupForm()

	shipping_form.setupForm()
	$('input[type=submit]').attr('disabled', false)

cart =
	setupForm: ->
		$('#finalize_checkout').submit ->
			$('#stripe_error').removeClass("alert-box alert").text("")
			$('input[type=submit]').attr('disabled', true)
			if $('#card_number').length
				cart.processCard()
				false
			else
				true

	processCard: ->
		card =
			number: $('#card_number').val()
			cvc: $('#card_code').val()
			expMonth: $('#card_month').val()
			expYear: $('#card_year').val()
		Stripe.createToken(card, cart.handleStripeResponse)

	handleStripeResponse: (status, response) ->
		if status == 200
			$('#sales_order_stripe_card_token').val(response.id)
			$('#finalize_checkout')[0].submit()
		else
			$('#stripe_error').text(response.error.message).addClass("alert-box alert")
			$('input[type=submit]').attr('disabled', false)