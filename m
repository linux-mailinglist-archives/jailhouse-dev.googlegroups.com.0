Return-Path: <jailhouse-dev+bncBDOPPN7U7ANRBRMVYCIQMGQEUQJMCGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ua1-x93d.google.com (mail-ua1-x93d.google.com [IPv6:2607:f8b0:4864:20::93d])
	by mail.lfdr.de (Postfix) with ESMTPS id 095974D9317
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Mar 2022 04:40:55 +0100 (CET)
Received: by mail-ua1-x93d.google.com with SMTP id v26-20020ab0291a000000b0034c27f7b727sf9028774uap.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Mar 2022 20:40:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1647315654; cv=pass;
        d=google.com; s=arc-20160816;
        b=DgXokKwQuSokWcEYRfRuwHjIutFaa8JcfBtFfEHPdQRZ/i+6cQQ1JZFX0+lM6YIIvo
         fi3/hjL/gXi9CAhVLHpR8HkEjf62+JvZtdUNoZNqIULN/uhJSBSJRb4gih3ek3bwrCP8
         s18KGyGkyp1zBUHfn/cqDdnYwNNrkR6bv/5my38NJoqWrIHxsofXZxALQVpUGZ94o+pB
         g3O9oJNdikrLb16cCp4mZF5tru0djq1WCJ90/xwdTvCTnrsjKRTTRDOAQK6I8kLhRkZa
         qBbCSJ2dTSn+5h5SWnWE4Ae5Yn+KoSpJY9xOOYARqO83FXKmUgYY1ucY5HcoB56MlnUl
         KAZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=RSH1RPBAQ902pTSDFN7Qv7gAlMXip2nsJGAyNHV9s4k=;
        b=S1uW1i1Pgx/pppfkjt/yEm83HROqwZGQGSC61oMoclG+k/wnzE/+4vK3EjDThdoQM+
         R8UtbWVeJe69Li+Ds3k9JZRJ6NiFZDuDdRh/eQYGjBmrfXy/TPElKgZxOFO4gW7pkPs8
         gBq5DSQwgt9Z2x1vo2Kja8WGrR7n5UNRDdAWo5w4wW88Yn6pEUWJH035JLhAaIFgi9mJ
         +i7v2O+aBNJIDwmsca/2gDHVIHzlyr07Re0THsued1U/iSSZB0qZQ7Nb2xfUVNThILDJ
         IGOMiOCVWQk23XD3tw9J3SRnvQnTv0KVwBuUX/EJ9AcJ01DC1iJgfWMiN6Lek3+6ytzm
         miyw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OlbcCMNk;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=RSH1RPBAQ902pTSDFN7Qv7gAlMXip2nsJGAyNHV9s4k=;
        b=OIWL7Err25rf74X+U6IFnumA6t/CEA+k/Yyheoiq3dbc0QKuhL84YLjptUASHmvuj4
         9+b63fF2XhsJVg+oEXPOdZ3Z7G4xV/NrrWANK59GzUzcP7Y8yDMdgNikStYG5LPBK7Xd
         vBME936KXdgQyieiXOVa49yyGlYdL5I6uxryRgQdVaK3pOcHTKhte8FRiPWjYp9AJq0I
         pwr606G5cL/cEy5npDza/YWyvjfptyBsnTErhVDvj28hBc4IWpr5pBmFv4W3v6GxxKo5
         lMVchiCp0hNm1us7ALu0uRf9Tmz+62jsNE0GCKBSFhumdbklYtuw72bQnb/Lh01R1YMI
         75ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RSH1RPBAQ902pTSDFN7Qv7gAlMXip2nsJGAyNHV9s4k=;
        b=QRzvo7c0M0LaN1zlys95f0Yovrd6JseT0c/ideCqRM+frrIY2FKJ8uT1LJsPAKTzNJ
         wc8QWNEJi394jgy3sHolkLe6F0Yva0aVljBeAnd1hZToYo8PJILV2+iyJBUK1w416oJE
         a9/szWN0hayIDal+9MYrdDSgf6Dwy70q6tOIXlUHoqsO7+uRv+rI1K3EWhUk59pUOidM
         Xkf71o6+itJPSKcFY7gCN1McdaJvVJgXVYeh3IG9auaVYXro8ikDhuwUQ/zjXBcd23pV
         uNsPyqZWCayMrj1zhT/sdz8bOr+sgxm8LMJmmkOLcGt+KY7Bgryc4UrDY6+HsUtpPHRC
         jWRQ==
X-Gm-Message-State: AOAM531w4xT1alpjGsl22MvGw+jMFti59ECjWQL+/kT33FNNvCg6/07K
	ShySHd9plbMKJZTZfxk43Sc=
