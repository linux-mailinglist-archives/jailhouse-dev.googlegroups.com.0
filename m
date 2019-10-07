Return-Path: <jailhouse-dev+bncBCP4ZTXNRIFBBQ6O5XWAKGQEITVHOCQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA96CE922
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Oct 2019 18:26:43 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id t11sf7761100wro.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Oct 2019 09:26:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570465603; cv=pass;
        d=google.com; s=arc-20160816;
        b=YFYa5HxUdUtUr/B5xs7++z5INzjOp5ssG779hW2ZrEBJfAEUcCEZ9tx+94PkP6JFsY
         F2dC4M7Xkl64vCA0IkLDUlhMHWRFnNg067f2PO1pNdcUGqD4VZ+fHTYGKiDOa30V3Rcb
         Nw/5Zw8xqn3arWAHDd+l+LPolNxy13rOIWRQV+ndZATd3VqzehQAfzmpXN+X696j68Wg
         QMHS2Uw5QDQ4PYh4D9GnPGqFfe+i7Za1gLzWyQ2FCmy56gDkC+KCFeEHeTFQDzmKX8Mw
         wvSp9ryjOOKMaszNv7Om27SPSbbGNoCi8wQ3/dZgVR/VytCSPNR5FbzdiqVVcV0kSnTe
         695w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:sender:dkim-signature;
        bh=2aYFwE1j9+JUcX7EGhwVY5vuRmUdZ1GeOnIaFw94uO4=;
        b=KJt7nT7tCgQAegByJwO79O0lL3+LrwsfHjRt0lpMkCiVQZp49aOUolgQgNIismQzbR
         0GQz2h+cuFML9vzB5iWmZDPU+S686oG0fYjgFD4JlojnyusqoebUp7FJzqi3z16JYurO
         3SrUoCI2qeDOaKBtlYeAXXPO+O+J4ONCc3uolpTLWoNpaD6Yl+AyDIais1L4nOEud4P5
         0RfTTkdOKOIVBAb8i3Q1BqW5LJAV4siBaS7WJyP9oNE/AOWc8lmmZPvDuWcSuEVIemHJ
         XdNc525VUDJNL0aSuVAGqGNurbqp9DZuafI3g7OhXLSAVqu/EQzpNXBGqIlP9UeQijTH
         obSA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@alien8.de header.s=dkim header.b=I3AvTecs;
       spf=pass (google.com: domain of bp@alien8.de designates 5.9.137.197 as permitted sender) smtp.mailfrom=bp@alien8.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=2aYFwE1j9+JUcX7EGhwVY5vuRmUdZ1GeOnIaFw94uO4=;
        b=ZEa8nCwZY6ASWzydN4ikv9B4aH9qaRI09X9UP4ZmAF/vZcTcQBftvos5Qtn0J7ktHT
         gXJKxgpRJXAoaNpUPc5l0BvtjCQ5ZoJ4ku7RazyeObsjJpRQx5Wh5YTJWkWS8CbLgOpl
         7A18szdxGSHv6bLp2AZlgakoEr459ToKNI/xL8ZVwHzfWiRNHRzEjYUh1MhdNOfgPgXO
         QkVIeyI2XXMEkzs1WAdgBlg5VJDSzfSPWgt8FUMYtku7dLV44+JqFGXxjV93PpgTNnjq
         oVHrApZS3w0wkB3n5r+hkl1WVO5CIKiHNLo8oQiV0wm9dSHd38+ZIRIHl7Er5RwVF+eZ
         Ncjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=2aYFwE1j9+JUcX7EGhwVY5vuRmUdZ1GeOnIaFw94uO4=;
        b=ZfChWC2k7/w4Jrr/wfHOU1CjBweD+ybWGmPZNPfblrglVR+6/kdxBWxfcn7zupwdOP
         nsTHRcpAU6Dp6tAL0jgcBdoyvBkOsHZfKEFUAUXjKg2Pvs+y5oZ21f3RLtgiohrtqeze
         RWfBXbB+CJUlB7uqmJXihORas4CwVZE55KxLrb22cUoUgWd1DcS4z1jFPLpsIE9Yzggh
         CeXKhLTa9VUEylQiBh/1UoIPuZYorj5kws54gUAaBJ+oc9P624EXF+Zf7mAVbhwMq9dp
         8ZquhWfchzrPgiuZT8TBN+KkxnobUnu9MM3YtRemPb3/dRkG4JncQNLLGDL1zMmguX6j
         Y/ew==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW9lNoFwum8Bz7NvNjqac96Xx+KPmSiCQVjJydGcx7g32XFyA8k
	1ADGU7af4X5nCLiXP5WUojE=
