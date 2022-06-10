Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBZ42RWKQMGQEMENBGDQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ua1-x93d.google.com (mail-ua1-x93d.google.com [IPv6:2607:f8b0:4864:20::93d])
	by mail.lfdr.de (Postfix) with ESMTPS id C46C45467CF
	for <lists+jailhouse-dev@lfdr.de>; Fri, 10 Jun 2022 15:55:52 +0200 (CEST)
Received: by mail-ua1-x93d.google.com with SMTP id 75-20020a9f23d1000000b0036579695596sf12978139uao.7
        for <lists+jailhouse-dev@lfdr.de>; Fri, 10 Jun 2022 06:55:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1654869352; cv=pass;
        d=google.com; s=arc-20160816;
        b=NB5rUlQ45aepkrPwtVhfHVS6P/m6PYIdFL3B6fIFnqj5mma7nGjtsAa6hsRM2I7nUv
         kqHTQOM2kuAKtBBH2sXLeLtOnrRQvG1aCz5S9nwqa16g78TBhynOiIRAoG7g9AiXN6FQ
         ltAWzrXHSVeeoVs05rwgQ7C7FWHMsbbIIn7TgtI0EA0278BZ+Hqt/BrgRONuYcFM0UbF
         JJOLUFMSSAbJCWhBQB7lOI+3pd/uQqTQ3Kkpq5+T2G2Ufg/vvr+6XUT3Ko6EgkVab77o
         q3zcgCryTWpEzoWRhQBkdgHE25pBU5w2+uYL0TtPuEsWiUizmXgO7p5Vx2BTog82eqB/
         1d/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=r8GR9+b2h1WPbcHNnwsJoLRaDR7UkhzXqXlVBWG5Da8=;
        b=B2xNkzAWRgcWnKk36gDAAD+T38RXGAiCXytEo18NQ0DETsSjlDH2NSUD0Z6SBjsa0S
         7quidLdEzQIcWj+OANYK5+hBHFmlw+IbzzfZn/97/cADpf3XPRLjV+4ediFhX4LBsyqJ
         WdwSb85TBeslMDTHH9mfgjBV2d8X3WQOXtmILwVGhznwo/Sv2hLBl3UEOYZW2y/Q3tpy
         dPzBX9/06End1G9lWRbGV3zaGSoysbn7010AqaMwqFDxIWcm/UjwLU27Ff3XhPNWam+N
         J+XBmIdE197rKMDk9/Xy2HaKE5em0qauXRfZ/nq8kFi+UFgTYX2xzFneWlj26h0GVLWW
         FMFw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=S9zg9D9s;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1133 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=r8GR9+b2h1WPbcHNnwsJoLRaDR7UkhzXqXlVBWG5Da8=;
        b=hdRmtZvj07Yj6dYONWOZlpZ7aLyUZ7dcD/YVxiLefF6aDKjCH03NuRicGCjQ6oBPAY
         JaZoy9IZ18Y2YPYmWakzQieQFzTMUTFftGr4tVUpD/cIA/nc28otxx03B6/WYzz3vMKy
         G8DfUUVj6DOZHAZbPYNjvAI4lKrHyNVXK3Z4GirHQZeH/PT2PrN2sXveik3WCSS/+D9D
         qV0H0quVNuzXd1FCMWI4OEA7J5Rv498dagfIkA8YnhFk58iUColiCVae5ithMwKDV2YC
         KyoOlbn1JwHtAUFQJPjS9C8j12rh048qHyfKZt7fOSNM4c6qKrEyilrihPRjvPLbVV76
         BhBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=r8GR9+b2h1WPbcHNnwsJoLRaDR7UkhzXqXlVBWG5Da8=;
        b=V1MXaYhUeY8aXCehyhEIuY3WRr608KAmHdl/LkvJzxelDGyiT4DuQR9+LB1E7kmItd
         m5LaHmSeY+72OxSS7IjTwWWe/MqqKwZKfPnlYVwvQhyNf/TQKeM8dD4CYnGSzeR2Sjg/
         EUzVG/NqDnPJVb04GQ7gh+kbN3/jdMysNCzmjn+kE0XTjdfaeXKvcmVX7J39XWKq/gL/
         hqgDIx9y3N5X4t35HUYGoGNdzMyjpLNsbsAXcw40vlZMa/3m4tlNXtDe+EiP9QkhY3Cw
         B0tySFfRdxlFVRvTDZkLlyLWeOx3G0jpCdoaqi/0z4Q4OBTRwQpfVKUZ7ZIoVP5gAz/D
         RQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=r8GR9+b2h1WPbcHNnwsJoLRaDR7UkhzXqXlVBWG5Da8=;
        b=ElCbW8HpVP4DUZCtzG8B1FmA06sQpBQAl35xGethHOT0rtll6i3B5IxWl7aS4/zpzt
         dqVQRwIO3hUN0zSg4CozTvRyYRem4r8lzHt58XntsufjLTlhXkM0bgJsz8CCdq/3HCoT
         yNLdVL1CRNft7RsCtZth9WMnl13uFjfwU+vakMcRw5X9bakJCId9qW2pwi6JHKn+igrv
         380SA6XxcHI5gh9Rui7tEdm0nRtN794QOnnSD2xheW4IHIZWPRTehtc8ZClewNLT89qx
         17Unqiv8tCKll262NqssnuOBt0wJ+/+KazuWmrgqq/303U+/550pgCqOyhoNy5F/hEIr
         MNJA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531PEAJ7fmdq0RUST4XFWeJQv5QXNDqY7sxldafPmfEIB38s4ryJ
	v1XO+y7BCrTT2nndSrln/Oc=