X-Google-Smtp-Source: ABdhPJwbtXeLIH69x1xXiZg1nphi4fcZC/Lqb7hpeSRAnBYVoR2Hn1x3IxGkdeEk7KdxUygHc+rS2A==
X-Received: by 2002:a67:fb87:0:b0:320:bd8a:f24c with SMTP id n7-20020a67fb87000000b00320bd8af24cmr11240867vsr.51.1647315653787;
        Mon, 14 Mar 2022 20:40:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1f:9b14:0:b0:337:6cb5:5ee7 with SMTP id d20-20020a1f9b14000000b003376cb55ee7ls1010446vke.0.gmail;
 Mon, 14 Mar 2022 20:40:53 -0700 (PDT)
X-Received: by 2002:a05:6122:88a:b0:332:6860:7b1f with SMTP id 10-20020a056122088a00b0033268607b1fmr10781257vkf.25.1647315652955;
        Mon, 14 Mar 2022 20:40:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647315652; cv=none;
        d=google.com; s=arc-20160816;
        b=j8L3qzkFYWtznQ+FrlyF5Nf+XfDRVrYD8CaNsK8LQl8Sow84oolM9ywUaQKsCp1yFK
         9NO8F9foQYN3x3/wQyDOYzB/jEJgFiSKBwTJ7sgnymtr3KcXKBaz/WpEizgGv3N5GWph
         sIIoY9jEWhaQxNsBZi5ps24RM+4ndkyfBWIq0F+22dCDjSqViSDtvEPLwRuHO+YADYqI
         8IEn+nXLOD1mOrvzjWyG7VA0EOVixWe3F7oX3X0V+hYo60C4hOZGgSUlV7j4oKeY16lh
         a7uifozcMbnxh/C3Q8yD2Y9H1Oe1XASMo2n4SVyXbNUrjbptCWzG6pzjPsMhlZNGqvVu
         JZkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=6Wb1HQ76WJ7oL7u0RdkKjX5jOLcameBwUPlwAyeo5wo=;
        b=RFrKO3pRw7ZXfDQDG3yd0ZNzioBujEz9GmxeJM8Pf3XqTBMLbMkBVebsPi/8IAOBxt
         UFR50KojKcom5Jny9X3g8p8N9NSq90PBwIFHS2+g74sEK29iP1l+v89Vo9APQaUqWr4e
         EBDFXfAxVmozNqMRFjIB2sTQebADn4XhDYYYre9P9hDMRfj/SKTKf98AN5ZZm+Orury6
         TYrdaZtwseMRkq+y9PhtV7883/+BKigizNOY00g4nkgTbm7xOHqG12+6nB4LmEuUmB/Y
         /BXWhL+XE3kWY2VM22M+r926o/IUwJreOVQQs63M6wsFGntbRiLe88DBMd24/xpxKO2S
         fdEw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OlbcCMNk;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id s80-20020a1f9053000000b00336e84b93c0si1096208vkd.4.2022.03.14.20.40.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Mar 2022 20:40:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of mranostay@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22F3eqHN120553;
	Mon, 14 Mar 2022 22:40:52 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22F3eql4023788
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Mar 2022 22:40:52 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 14
 Mar 2022 22:40:51 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 14 Mar 2022 22:40:51 -0500