X-Google-Smtp-Source: APXvYqyOti5U0Bm+AxF7JCCEZkiwduUnMkyZAgOdEThJk4pesrA7SR7A9GlaVXPf4f00xp1q8aq+8A==
X-Received: by 2002:a1c:9e46:: with SMTP id h67mr128326wme.48.1570465603269;
        Mon, 07 Oct 2019 09:26:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cf01:: with SMTP id l1ls38346wmg.0.gmail; Mon, 07 Oct
 2019 09:26:42 -0700 (PDT)
X-Received: by 2002:a1c:2bc7:: with SMTP id r190mr73108wmr.143.1570465602788;
        Mon, 07 Oct 2019 09:26:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570465602; cv=none;
        d=google.com; s=arc-20160816;
        b=eLckJhU4l6NEbPWGsajKFRrEOw1JZCBOpmu3GZfqQQpo0TDy9vy44RI3brdm7LpUdZ
         +4X5gQ7xi6zwuIayK4Uh5ShQe0Po3G7BXFo6fr7RKLxzgwlpmn5rRy5EJOHFDrdbF4Ml
         C4SmWZggMZ1LBDK0ytcSDNcUIo3AAmg/qxC0jffvvv6xs0AKPGSOlAgZ/nv1Ysxs/UaZ
         hXSU6hV3fQHMFAKApSp5JreTGjBf9KukKX3LuxgjP8Omub/pS0uI1tHiU2qgikrymjAM
         bXRb3JVEk+Oaac5soZhQrOXi48bsDcDcD0vGM5/rnVZkunIAiZuZfAA77D/AGWmDpN0D
         1jEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=XL20VwtPRbGDGcN+4iS4qA165VAWOZtyxaE4mR0KPqk=;
        b=Gp/OTzydy5XmuPzXCpEiiZt84p954jv+PIsoDBaFoKiYPgNTaLT8LlkJsWVtfuCdJP
         ldoStYfKkf8NjpfCOx2bK7mCmbeWteMdwYUnTMIVnHf1ih+N81oOe/O3ne18dpitEYmy
         2hK3bby9LTVN/aUC/pOniTG5npzd8Sx/mV1zDhZ+yOYgUUhE2yZLZP3FHThwS7G+jXyk
         VapOYcEM6D3JZsKxjWIljImCjlhMfwK/yHMhCxl/Ew0Afq9m++9hU36FQGfHvP5xczko
         DluA9VhLjGc5Bt+CbCy2ZdFW5wyZMwf9p4aQ7wywxruTtrOuFrKyg7L0DpxsRr6tD90a
         foEw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@alien8.de header.s=dkim header.b=I3AvTecs;
       spf=pass (google.com: domain of bp@alien8.de designates 5.9.137.197 as permitted sender) smtp.mailfrom=bp@alien8.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=alien8.de
Received: from mail.skyhub.de (mail.skyhub.de. [5.9.137.197])
        by gmr-mx.google.com with ESMTPS id m1si726132wrs.0.2019.10.07.09.26.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 09:26:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of bp@alien8.de designates 5.9.137.197 as permitted sender) client-ip=5.9.137.197;