X-Google-Smtp-Source: ABdhPJyXmey1uLmzkTY8WH7B5PjH+ySezV5pGPRWYf8IlnoVqvMdZGmJvG6ebnaAWTk1dkTxf+qZhw==
X-Received: by 2002:a67:67c4:0:b0:349:d230:9039 with SMTP id b187-20020a6767c4000000b00349d2309039mr20487070vsc.70.1654869351751;
        Fri, 10 Jun 2022 06:55:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:5b8c:0:b0:34a:41cf:8221 with SMTP id y12-20020ab05b8c000000b0034a41cf8221ls1590956uae.5.gmail;
 Fri, 10 Jun 2022 06:55:50 -0700 (PDT)
X-Received: by 2002:ab0:64c1:0:b0:378:fd90:d62d with SMTP id j1-20020ab064c1000000b00378fd90d62dmr10031451uaq.61.1654869350795;
        Fri, 10 Jun 2022 06:55:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654869350; cv=none;
        d=google.com; s=arc-20160816;
        b=sDfoioGWIZ6p/uWA69aQDPIYaxy39Op/CCj6FubkPVbPnMNUjIMcz9nJHd4Ikgrvoa
         GYI+2JoWkAS+10oVjHQ0Y9VmbOcJ0IRD7Tc3XC6r+dHQKIh7T9QOalSNLagvscLldRWe
         OQPY4ysYctUGHTz9EYN5ITGGGrH6AKiRV//LowHCd85E5Yyk1cXrE1oOK2ah3Za7KolK
         r3sFrMekPbtEuQgW3eTP5AkxIY9+q8VzziAgMsbHKU+YBKqMoIsoFGRlC8T9BEObR0HS
         DVbA3kmrLo1KKZlLEAiLark9xW8ThjivcdfHe1M/tiHEvR1uN0OXXmoZB6gAiq659uDL
         gQHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=RMwa663sZzG0vJ6Hw3PKBf3JlUnuERHzAr+EVjRpyLQ=;
        b=ZknlHNehvtCggzTszFGWMFYEdTTHSPJOSLtZvVHcX9ObwhG5VEtuLstUTKHHwEDKdj
         4KK4+krVZAjH3WHR4cFsDxoxy60mSZJBd84+PMpLi02eTtwXMjj8sGDQ/sm25i8jnWVO
         EXQK3YWI+Lbz8QH4QwKV/WjRV1OCbkvV76Cu2HsSQB/wVeIrZMiIlrOkF1MTJn27PaFE
         te/Se8UEt6aeUIctO5PzVyDxI5Zy9lJS2K33ZQgNCABw+WXQNlDy2qRRpxISjNwIZZyN
         J1jhBV61jyoPFlY2XnjWwPe5P0av6uGQMG840s3jIKxMjLUZ2hgjrA/X+NSk5SMuenqM
         idqw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=S9zg9D9s;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1133 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com. [2607:f8b0:4864:20::1133])
        by gmr-mx.google.com with ESMTPS id h14-20020ab0334e000000b00378e80fec38si751620uap.2.2022.06.10.06.55.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jun 2022 06:55:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1133 as permitted sender) client-ip=2607:f8b0:4864:20::1133;
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-30c2f288f13so272827787b3.7
        for <jailhouse-dev@googlegroups.com>; Fri, 10 Jun 2022 06:55:50 -0700 (PDT)
