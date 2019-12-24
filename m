Return-Path: <jailhouse-dev+bncBCB7D7MXMMIOHIEG6ACRUBFCGSDRW@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83a.google.com (mail-qt1-x83a.google.com [IPv6:2607:f8b0:4864:20::83a])
	by mail.lfdr.de (Postfix) with ESMTPS id 624AE129D3A
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Dec 2019 05:13:25 +0100 (CET)
Received: by mail-qt1-x83a.google.com with SMTP id k27sf12339920qtu.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 20:13:25 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577160804; cv=pass;
        d=google.com; s=arc-20160816;
        b=x7SbmfsWcKrx3WNdVjdBPS44QWhS1pphVvqqwYw5h2nowY4XbQ8LDQ176pnm7kGorF
         bSh28EviLdzpWeIWYhUaJypZj28WLYJsnBF2N09k/5FXjn81lG39Qs1idASpxtsdQ8hG
         guDETiKpMNOUfLdd2j1x72yAZbobrGRto7pkvEKan9QXgqXwk4mhcwe6p+VMekJ9qmat
         mgExbYcr3iW/DJPZb1bbsqS34AxNSGinfrYQPQYBJ+j/e0gvrtCe54cZezDZ8TJLD7aB
         GBnRwEGeqzCoLN9Nrp5QENChvbn+0ubhGnHxqVZsu6TpDGt4XK28FSdUjCcwu3tWqOyh
         qdqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=2qdt2HHpHpNzOU/KIJpbHQBk98aDbgr4JYcmB3SeEac=;
        b=ntBFLbmmhj3FCwWcli2FRUrOtlwwPZlyqLmlmpp9KBw0dPSFlI28MshGHg3c5NySxJ
         rXX2a46lIA6vfirNfVFeDbJXyFzDbyvfs1LJGK6gWq0QaLeuj3QujJOQqEeOLrOpv0Ch
         EU38AV3kGYpJGIl+V1CA/CJNDEaq9MhhoqrTOdlm6KtdWct6iwhWZbO79nFwfLler2L8
         A5ld/p7AznksZsuNs8QrhG5Ym5p/bEdkLDxNXONs9YrUAEDwvQqRSpUFb9lvf8elUGOF
         Hq3L1XZDuVILoaqd9S54eO86sKXw52JwJjaH4vH9Is7Sm7Uq6gAOVeP9ljzkmA9oJ8in
         jnTw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=iiHpbIce;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=2qdt2HHpHpNzOU/KIJpbHQBk98aDbgr4JYcmB3SeEac=;
        b=mhO8OhjndUJ0/pdCnuIZbTIyzLlMVGjRQjaIORz8nseFbrMcugLEPhJ9VFpJiE7x/u
         JglZtnVGm30f3XmsxgN7/SVZir2BM7ORbnwTLuQmpQNpM3UpVkZuVTbaKMsRngYhL6mY
         lGT2Jba5SB23YsiLSQMvlhpF0sSy3xfhJ+YDezBxHO7IvuLgVL1+Cq2Ld7C8dygEUI4x
         c1VEfo7wdunVG4LNj9wf46ZZEmATYchMoZHHc5XmXjbHzVMiCF4wakvgOjqiUT8+2D0s
         BTVrD1kv01vCuPFV4Ed/8xNClbpROJ182rWjrbW9dTSlJLDqy0mZzh2OY+PgupQtfvva
         DX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=2qdt2HHpHpNzOU/KIJpbHQBk98aDbgr4JYcmB3SeEac=;
        b=JwtYPuZl3YS/o4i1vowEvc8qXEP3SMyc3Syr1364Ls4XduYeAy4/mEPLRWprwTrYO4
         AO5nrpMfs2mhOtzlQw5HSsriwJERiTK1rQCqmgUF6t8GQKr7giYzwPFqBCkTdEZcWyfE
         sjnsYrRSlKv2BAGK6kQZHWER835piKOlSx5S5y/FchiMxtaUhWRnzrYMhfwX9DyoIQvY
         3ASIRr7xHIV5jT3G10BeqRZ9/ocEijvL6Ib89IteMVH8LmItPID+BZaTWqyOKyAE5Y3W
         FyD2LsWRqpvho3QGro+FYE5VlHh9mqoaMv8lp1RoKA4tmnCJ5SBgC67iElcClovdfOue
         kSKg==