Received: from zn.tnic (p200300EC2F06420085D86D94306C6599.dip0.t-ipconnect.de [IPv6:2003:ec:2f06:4200:85d8:6d94:306c:6599])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 55BE21EC0C2B;
	Mon,  7 Oct 2019 18:26:38 +0200 (CEST)
Date: Mon, 7 Oct 2019 18:26:36 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, x86@kernel.org,
	jailhouse-dev@googlegroups.com, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v5 2/2] x86/jailhouse: Only enable platform UARTs if
 available
Message-ID: <20191007162636.GD24289@zn.tnic>
References: <20191007123819.161432-1-ralf.ramsauer@oth-regensburg.de>
 <20191007123819.161432-3-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20191007123819.161432-3-ralf.ramsauer@oth-regensburg.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Original-Sender: bp@alien8.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@alien8.de header.s=dkim header.b=I3AvTecs;       spf=pass
 (google.com: domain of bp@alien8.de designates 5.9.137.197 as permitted
 sender) smtp.mailfrom=bp@alien8.de;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=alien8.de
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

On Mon, Oct 07, 2019 at 02:38:19PM +0200, Ralf Ramsauer wrote:
> ACPI tables aren't available if Linux runs as guest of the hypervisor
> Jailhouse. This makes the 8250 driver probe for all platform UARTs as
> it assumes that all platform are present in case of !ACPI. Jailhouse

I think you mean s/platform/UARTs/ here.

> will stop execution of Linux guest due to port access violation.
> 
> So far, these access violations could be solved by tuning the
> 8250.nr_uarts parameter but it has limitations: We can, e.g., only map

Another "We" you can get rid of.

> consecutive platform UARTs to Linux, and only in the sequence 0x3f8,
> 0x2f8, 0x3e8, 0x2e8.
> 
> Beginning from setup_data version 2, Jailhouse will place information of
> available platform UARTs in setup_data. This allows for selective
> activation of platform UARTs.
> 
> This patch queries the setup_data version and activates only available

s/This patch queries/Query/

> UARTS. It comes with backward compatibility, and will still support
> older setup_data versions. In this case, Linux falls back to the old
> behaviour.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  arch/x86/include/uapi/asm/bootparam.h |  3 +
>  arch/x86/kernel/jailhouse.c           | 83 +++++++++++++++++++++++----
>  2 files changed, 74 insertions(+), 12 deletions(-)

...

> @@ -138,6 +147,53 @@ static int __init jailhouse_pci_arch_init(void)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_SERIAL_8250
> +static bool jailhouse_uart_enabled(unsigned int uart_nr)
> +{
> +	return setup_data.v2.flags & BIT(uart_nr);
> +}
> +
> +static void jailhouse_serial_fixup(int port, struct uart_port *up,
> +				   u32 *capabilities)
> +{
> +	static const u16 pcuart_base[] = {0x3f8, 0x2f8, 0x3e8, 0x2e8};
> +	unsigned int n;
> +
> +	for (n = 0; n < ARRAY_SIZE(pcuart_base); n++) {
> +		if (pcuart_base[n] != up->iobase)
> +			continue;
> +
> +		if (jailhouse_uart_enabled(n)) {
> +			pr_info("Enabling UART%u (port 0x%lx)\n", n,
> +				up->iobase);
> +			jailhouse_setup_irq(up->irq);
> +		} else {
> +			/* Deactivate UART if access isn't allowed */
> +			up->iobase = 0;
> +		}
> +		break;
> +	}
> +}

WARNING: vmlinux.o(.text+0x4fdb0): Section mismatch in reference from the function jailhouse_serial_fixup() to the variable .init.data:can_use_brk_pgt
The function jailhouse_serial_fixup() references
the variable __initdata can_use_brk_pgt.
This is often because jailhouse_serial_fixup lacks a __initdata 
annotation or the annotation of can_use_brk_pgt is wrong.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191007162636.GD24289%40zn.tnic.
