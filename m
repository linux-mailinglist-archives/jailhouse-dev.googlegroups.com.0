Return-Path: <jailhouse-dev+bncBDAMN6NI5EERBBGS63VAKGQEHHOVXJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5D298596
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Aug 2019 22:26:44 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id l15sf2039710edw.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Aug 2019 13:26:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566419204; cv=pass;
        d=google.com; s=arc-20160816;
        b=wvItXtnYZJli7jnzw4qBEsT9j57mO47gUn2cH0UpjhGFKhKoLiQRcghBMqllqXLMEI
         aArLkIikuqArLpVcM75StDD1wjPFiR/Q+8Dtx6HildOd7JrlCjmOaX6eLYqgM06x9La9
         YWmMAbJF+a/nHuL2m9EN4+e2yqOW7NfUTrnHA/KfS9J04KJdzMrACn15y6obWAWeIE9G
         3TranA/swnqI9tSEFuQ4KSyycfrH7wl7EbN8gdv0okBRZgu6o6Gmd4AyUw96EKYosZ9R
         BfvF56Wm2RXSMraXmWjvqUNQeP5H7HtS7fR91CiQxTuavdY950XHD/BS/FD+dfDWq9yH
         qf9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:user-agent:references
         :message-id:in-reply-to:subject:cc:to:from:date:sender
         :dkim-signature;
        bh=0nVJ78R0Bll4bj+An6dlMgy8yHO3rBjHiEgmUNcr0Mg=;
        b=oUAzwIxxHk53lmrKC0wzEDvKw6m7od0WMPd3VA7VvOQFk/wOjWgAowHmo5oSPXC0xO
         0935TvluSjou7iJYWA+DaejmiDuve1dNFBCof6es3VBZAE7mOltsF99Q0AZLG6u6nI11
         zR3PsKDbWiiWGAh8m849WcRA217FtD5ug70F86qsMjfqXW776EBFxjkJHnd3Kc1TWzVF
         K+aucYHSnmnpToENpQvvEdG9d/1oSt3j0LHafmoyDD/aSpGQyqqpm7nuasHEEyNWM+c2
         75R0R6B8zqyZyzHnuS223MCxLVBECiKG9l7fgxgquhmzOpWsMUu/YQwpR0vqv8622nxw
         Wtpw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of tglx@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=tglx@linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=0nVJ78R0Bll4bj+An6dlMgy8yHO3rBjHiEgmUNcr0Mg=;
        b=N8GoklmyRZXVdmTLTSso8LchRrU9Siwhj6ZOQrTLU+1Ys8VeE6BdF1oCGzpgSS50Xh
         MIVhdnNy4smyNHXntBWa1s+XANDt1bJZHGsrKIQVOq9VZP0InPzWk3EtwHEcz9sw1o0I
         8kg24foAZU1SptDXhTt424XMVLwFs0vHXVM/4GMUj5j1mJgTUaL89TPrzRPcelypIHF7
         Eql39vALg5btUEi7g0srxan0BCQnhD9K+pXcSGyvVsZhAcWEvzdspaBHJizzF2Rrh+d5
         q91XdKT7aau1jlpbftI3aT5joRNyQJGBuomtFviezB2Qu019/pkO70CW3y30V9VzvByG
         Jm/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:in-reply-to
         :message-id:references:user-agent:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0nVJ78R0Bll4bj+An6dlMgy8yHO3rBjHiEgmUNcr0Mg=;
        b=o++JuaxVHV/Q4x0qvH5+PvdMv0WkHdHBoFAOdh3T9h9/BvozCobKGtNEjRY7WR1F2T
         6LzuT99njT04ufRgXmj9zTyaMPRk8QP5S/GWAk3oH1b+oXPyEXI7Y0DkqzzTgJ1BcYEo
         fsMZH1J5kFQN29wJqb+M9rdDD+ezIcmhwi3X2bFV2y9n349e7Y9uOKGmlWvYKP8qrL9b
         awBvMRo3suh3Ozcj6Ho2rcFFCOCHt3YpCKqKI6brM4vVL+Z69kkGhGJogrG5Bn3R45eO
         lkOh6cvsp0wgkOUFIYVzcV+SPy7LUVNa0nwjbqEzwn5y53y/LZw0VWSQJpEfLJ7vTJ9E
         YKYQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUVNUa2inr2Y15k35Qpnk4EFUjJrXRngRrIe3DQEom/L7H9bl/l
	d8otHZhrljrKze12NFfTL6Q=
X-Google-Smtp-Source: APXvYqxQ1WS3JBng78G7w4qKbUSAriB4OdN1VF0oD+bixlqQEYDG1Gj4SwuzEuZ6IFLi1EfILnn57Q==
X-Received: by 2002:a17:906:5391:: with SMTP id g17mr32986314ejo.61.1566419204624;
        Wed, 21 Aug 2019 13:26:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:cd0f:: with SMTP id oz15ls1133933ejb.4.gmail; Wed,
 21 Aug 2019 13:26:43 -0700 (PDT)