X-Gm-Message-State: APjAAAUSaMCfRWXnajWpctZTO/dgHDZsGjQ+2efB7bGlydThoWeg9IsZ
	u8eZCuDiGQWodg2OzK/YlCI=
X-Google-Smtp-Source: APXvYqxv0dvUzi0pNXZbtZ8ykcteePCFTOWkFM4wyNY2K/PRLR0qVemQHMqBvLsZZoP5CllrFNZMaQ==
X-Received: by 2002:ae9:f205:: with SMTP id m5mr29700335qkg.152.1577160804073;
        Mon, 23 Dec 2019 20:13:24 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:70c3:: with SMTP id g3ls2461605qtp.0.gmail; Mon, 23 Dec
 2019 20:13:23 -0800 (PST)
X-Received: by 2002:aed:3c12:: with SMTP id t18mr26411942qte.140.1577160803597;
        Mon, 23 Dec 2019 20:13:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577160803; cv=none;
        d=google.com; s=arc-20160816;
        b=xSKbg5sAurXiXw4gREpf/ns/9OF7SYCAWngXRx9tDqMPW4dkZt7cLZTrQEwDba+kkO
         U1UMkleWMktFOGeO07k+ptBhZ071Fnux5EH40MTceHFFE7Ayd3CusQLj9wQ28x7ulsrU
         PsPWuyjfNIZsc6D62dDkTWUuZDQt3rHnWu/fc18J3M1Z/hKG5N/87TxasG9p5GLEfbAG
         MWuZG1sTsymFUk3C7ir100LcEYCXbuIsloQEfqlS4vxjq8oJTcBOCKQRsmGsDZQdnQDT
         rmTVeKbBIdtSHhBokjx9xQLUqfcC6BT5xUaAIA4cuJOBUy+QwSvaXQ2QpDBIXCujqIdX
         NeRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=4tdDJ3ildSyECTD9IcjAH9NyGemnwEPmtDWOq2v076A=;
        b=z2LAQ1WTSc+GUHcHCt5DeKqP39nWhBXnxA6oH1Awe1EdxZqsPKAprZLFP4YtAqSKQt
         J2oqLnr56lT84y7vMmFrpMlPCyN+d1ZlbzOyMSEMtj42yK93Ds5idaqwxy6O44PPG6hy
         EHiPX6mG+5GwMY0DYPUOPMdXHQOteSW6bNVD6HHLn0RYNQ67jrSuvmZdD5SykaLwgvyZ
         /hmKal8Mpqe8WOUApfmBrnbJFb0CuCOU0rSyZsRut4bAHMlfFDuXS/HUkw8AKVCSPEbF
         E7j9ctIB/RcLapQnFP1Rm1pGZAF454ocoaZkFxOG+FmGLOZnDlBwKb2I+c3W5insnKuV
         WDKA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=iiHpbIce;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id g23si876266qki.4.2019.12.23.20.13.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Dec 2019 20:13:23 -0800 (PST)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBO4DMjZ104657;
	Mon, 23 Dec 2019 22:13:22 -0600
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBO4DM3W033312
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Dec 2019 22:13:22 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 23
 Dec 2019 22:13:22 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 23 Dec 2019 22:13:22 -0600
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBO4DKNo021219;
	Mon, 23 Dec 2019 22:13:21 -0600
Subject: Re: [PATCH v4 4/4] configs: arm64: Add Linux demo for j721-evm board
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <jailhouse-dev@googlegroups.com>
CC: <jan.kiszka@siemens.com>
References: <20191223151353.22495-1-nikhil.nd@ti.com>
 <20191223151353.22495-5-nikhil.nd@ti.com>