Received: from ubuntu (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with SMTP id 22F3en4h042463;
	Mon, 14 Mar 2022 22:40:50 -0500
Date: Mon, 14 Mar 2022 20:40:46 -0700
From: "'Matt Ranostay' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
CC: <jailhouse-dev@googlegroups.com>
Subject: Re: [PATCH v4] configs: arm64: add emmc inmate configuration for
 k3-am654-idk
Message-ID: <20220315034046.GA2558@ubuntu>
References: <20220314152209.5859-1-mranostay@ti.com>
 <bda0b499-e98d-2207-6adb-5baa8d9811cc@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <bda0b499-e98d-2207-6adb-5baa8d9811cc@siemens.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: mranostay@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=OlbcCMNk;       spf=pass
 (google.com: domain of mranostay@ti.com designates 198.47.23.248 as permitted
 sender) smtp.mailfrom=mranostay@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Matt Ranostay <mranostay@ti.com>
Reply-To: Matt Ranostay <mranostay@ti.com>
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

On Mon, Mar 14, 2022 at 06:31:38PM +0100, Jan Kiszka wrote:
> On 14.03.22 16:22, 'Matt Ranostay' via Jailhouse wrote:
> > Add eMMC support for k3-am654-idk in a linux inmate cell using
> > CONFIG_AM654_INMATE_CELL_EMMC macro, and respective device tree
> > changes.
> > 
> > Signed-off-by: Matt Ranostay <mranostay@ti.com>
> > ---
> > 
> > Changes from v1:
> > * Split out eMMC enablement to its own inmate configuration
> > 
> > Changes from v2:
> > * Recombined eMMC enablement to one configuration that is enabled
> >   with ENABLE_INMATE_CELL_EMMC define
> > * Dropped patches that were already merged
> > 
> > Changes from v3:
> > * Rename ENABLE_INMATE_CELL_EMMC to CONFIG_AM654_INMATE_CELL_EMMC
> > 
> 
> How about the memegion array size diff?
>

Tested with CONFIG_AM654_INMATE_CELL_EMMC undefined and the null/empty memory
regions are handled correctly (e.g. no segfaulting in the hypervisor, etc).

Matt

> Jan
> 
> >  .../arm64/dts/inmate-k3-am654-idk-emmc.dts    | 45 +++++++++++++++++++
> >  configs/arm64/k3-am654-idk-linux-demo.c       | 22 ++++++++-
> >  2 files changed, 66 insertions(+), 1 deletion(-)
> >  create mode 100644 configs/arm64/dts/inmate-k3-am654-idk-emmc.dts
> > 
> > diff --git a/configs/arm64/dts/inmate-k3-am654-idk-emmc.dts b/configs/arm64/dts/inmate-k3-am654-idk-emmc.dts
> > new file mode 100644
> > index 00000000..150e31fe
> > --- /dev/null
> > +++ b/configs/arm64/dts/inmate-k3-am654-idk-emmc.dts
> > @@ -0,0 +1,45 @@
> > +/dts-v1/;
> > +
> > +#include "inmate-k3-am654-idk.dts"
> > +
> > +/ {
> > +	sdhci0: mmc@4f80000 {
> > +		compatible = "ti,am654-sdhci-5.1";
> > +		reg = <0x0 0x4f80000 0x0 0x260>, <0x0 0x4f90000 0x0 0x134>;
> > +		power-domains = <&k3_pds 47 1>;
> > +		clocks = <&k3_clks 47 0>, <&k3_clks 47 1>;
> > +		clock-names = "clk_ahb", "clk_xin";
> > +		interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
> > +		mmc-ddr-1_8v;
> > +		mmc-hs200-1_8v;
> > +		ti,otap-del-sel-legacy = <0x0>;
> > +		ti,otap-del-sel-mmc-hs = <0x0>;
> > +		ti,otap-del-sel-sd-hs = <0x0>;
> > +		ti,otap-del-sel-sdr12 = <0x0>;
> > +		ti,otap-del-sel-sdr25 = <0x0>;
> > +		ti,otap-del-sel-sdr50 = <0x8>;
> > +		ti,otap-del-sel-sdr104 = <0x7>;
> > +		ti,otap-del-sel-ddr50 = <0x5>;
> > +		ti,otap-del-sel-ddr52 = <0x5>;
> > +		ti,otap-del-sel-hs200 = <0x5>;
> > +		ti,otap-del-sel-hs400 = <0x0>;
> > +		ti,trm-icp = <0x8>;
> > +		dma-coherent;
> > +	};
> > +};
> > +
> > +&mcu_uart0 {
> > +	power-domains = <&k3_pds 149 1>;
> > +};
> > +
> > +&k3_pds {
> > +	#power-domain-cells = <2>;
> > +};
> > +
> > +&sdhci0 {
> > +	/* eMMC */
> > +	non-removable;
> > +	ti,driver-strength-ohm = <50>;
> > +	bus-width = <8>;
> > +	disable-wp;
> > +};
> > diff --git a/configs/arm64/k3-am654-idk-linux-demo.c b/configs/arm64/k3-am654-idk-linux-demo.c
> > index fdf5fea8..3937dff3 100644
> > --- a/configs/arm64/k3-am654-idk-linux-demo.c
> > +++ b/configs/arm64/k3-am654-idk-linux-demo.c
> > @@ -23,7 +23,7 @@
> >  struct {
> >  	struct jailhouse_cell_desc cell;
> >  	__u64 cpus[1];
> > -	struct jailhouse_memory mem_regions[17];
> > +	struct jailhouse_memory mem_regions[19];
> >  	struct jailhouse_irqchip irqchips[3];
> >  	struct jailhouse_pci_device pci_devices[2];
> >  } __attribute__((packed)) config = {
> > @@ -112,6 +112,22 @@ struct {
> >  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> >  				JAILHOUSE_MEM_IO,
> >  		},
> > +#ifdef CONFIG_AM654_INMATE_CELL_EMMC
> > +		/* sdhci0 */ {
> > +			.phys_start = 0x4f80000,
> > +			.virt_start = 0x4f80000,
> > +			.size = 0x1000,
> > +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > +				JAILHOUSE_MEM_IO,
> > +		},
> > +		/* sdhci0 */ {
> > +			.phys_start = 0x4f90000,
> > +			.virt_start = 0x4f90000,
> > +			.size = 0x1000,
> > +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > +				JAILHOUSE_MEM_IO,
> > +		},
> > +#endif
> >  		/* main sproxy target_data host_id=A53_3 */ {
> >  			.phys_start = 0x3240f000,
> >  			.virt_start = 0x3240f000,
> > @@ -153,6 +169,10 @@ struct {
> >  			.address = 0x01800000,
> >  			.pin_base = 160,
> >  			.pin_bitmap = {
> > +#ifdef CONFIG_AM654_INMATE_CELL_EMMC
> > +			/* sdhc */
> > +			1 << (168 - 160) |
> > +#endif
> >  			/* vpci */
> >  			1 << (189 - 160) |
> >  			1 << (190 - 160),
> 
> 
> -- 
> Siemens AG, Technology
> Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220315034046.GA2558%40ubuntu.