X-Received: by 2002:a81:60c6:0:b0:30f:ea59:10c7 with SMTP id
 u189-20020a8160c6000000b0030fea5910c7mr47645472ywb.78.1654869350253; Fri, 10
 Jun 2022 06:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <003480a3-4384-45f2-87c6-e7badb3ef40an@googlegroups.com>
In-Reply-To: <003480a3-4384-45f2-87c6-e7badb3ef40an@googlegroups.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 10 Jun 2022 14:55:23 +0100
Message-ID: <CA+V-a8vEOGdMrNyJOo=ad3JLAe4joXmNnz+n_oJboW3rPdh8qA@mail.gmail.com>
Subject: Re: Linux inmate not receiving interrupts
To: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=S9zg9D9s;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2607:f8b0:4864:20::1133 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

Hi,

On Mon, Jun 6, 2022 at 8:29 PM Prabhakar Lad <prabhakar.csengg@gmail.com> wrote:
>
> Hi,
>
> I have the below setup for Linux inmate:
> * Use initramfs
> * UART is enabled
> * eMMC is enabled
>
> In the inmate cell I have the below:
>     .irqchips = {
>         /* GIC */ {
>             .address = 0xf1010000,
>             .pin_base = 128,
>             .pin_bitmap = {
>                 1 << (153+32 - 160), /* SCIF1 - SPI153 */
>             },
>         },
>         /* GIC */ {
>             .address = 0xf1010000,
>             .pin_base = 160,
>             .pin_bitmap = {
>                 1 << (168+32 - 192), /* SDHI3 - SPI168 */
>             },
>         },
>     },
>
> And in the inmate DTS I have the below:
>
>         scif1: serial@e6e68000 {
>             compatible = "renesas,scif-r8a774a1",
>                       "renesas,rcar-gen3-scif", "renesas,scif";
>             reg = <0 0xe6e68000 0 0x40>;
>             interrupt-parent = <&gic>;
>             interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
>             clocks = <&cpg CPG_MOD 206>,
>                  <&cpg CPG_CORE R8A774A1_CLK_S3D1>,
>                  <&scif_clk>;
>             clock-names = "fck", "brg_int", "scif_clk";
>             power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
>             resets = <&cpg 206>;
>             pinctrl-0 = <&scif1_pins>;
>             pinctrl-names = "default";
>         };
>
>         gic: interrupt-controller@f1010000 {
>             compatible = "arm,gic-400";
>             #interrupt-cells = <3>;
>             #address-cells = <0>;
>             interrupt-controller;
>             reg = <0x0 0xf1010000 0 0x1000>,
>                   <0x0 0xf102f000 0 0x20000>,
>                   <0x0 0xf1040000 0 0x20000>,
>                   <0x0 0xf106f000 0 0x20000>;
>             interrupts = <GIC_PPI 9
>                     (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
>         };
>
> When Linux is started on the inmate cell, I can see its booting through but it doesn't  fall into shell.
>
> --- a/drivers/irqchip/irq-gic.c
> +++ b/drivers/irqchip/irq-gic.c
> @@ -341,6 +341,9 @@ static void __exception_irq_entry gic_handle_irq(struct pt_regs *regs)
>                 irqstat = readl_relaxed(cpu_base + GIC_CPU_INTACK);
>                 irqnr = irqstat & GICC_IAR_INT_ID_MASK;
>
> +               if (irqnr < 1020)
> +                       pr_err(">>>>>>>>>>>>>>>>%s We received IRQ:%u<<<<<<<<<<<<<<\n", __func__, irqnr);
> +
>                 if (unlikely(irqnr >= 1020))
>                         break;
>
> I added the above and I can see the Linux inmate receives only 0/1/27 interrupts.
>
> Which gives me a feeling the Linux inmate isn't receiving the required interrupts.
>
> Any pointers on where I should be looking into?
>
Ive fixed this by updating the GIC masks.

Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8vEOGdMrNyJOo%3Dad3JLAe4joXmNnz%2Bn_oJboW3rPdh8qA%40mail.gmail.com.