From: "'Lokesh Vutla' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <815ba243-8534-764d-1895-dbcf403a8a2d@ti.com>
Date: Tue, 24 Dec 2019 09:42:31 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20191223151353.22495-5-nikhil.nd@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=iiHpbIce;       spf=pass
 (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as
 permitted sender) smtp.mailfrom=lokeshvutla@ti.com;       dmarc=pass
 (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Lokesh Vutla <lokeshvutla@ti.com>
Reply-To: Lokesh Vutla <lokeshvutla@ti.com>
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



On 23/12/19 8:43 PM, Nikhil Devshatwar wrote:
> Add the linux demo cell config for j721e-evm board.
> Also add the required device tree for booting Linux kernel
> in the inmate cell.
> 
> This cell config acts as a reference for partitioning
> devices across the 2 Linux cells.
> This will be updated as support for more devices get added.
> 
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
> 
> Notes:
>     Changes from v3:
>     * Add gpio, emmc and USB device in the DTS with upstream bindings
>     * Describe the irqmap for easy understanding and verification
>     * Update power-domains properties
>     
>     Changes from v2:
>     * Only add the DT entries for devices with stable bindings
>     * Organize the DTS to match the bus topology with upstream kernel
>     
>     Changes from v1:
>     * Split up the peripheral mem_region to match with kernel dts
>     * Add GPU, multimedia decoder and display devices
> 
>  configs/arm64/dts/inmate-k3-j721e-evm.dts | 433 ++++++++++++++++++++++
>  configs/arm64/k3-j721e-evm-linux-demo.c   | 262 +++++++++++++
>  2 files changed, 695 insertions(+)
>  create mode 100644 configs/arm64/dts/inmate-k3-j721e-evm.dts
>  create mode 100644 configs/arm64/k3-j721e-evm-linux-demo.c
> 
> diff --git a/configs/arm64/dts/inmate-k3-j721e-evm.dts b/configs/arm64/dts/inmate-k3-j721e-evm.dts
> new file mode 100644
> index 00000000..51470a57
> --- /dev/null
> +++ b/configs/arm64/dts/inmate-k3-j721e-evm.dts
> @@ -0,0 +1,433 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for J721E Jailhouse inmate kernel
> + *
> + * Copyright (C) 2016-2019 Texas Instruments Incorporated - http://www.ti.com/
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/pinctrl/k3.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/soc/ti,sci_pm_domain.h>
> +
> +/ {
> +	model = "Texas Instruments J721E Inmate Model";
> +	compatible = "ti,j721e-evm", "ti,j721e";
> +	interrupt-parent = <&gic500>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		serial3 = &main_uart1;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial3:115200n8";
> +	};
> +
> +	hypervisor {
> +		compatible = "jailhouse,cell";
> +	};
> +

[..snip..]

> +
> +	cbass_main_navss: interconnect0 {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		main_navss_intr: interrupt-controller1 {
> +			compatible = "ti,sci-intr";
> +			ti,intr-trigger-type = <4>;
> +			interrupt-controller;
> +			interrupt-parent = <&gic500>;
> +			#interrupt-cells = <2>;
> +			ti,sci = <&dmsc>;
> +			ti,sci-dst-id = <14>;
> +			ti,sci-rm-range-girq = <4>;
> +		};
> +
> +		main_udmass_inta: interrupt-controller@33d00000 {
> +			compatible = "ti,sci-inta";
> +			reg = <0x0 0x33d00000 0x0 0x100000>;
> +			interrupt-controller;
> +			interrupt-parent = <&main_navss_intr>;
> +			msi-controller;
> +			ti,sci = <&dmsc>;
> +			ti,sci-dev-id = <209>;
> +			ti,sci-rm-range-vint = <0xa>;
> +			ti,sci-rm-range-global-event = <0xd>;
> +		};

You should drop this node. The address is not mapped in
k3-j721e-evm-linux-demo.c and there are no users in this DT. You should be very
careful when virtualizing inta and udmass.

> +	};
> +
> +	secure_proxy_main: mailbox@32c00000 {
> +		compatible = "ti,am654-secure-proxy";
> +		#mbox-cells = <1>;
> +		reg-names = "target_data", "rt", "scfg";
> +		reg = <0x00 0x32c00000 0x00 0x100000>,
> +		      <0x00 0x32400000 0x00 0x100000>,
> +		      <0x00 0x32800000 0x00 0x100000>;
> +		interrupt-names = "rx_016";
> +		interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +

[..snip..]

> +
> +/ {
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		autorepeat;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sw10_button_pins_default>;
> +
> +		sw10 {
> +			label = "GPIO Key USER1";
> +			linux,code = <BTN_0>;
> +			gpios = <&main_gpio2 0 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +};
> +
> +&main_pmx0 {
> +	sw10_button_pins_default: sw10_button_pins_default {
> +		pinctrl-single,pins = <
> +			J721E_IOPAD(0x0, PIN_INPUT, 7) /* (AC18) EXTINTn.GPIO0_0 */

hmm..is this working? IIRC GPIO group should be selected along with mux mode,
else it will be routed to GPIO0.

Thanks and regards,
Lokesh

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/815ba243-8534-764d-1895-dbcf403a8a2d%40ti.com.