X-Received: by 2002:a17:906:fc06:: with SMTP id ov6mr32389432ejb.226.1566419203942;
        Wed, 21 Aug 2019 13:26:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566419203; cv=none;
        d=google.com; s=arc-20160816;
        b=Jc08rUrQVkRJzOeMF/laPbWUkEEYveSTUOdArrxNDBNVZrCJLVLVGEm75mIt+ZgFOR
         5zL6xDs1bNMHMA8z/Ili5+KvIaXb3e5WBzq3FaFSjOzGypc+TXN9adIDd5hD7OpO9vz/
         2iSruTCxBXZBZdSAhE03b8XK9LYoDsOvFPxYnmHdvvzmQw324O8b+cFCUb4+1szeiQ87
         YPrJeRWvFxwkW+nUtQub67PgJLaZeSyXLdqRXM/6pa1jzNW1BzEAXNc72mEC368v6X7a
         ikHbiKkbVdNVYT+L0G1wgzmtNNqQSKb4Or0aQbExoYu90pyTfQQIPxIwzAyZnppB0GF7
         QhBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:from:date;
        bh=PcSIx+DTxxa2pOvSEw+gQeGXMEZ75o7vo6/2Mxkvrf0=;
        b=i4qn2/VS38FfvbGugPolPP7yBPc6/zyVIedyDtpTV/Xhk4MZ9t/C9ygPhIWs3Pq5I6
         XdC6ttC4rEr1bCSVMOhUCxsDITWAMIrtSE9RVIfs5g4lsUQLjDWDiZega1uF98Fyy7Cp
         ej2UcYvCIYs3faz3wDITZA4W5KGdg5hHAjCRDj2vw+h03iRmIg7Xli5Knci6dG0q524d
         DoYObbdxVHvtLjwFQZtnb0u7dykMXpi+p7eNOyQff57xEdQJBa5MQ6+QTyU//DYoDvA+
         kCLHA7+xTxdDFaa9VIplR2f8ob8GGxKvpk9GdUFwC0+nCtw8sz28vdyWatrb1/rC0OqH
         C8Ow==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of tglx@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=tglx@linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de. [2a0a:51c0:0:12e:550::1])
        by gmr-mx.google.com with ESMTPS id m3si913587edq.0.2019.08.21.13.26.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 21 Aug 2019 13:26:43 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of tglx@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) client-ip=2a0a:51c0:0:12e:550::1;
Received: from p5de0b6c5.dip0.t-ipconnect.de ([93.224.182.197] helo=nanos)
	by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
	(Exim 4.80)
	(envelope-from <tglx@linutronix.de>)
	id 1i0XBh-000562-1h; Wed, 21 Aug 2019 22:26:33 +0200
Date: Wed, 21 Aug 2019 22:26:32 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
cc: Jan Kiszka <jan.kiszka@siemens.com>, Borislav Petkov <bp@alien8.de>, 
    x86@kernel.org, jailhouse-dev@googlegroups.com, 
    Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 2/2] x86/jailhouse: Only enable platform UARTs if
 available
In-Reply-To: <20190819183408.988013-3-ralf.ramsauer@oth-regensburg.de>
Message-ID: <alpine.DEB.2.21.1908212158350.1983@nanos.tec.linutronix.de>
References: <20190819183408.988013-1-ralf.ramsauer@oth-regensburg.de> <20190819183408.988013-3-ralf.ramsauer@oth-regensburg.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
X-Original-Sender: tglx@linutronix.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: best guess record for domain of tglx@linutronix.de designates
 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=tglx@linutronix.de
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

On Mon, 19 Aug 2019, Ralf Ramsauer wrote:
> @@ -11,6 +11,7 @@
>  #include <linux/acpi_pmtmr.h>
>  #include <linux/kernel.h>
>  #include <linux/reboot.h>
> +#include <linux/serial_8250.h>
>  #include <asm/apic.h>
>  #include <asm/cpu.h>
>  #include <asm/hypervisor.h>
> @@ -20,8 +21,13 @@
>  #include <asm/reboot.h>
>  #include <asm/setup.h>
>  
> +#define SETUP_DATA_FLAGS_PERMIT_PCUART(n) (1 << (n))
> +#define SETUP_DATA_FLAGS_HAS_PCUART(flags, n) \
> +	!!(flags & SETUP_DATA_FLAGS_PERMIT_PCUART(n))

TBH, this is unreadable obfuscation and there is absolutely no reason for
this to be implemented as macros. What's wrong with proper helper
functions?

static bool uart_enabled(unsigned int uartnr)
{
	return setup_data.v2.flags & BIT(uartnr);
}

That would be too simple and not enough UPPERCASELETTERS, right?

> +#ifdef CONFIG_SERIAL_8250
>  	struct mpc_intsrc mp_irq = {
>  		.type = MP_INTSRC,
>  		.irqtype = mp_INT,
>  		.irqflag = MP_IRQPOL_ACTIVE_HIGH | MP_IRQTRIG_EDGE,
>  	};
> +#endif

Errm. Why are you not moving this into the other conditional section?

>  	unsigned int cpu;
>  
>  	jailhouse_x2apic_init();
> @@ -99,12 +107,16 @@ static void __init jailhouse_get_smp_config(unsigned int early)
>  	if (setup_data.v1.standard_ioapic) {
>  		mp_register_ioapic(0, 0xfec00000, gsi_top, &ioapic_cfg);
>  
> -		/* Register 1:1 mapping for legacy UART IRQs 3 and 4 */
> -		mp_irq.srcbusirq = mp_irq.dstirq = 3;
> -		mp_save_irq(&mp_irq);
> +#ifdef CONFIG_SERIAL_8250
> +		if (setup_data.hdr.version < 2) {
> +			/* Register 1:1 mapping for legacy UART IRQs 3 and 4 */
> +			mp_irq.srcbusirq = mp_irq.dstirq = 3;
> +			mp_save_irq(&mp_irq);
>  
> -		mp_irq.srcbusirq = mp_irq.dstirq = 4;
> -		mp_save_irq(&mp_irq);
> +			mp_irq.srcbusirq = mp_irq.dstirq = 4;
> +			mp_save_irq(&mp_irq);
> +		}
> +#endif

This #ifdeffery can be avoided and that setup of the interrupts can be
split out into a helper.

static void uart_setup_irq(unsigned int irq)
{
  	struct mpc_intsrc mp_irq = {
  		.type		= MP_INTSRC,
  		.irqtype	= mp_INT,
  		.irqflag	= MP_IRQPOL_ACTIVE_HIGH | MP_IRQTRIG_EDGE,
		.srcbusirq	= irq,
		.dstirq		= irq,
  	};
	mp_save_irq(&mp_irq);
}

And then that whole thing becomes

	if (IS_ENABLED(CONFIG_SERIAL_8250) && hdr.version < 2) {
		/* Register 1:1 mapping for legacy UART IRQs 3 and 4 */
		uart_setup_irq(3);
		uart_setup_irq(4);
	}

And of course the serial fixup can use exactly the same helper.

> @@ -137,6 +149,42 @@ static int __init jailhouse_pci_arch_init(void)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_SERIAL_8250
> +static const u16 pcuart_base[] = {
> +	0x3f8,
> +	0x2f8,
> +	0x3e8,
> +	0x2e8,
> +};

Fits nicely in a single line and can just be inside of the function.

> +static void jailhouse_serial_fixup(int port, struct uart_port *up,
> +				   u32 *capabilites)
> +{
> +	struct mpc_intsrc mp_irq = {
> +		.type = MP_INTSRC,
> +		.irqtype = mp_INT,
> +		.irqflag = MP_IRQPOL_ACTIVE_HIGH | MP_IRQTRIG_EDGE,
> +	};

Can go away

> +	unsigned int n;
> +
> +	for (n = 0; n < ARRAY_SIZE(pcuart_base); n++) {
> +		if (pcuart_base[n] != up->iobase)
> +			continue;
> +
> +		if (SETUP_DATA_FLAGS_HAS_PCUART(setup_data.v2.flags, n)) {
> +			pr_info("Enabling UART%u (port 0x%lx)\n", n,
> +				up->iobase);
> +			mp_irq.srcbusirq = mp_irq.dstirq = up->irq;
> +			mp_save_irq(&mp_irq);
> +		} else {
> +			/* Deactivate UART if access isn't allowed */
> +			up->iobase = 0;
> +		}
> +		break;
> +	}
> +}
> +#endif
> +
>  static void __init jailhouse_init_platform(void)
>  {
>  	u64 pa_data = boot_params.hdr.setup_data;
> @@ -187,7 +235,8 @@ static void __init jailhouse_init_platform(void)
>  	if (setup_data.hdr.version == 0 ||
>  	    setup_data.hdr.compatible_version !=
>  		JAILHOUSE_SETUP_REQUIRED_VERSION ||
> -	    (setup_data.hdr.version >= 1 && header.len < SETUP_DATA_V1_LEN))
> +	    (setup_data.hdr.version == 1 && header.len < SETUP_DATA_V1_LEN) ||
> +	    (setup_data.hdr.version >= 2 && header.len < SETUP_DATA_V2_LEN))
>  		goto unsupported;
>  
>  	pmtmr_ioport = setup_data.v1.pm_timer_address;
> @@ -203,6 +252,20 @@ static void __init jailhouse_init_platform(void)
>  	 * are none in a non-root cell.
>  	 */
>  	disable_acpi();
> +
> +#ifdef CONFIG_SERIAL_8250
> +	/*
> +	 * There are flags inside setup_data that indicate availability of
> +	 * platform UARTs since setup data version 2.
> +	 *
> +	 * In case of version 1, we don't know which UARTs belong Linux. In
> +	 * this case, unconditionally register 1:1 mapping for legacy UART IRQs
> +	 * 3 and 4.
> +	 */
> +	if (setup_data.hdr.version > 1)
> +		serial8250_set_isa_configurator(jailhouse_serial_fixup);

If you put that into a helper and stick that into the above #ifdef with a
stub for the CONFIG...0=n case then you keep that init function readable
and not plastered with that UART stuff.

Thanks,

	tglx

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/alpine.DEB.2.21.1908212158350.1983%40nanos.tec.linutronix.de.
