Return-Path: <jailhouse-dev+bncBCB7D7MXMMIOTJXL5ICRUBAB3JZ4S@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x63e.google.com (mail-pl1-x63e.google.com [IPv6:2607:f8b0:4864:20::63e])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C5294AE5
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 18:50:51 +0200 (CEST)
Received: by mail-pl1-x63e.google.com with SMTP id v13sf2340388plo.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 09:50:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566233450; cv=pass;
        d=google.com; s=arc-20160816;
        b=aeylv4b+LSUJ61iVAK6MTP98GdE/NrNcjDlkL1i/ejrP/gvHRNb19REQvQmGcpjNP1
         b2ceqpHNPLYg0FBXnWBjOL5kBdu19GWMkGpedUFDDjl0Q5+8WdYLuJ6Ms7MWSvEn678K
         xSEpkzmoAMbs6ue5Dkozvoy6Qtt3h53WKa9wSBuGEjgWEeubgEWxArMpEH/MqCwNshW4
         q2DBA2y9nL/i+iDyA8hGTJA4hMwE77StOnwe1BJ+z3dnmY6GCXUU8ql94iWs/GTQkBvT
         uzBMC9D1c74F2itMF4/SNkVkDRb1DH/URqRAAER3DA3KPKY0giPR56rA3jmFAkQwW15a
         Zj5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject:dkim-signature;
        bh=B7T97ytVTpqFuaXWSBOSj2GJbvMyc3YlC4PUTOHLikA=;
        b=X0VVzPRfSryA5bfn74gdRQSEQETRFU8dCzyEFCvxf35l/muQSapu/jbu3ubJn4CP/z
         P+ji4OeB5Rm0V36dJlI8j/yFVp168jJSw3J3emkjtDuin8wqcv+zphIgd3EV/8Lz08RX
         sLbCPXCsGQgOqTBp26gsMdmd5rwfU7baf0vkgsFVGpmcnAi/ZLTGaFkJSe6h+m8SC6+V
         LAqs2XjiKROiz3sqnKznMLuM2Jsfd7FFa/LK+/ryb6oAh/MLEGfjtq1axNbLMfyPykQP
         zJ/Y7gLoXWfXSEB1FLB6VAC84YQMihZar+YebFz3Ffpf3NyPMapgjFQUrubGIeXor1Mf
         w5Nw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QiqihoAv;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=B7T97ytVTpqFuaXWSBOSj2GJbvMyc3YlC4PUTOHLikA=;
        b=Cy2Fn12Af98nz1dy6QfxacJ3ycoYJcbqfMqgSODM+gn9j5pnGNSGo4nNFdazgPB5/a
         lboUvApeumQUOKj85aVwtbNyThocdkd3geq7dTY6zpqqBhc6ocA/mipHz5KFv77yAMEo
         v9g9tVem7JGKdRaKCgRVIay8q9aO35fdQ5vnKjqfMvow3iyep7sH9lsfaTr6w2kheZ8e
         zjkSRbZZMJ4hqWoFbBDHPrq5D95L95rVE8ny1EJmzU1p1OKFr7BQwii+Ba85UC+5E1pg
         GAbXlDPqzJGM38UvbTNKJv7lhvZZGMxw2XDHQcXXIzMK+1YiJQgJNHx310NE3sfRR4wO
         Ljnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=B7T97ytVTpqFuaXWSBOSj2GJbvMyc3YlC4PUTOHLikA=;
        b=Z1/lF6HDLLyIUOIMYjCHaBQ5G7IVMv82oX1NU6mANjqJvG2Ee0d2CX/Fmkz0XH1wHv
         YkJP6qPTnmW9jAoRxtfZTvIBTeDoV04ie5mHz+EkUvceTob2XoPgh+x+0LFSuAFMijg/
         mZf9mmrH87NKHFaSn7/TP4Rj8G3I19AEQua4mSYSYoZM80Gl+psDKCcN//9LYfP6Do6/
         xEqxmmCPa3nkGuJCe0NUqufvw82YF2+FeHDchkxlsSmVE2/JhSTp7IYnxUxugE8OOUnI
         eo9gVcKl2us+DrvWyRmlqrrBLUUadhrFdKX/biLcOraxX7dVWq73sRPkf7Dunr6GPudE
         qa3A==
X-Gm-Message-State: APjAAAW4JLMmE17sJZrDq+nmZPPQ63BYGaSCKeF9ZBprCvleuZgaVPxB
	+8/rVWtuE3WMNq4HciBt8Lw=
X-Google-Smtp-Source: APXvYqwaw0biiqqcL5IctrWOWsx9U32VTehbDdjZqQTXhzebDuotb40NLo7Sl1jFXlWQJUh5kcbitg==
X-Received: by 2002:a62:80cb:: with SMTP id j194mr25801181pfd.183.1566233450138;
        Mon, 19 Aug 2019 09:50:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:fc15:: with SMTP id j21ls3663128pgi.9.gmail; Mon, 19 Aug
 2019 09:50:49 -0700 (PDT)
X-Received: by 2002:aa7:914e:: with SMTP id 14mr25023737pfi.136.1566233449713;
        Mon, 19 Aug 2019 09:50:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566233449; cv=none;
        d=google.com; s=arc-20160816;
        b=EMl/2iFMXpvjcur3mUEabmtGPvbwHSPy/9UXjIGpAEskDMcETqseO3XPdK0vaSk9NQ
         XVWrY3k1zzA/15hqUO47TThWr7kO7GatEwymGu+44LzN1LP8IZVjSdXbqJ7cTzhXh15B
         pHNuMOuDnNL9GTFZVznGwFlRx8BVveSDWqhB6s0nlz+kBwAhsU98b7yR4Rjq/ZlKSRMw
         VQkKRTesfK0wtAq323x/GrK52+MHgWpiMqSZP6wPg0LFrHHep1ytYnFH6xF1sy79K8Ct
         HCsdFEYxmjpK4k5DT3Ilb9OePIlBTJna8NCX0x1UbqGQ72esy+d75Xbx9AN5Y2dfo4Ae
         kgkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=xEMPsTXo20Wky7prqMc4I8ZenG3oAQRjNEA3pOnVm38=;
        b=nck1wFwpA9L0RebQ3Grin9RoD/63ToyWK6PC8rhFripI3AuPbyy7dDvyDgOeYv6D60
         KYL1S6S+39W2fb88K44+HhJMxPnINy+rFeADN5e0jGMS1JqhtXjzbIKPrLHiAK3MLQMC
         4LXCjiRvgMJSdgOMHa7wVXVPaIDoO9hOJh6nPM6h4Svn/mjX32uQcz4xnUvlX0zhpeDT
         7nXsDCjK7HAFpnMJc8L1taO3w884BDSSGn3pWaxfKp/b1jp4PMD2tRRRauTt9lnqif49
         2YeUT9DqCMzmlgwocbmn0XNMdX4gsWnJ9V9PMQ/pYugr3G+1pYwZHUa5VBwHZCFAtzNf
         gRFA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QiqihoAv;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id h136si806073pfe.3.2019.08.19.09.50.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 09:50:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7JGomGc014931;
	Mon, 19 Aug 2019 11:50:48 -0500
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7JGomm6085991
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Aug 2019 11:50:48 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 19
 Aug 2019 11:50:48 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 19 Aug 2019 11:50:48 -0500
Received: from [172.24.190.117] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7JGokDR034056;
	Mon, 19 Aug 2019 11:50:47 -0500
Subject: Re: [PATCH v2 4/4] configs: arm64: Add Linux demo for j721-evm board
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <jailhouse-dev@googlegroups.com>,
        <jan.kiszka@siemens.com>
References: <1566224813-20129-1-git-send-email-nikhil.nd@ti.com>
 <1566224813-20129-5-git-send-email-nikhil.nd@ti.com>
From: "'Lokesh Vutla' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <429a088c-0f6c-b9f0-bf99-d8b49c634833@ti.com>
Date: Mon, 19 Aug 2019 22:20:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1566224813-20129-5-git-send-email-nikhil.nd@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=QiqihoAv;       spf=pass
 (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as
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



On 19/08/19 7:56 PM, Nikhil Devshatwar wrote:
> Add the linux demo cell config for j721e-evm board.
> Also add the required device tree for booting Linux kernel
> in the inmate cell.
> 
> This cell config acts as a reference for partitioning
> devices across the 2 Linux cells.
> This will be updated as support for more devices get added.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
> Changes from v1:
> * Split up the peripheral mem_region to match with kernel dts
> * Add GPU, multimedia decoder and display devices

Upstream Linux doesn't support this node. Do not add un-used nodes.

> 
>  configs/arm64/dts/inmate-k3-j721e-evm.dts | 499 ++++++++++++++++++++++++++++++
>  configs/arm64/k3-j721e-evm-linux-demo.c   | 242 +++++++++++++++
>  2 files changed, 741 insertions(+)
>  create mode 100644 configs/arm64/dts/inmate-k3-j721e-evm.dts
>  create mode 100644 configs/arm64/k3-j721e-evm-linux-demo.c
> 
> diff --git a/configs/arm64/dts/inmate-k3-j721e-evm.dts b/configs/arm64/dts/inmate-k3-j721e-evm.dts
> new file mode 100644
> index 0000000..661e3d9
> --- /dev/null
> +++ b/configs/arm64/dts/inmate-k3-j721e-evm.dts
> @@ -0,0 +1,499 @@
> +/dts-v1/;
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/soc/ti,sci_pm_domain.h>
> +#include <dt-bindings/pinctrl/k3.h>
> +
> +/ {
> +	model = "Texas Instruments J721E Inmate Model";
> +	compatible = "ti,j721e-evm", "ti,j721e";
> +	interrupt-parent = <&gic500>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		serial1 = &main_uart1;

Linux kernel mentions this as uart3. Please be in sync with Linux kernel just to
make things simpler.

> +	};
> +
> +	chosen {
> +		stdout-path = "serial1:115200n8";
> +	};
> +
> +	memory@8a0000000 {
> +		device_type = "memory";
> +		reg = <0x8 0xa0000000 0x0 0x60000000>;
> +	};
> +
> +	hypervisor {
> +		compatible = "jailhouse,cell";
> +	};
> +
> +	cpus: cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@1 {
> +			compatible = "arm,cortex-a72","arm,armv8";
> +			reg = <0x001>;
> +			device_type = "cpu";
> +			enable-method = "psci";
> +		};
> +	};
> +
> +	timer-cl0-cpu0 {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>, /* cntpsirq */
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>, /* cntpnsirq */
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>, /* cntvirq */
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>; /* cnthpirq */
> +	};
> +
> +	psci: psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	pmu: pmu {
> +		compatible = "arm,armv8-pmuv3";
> +		/* Recommendation from GIC500 TRM Table A.3 */
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	dummy_cmn_refclk: dummy_cmn_refclk {
> +		#clock-cells = <0>;
> +		compatible = "fixed-clock";
> +		clock-frequency = <0>;
> +	};
> +
> +	pci@76000000 {
> +		compatible = "pci-host-ecam-generic";
> +		device_type = "pci";
> +		bus-range = <0 0>;
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +		#interrupt-cells = <1>;
> +		interrupt-map-mask = <0 0 0 7>;
> +		interrupt-map =
> +		<0 0 0 1 &gic500 0 0 GIC_SPI 163 IRQ_TYPE_EDGE_RISING>,
> +		<0 0 0 2 &gic500 0 0 GIC_SPI 164 IRQ_TYPE_EDGE_RISING>,
> +		<0 0 0 3 &gic500 0 0 GIC_SPI 165 IRQ_TYPE_EDGE_RISING>,
> +		<0 0 0 4 &gic500 0 0 GIC_SPI 166 IRQ_TYPE_EDGE_RISING>;
> +		reg = <0x0 0x76000000 0x0 0x100000>;
> +		ranges =
> +		<0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
> +	};
> +
> +	soc0: soc0 {

Use the Linux kernel bus representation.

Thanks and regards,
Lokesh

> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		gic500: interrupt-controller@1800000 {
> +			compatible = "arm,gic-v3";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			#interrupt-cells = <3>;
> +			interrupt-controller;
> +			reg = <0x00 0x01800000 0x00 0x10000>,	/* GICD */
> +			<0x00 0x01900000 0x00 0x100000>;	/* GICR */
> +
> +			/* vcpumntirq: virtual CPU interface maintenance interrupt */
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		dmsc: dmsc@44083000 {
> +			compatible = "ti,k2g-sci";
> +			ti,host-id = <13>;
> +
> +			mbox-names = "rx", "tx";
> +
> +			mboxes= <&secure_proxy_main 16>,
> +				<&secure_proxy_main 18>;
> +
> +			reg-names = "debug_messages";
> +			reg = <0x00 0x44083000 0x0 0x1000>;
> +
> +			k3_pds: power-controller {
> +				compatible = "ti,sci-pm-domain";
> +				#power-domain-cells = <2>;
> +			};
> +
> +			k3_clks: clocks {
> +				compatible = "ti,k2g-sci-clk";
> +				#clock-cells = <2>;
> +				ti,scan-clocks-from-dt;
> +			};
> +
> +			k3_reset: reset-controller {
> +				compatible = "ti,sci-reset";
> +				#reset-cells = <2>;
> +			};
> +		};
> +
> +		main_navss_intr: interrupt-controller1 {
> +			compatible = "ti,sci-intr";
> +			interrupt-controller;
> +			interrupt-parent = <&gic500>;
> +			#interrupt-cells = <3>;
> +			ti,sci = <&dmsc>;
> +			ti,sci-dst-id = <14>;
> +			ti,sci-rm-range-girq = <4>;
> +		};
> +
> +		secure_proxy_main: mailbox@32c00000 {
> +			compatible = "ti,am654-secure-proxy";
> +			#mbox-cells = <1>;
> +			reg-names = "target_data", "rt", "scfg";
> +			reg = <0x00 0x32c00000 0x00 0x100000>,
> +			<0x00 0x32400000 0x00 0x100000>,
> +			<0x00 0x32800000 0x00 0x100000>;
> +			interrupt-names = "rx_016";
> +			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		main_pmx0: pinmux@11c000 {
> +			compatible = "pinctrl-single";
> +			/* Proxy 0 addressing */
> +			reg = <0x0 0x11c000 0x0 0x2b4>;
> +			#pinctrl-cells = <1>;
> +			pinctrl-single,register-width = <32>;
> +			pinctrl-single,function-mask = <0xffffffff>;
> +		};
> +
> +		main_uart1: serial@2810000 {
> +			compatible = "ti,j721e-uart", "ti,am654-uart";
> +			reg = <0x00 0x02810000 0x00 0x100>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
> +			clock-frequency = <48000000>;
> +			current-speed = <115200>;
> +			power-domains = <&k3_pds 278 TI_SCI_PD_EXCLUSIVE>;
> +			clocks = <&k3_clks 278 0>;
> +			clock-names = "fclk";
> +		};
> +
> +		main_sdhci0: sdhci@4f80000 {
> +			compatible = "ti,j721e-sdhci-8bit";
> +			reg = <0x0 0x4f80000 0x0 0x1000>, <0x0 0x4f88000 0x0 0x400>;
> +			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> +			power-domains = <&k3_pds 91 TI_SCI_PD_SHARED>;
> +			clock-names = "clk_xin", "clk_ahb";
> +			clocks = <&k3_clks 91 1>, <&k3_clks 91 0>;
> +			assigned-clocks = <&k3_clks 91 1>;
> +			assigned-clock-parents = <&k3_clks 91 2>;
> +			bus-width = <8>;
> +			ti,otap-del-sel = <0x2>;
> +			ti,trm-icp = <0x8>;
> +			ti,strobe-sel = <0x77>;
> +			dma-coherent;
> +		};
> +
> +		gpu: gpu@4e20000000 {
> +			compatible = "ti,j721e-pvr", "img,pvr-ge8430";
> +			reg = <0x4e 0x20000000 0x00 0x80000>;
> +			reg-names = "gpu_regs";
> +			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> +			power-domains = <&k3_pds 125 TI_SCI_PD_EXCLUSIVE>, <&k3_pds 126 TI_SCI_PD_EXCLUSIVE>;
> +			power-domain-names = "gpu_0", "gpucore_0";
> +			clocks = <&k3_clks 125 0>;
> +			clock-names = "ctrl";
> +		};
> +
> +		d5520: video-decoder@4300000 {
> +			/* IMG D5520 driver configuration */
> +			compatible = "img,d5500-vxd";
> +			reg = <0x00 0x04300000 0x00 0x100000>;
> +			power-domains = <&k3_pds 144 TI_SCI_PD_EXCLUSIVE>;
> +			interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		serdes_wiz4: wiz@5050000 {
> +			compatible = "ti,j721e-wiz";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			power-domains = <&k3_pds 297 TI_SCI_PD_EXCLUSIVE>;
> +			clocks = <&k3_clks 297 1>, <&k3_clks 297 9>, <&dummy_cmn_refclk>;
> +			clock-names = "fck", "core_ref_clk", "ext_ref_clk";
> +			num-lanes = <4>;
> +			#reset-cells = <1>;
> +			ranges;
> +
> +			assigned-clocks = <&k3_clks 297 9>;
> +			assigned-clock-parents = <&k3_clks 297 10>;
> +			assigned-clock-rates = <19200000>;
> +
> +			wiz4_pll0_refclk: pll0_refclk {
> +				clocks = <&k3_clks 297 9>, <&dummy_cmn_refclk>;
> +				clock-output-names = "wiz4_pll0_refclk";
> +				#clock-cells = <0>;
> +				assigned-clocks = <&wiz4_pll0_refclk>;
> +				assigned-clock-parents = <&k3_clks 297 9>;
> +			};
> +
> +			wiz4_pll1_refclk: pll1_refclk {
> +				clocks = <&k3_clks 297 9>, <&dummy_cmn_refclk>;
> +				clock-output-names = "wiz4_pll1_refclk";
> +				#clock-cells = <0>;
> +				assigned-clocks = <&wiz4_pll1_refclk>;
> +				assigned-clock-parents = <&k3_clks 297 9>;
> +			};
> +
> +			wiz4_refclk_dig: refclk_dig {
> +				clocks = <&k3_clks 297 9>, <&dummy_cmn_refclk>;
> +				clock-output-names = "wiz4_refclk_dig";
> +				#clock-cells = <0>;
> +				assigned-clocks = <&wiz4_refclk_dig>;
> +				assigned-clock-parents = <&k3_clks 297 9>;
> +			};
> +
> +			wiz4_cmn_refclk: cmn_refclk {
> +				clocks = <&wiz4_refclk_dig>;
> +				clock-output-names = "wiz4_cmn_refclk";
> +				#clock-cells = <0>;
> +			};
> +
> +			wiz4_cmn_refclk1: cmn_refclk1 {
> +				clocks = <&wiz4_pll1_refclk>;
> +				clock-output-names = "wiz4_cmn_refclk1";
> +				#clock-cells = <0>;
> +			};
> +
> +			serdes0: serdes@5050000 {
> +				/* XXX we also map EDP0 registers here as the PHY driver needs those... */
> +				compatible = "cdns,dp-phy";
> +				reg = <0x00 0x05050000 0x0 0x00010000>, /* SERDES_10G0 */
> +				<0x00 0x0A030A00 0x0 0x00000040>; /* DSS_EDP0_V2A_CORE_VP_REGS_APB + 30A00 */
> +
> +				resets = <&serdes_wiz4 0>, <&serdes_wiz4 1>,
> +					<&serdes_wiz4 2>, <&serdes_wiz4 3>,
> +					<&serdes_wiz4 4>;
> +
> +				num_lanes = <4>;
> +				max_bit_rate = <5400>;
> +				#phy-cells = <0>;
> +			};
> +		};
> +
> +		mhdp: dp-bridge@000A000000 {
> +			compatible = "cdns,mhdp8546";
> +			reg = <0x00 0x0A000000 0x0 0x30A00>, /* DSS_EDP0_V2A_CORE_VP_REGS_APB - upto PHY mapped area */
> +			<0x00 0x04F40000 0x0 0x20>;    /* DSS_EDP0_INTG_CFG_VP */
> +
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&dp0_pins_default>;
> +
> +			clocks = <&k3_clks 151 36>;
> +
> +			phys = <&serdes0>;
> +			phy-names = "dpphy";
> +
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 614 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			power-domains = <&k3_pds 151 TI_SCI_PD_EXCLUSIVE>;
> +
> +			/* TODO: No audio config yet */
> +			/* TODO: Pinmux for eDP output pins */
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					dp_bridge_input: endpoint {
> +						remote-endpoint = <&dpi_out_real0>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					dp_bridge_output: endpoint {
> +						remote-endpoint = <&dp_connector_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		dss: dss@04a00000 {
> +			compatible = "ti,j721e-dss";
> +			reg =
> +				<0x00 0x04a00000 0x00 0x10000>, /* common_m */
> +				<0x00 0x04a10000 0x00 0x10000>, /* common_s0*/
> +				<0x00 0x04b00000 0x00 0x10000>, /* common_s1*/
> +				<0x00 0x04b10000 0x00 0x10000>, /* common_s2*/
> +
> +				<0x00 0x04a20000 0x00 0x10000>, /* vidl1 */
> +				<0x00 0x04a30000 0x00 0x10000>, /* vidl2 */
> +				<0x00 0x04a50000 0x00 0x10000>, /* vid1 */
> +				<0x00 0x04a60000 0x00 0x10000>, /* vid2 */
> +
> +				<0x00 0x04a70000 0x00 0x10000>, /* ovr1 */
> +				<0x00 0x04a90000 0x00 0x10000>, /* ovr2 */
> +				<0x00 0x04ab0000 0x00 0x10000>, /* ovr3 */
> +				<0x00 0x04ad0000 0x00 0x10000>, /* ovr4 */
> +
> +				<0x00 0x04a80000 0x00 0x10000>, /* vp1 */
> +				<0x00 0x04aa0000 0x00 0x10000>, /* vp2 */
> +				<0x00 0x04ac0000 0x00 0x10000>, /* vp3 */
> +				<0x00 0x04ae0000 0x00 0x10000>, /* vp4 */
> +				<0x00 0x04af0000 0x00 0x10000>; /* wb */
> +
> +			reg-names = "common_m", "common_s0",
> +				"common_s1", "common_s2",
> +				"vidl1", "vidl2","vid1","vid2",
> +				"ovr1", "ovr2", "ovr3", "ovr4",
> +				"vp1", "vp2", "vp3", "vp4",
> +				"wb";
> +
> +			clocks =	<&k3_clks 152 0>,
> +					<&k3_clks 152 1>,
> +					<&k3_clks 152 4>,
> +					<&k3_clks 152 9>,
> +					<&k3_clks 152 13>;
> +			clock-names = "fck", "vp1", "vp2", "vp3", "vp4";
> +
> +			assigned-clocks = <&k3_clks 152 1>;
> +			assigned-clock-parents = <&k3_clks 152 2>;
> +
> +			power-domains = <&k3_pds 152 TI_SCI_PD_SHARED>;
> +
> +			interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "common_m",
> +					"common_s0",
> +					"common_s1",
> +					"common_s2";
> +
> +			dss_ports: ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +	};
> +
> +	dp0: connector {
> +		compatible = "dp-connector"; /* No such binding exists yet.. */
> +
> +		port {
> +			dp_connector_in: endpoint {
> +				remote-endpoint = <&dp_bridge_output>;
> +			};
> +		};
> +	};
> +};
> +
> +&main_pmx0 {
> +	main_uart1_pins_default: main_uart1_pins_default {
> +		pinctrl-single,pins = <
> +                        J721E_IOPAD(0x1f8, PIN_INPUT, 0) /* (AA4) UART1_RXD */
> +                        J721E_IOPAD(0x1fc, PIN_OUTPUT, 0) /* (AB4) UART1_TXD */
> +		>;
> +	};
> +
> +	dp0_pins_default: dp0_pins_default {
> +		pinctrl-single,pins = <
> +			J721E_IOPAD(0x1c4, PIN_INPUT, 5) /* SPI0_CS1.DP0_HPD */
> +		>;
> +	};
> +};
> +
> +&main_uart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_uart1_pins_default>;
> +};
> +
> +&main_sdhci0 {
> +	non-removable;
> +	ti,driver-strength-ohm = <50>;
> +	mmc-hs400-1_8v;
> +};
> +
> +&dss {
> +		dss_planes: dss-planes {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/*vid1*/
> +		plane@0 {
> +			reg = <0>;
> +			managed = <0>;
> +		};
> +
> +		/*vidl1*/
> +		plane@1 {
> +			reg = <1>;
> +			managed = <1>;
> +		};
> +
> +		/*vid2*/
> +		plane@2 {
> +			reg = <2>;
> +			managed = <0>;
> +		};
> +
> +		/*vidl2*/
> +		plane@3 {
> +			reg = <3>;
> +			managed = <0>;
> +		};
> +	};
> +
> +	dss_vps: dss-vps {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		vp@0 {
> +			reg = <0>;
> +			managed = <1>;
> +		};
> +
> +		vp@1 {
> +			reg = <1>;
> +			managed = <0>;
> +		};
> +
> +		vp@2 {
> +			reg = <2>;
> +			managed = <0>;
> +		};
> +
> +		vp@3 {
> +			reg = <3>;
> +			managed = <0>;
> +		};
> +	};
> +
> +	dss_commons: dss-commons {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		interrupt-common {
> +			reg = <2>;
> +		};
> +
> +		config-common {
> +			status = "disabled";
> +			reg = <0>;
> +		};
> +	};
> +};
> +
> +&dss_ports {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	port@0 {
> +		reg = <0>;
> +
> +		dpi_out_real0: endpoint {
> +			remote-endpoint = <&dp_bridge_input>;
> +		};
> +	};
> +};
> diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
> new file mode 100644
> index 0000000..347ae0e
> --- /dev/null
> +++ b/configs/arm64/k3-j721e-evm-linux-demo.c
> @@ -0,0 +1,242 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Configuration for Linux inmate on J721E based platforms
> + * 1 CPUs, 512MB RAM, 1 serial port
> + *
> + * Copyright (c) 2019 Texas Instruments Incorporated - http://www.ti.com/
> + *
> + * Authors:
> + *  Nikhil Devshatwar <nikhil.nd@ti.com>
> + *  Lokesh Vutla <lokeshvutla@ti.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include <jailhouse/types.h>
> +#include <jailhouse/cell-config.h>
> +
> +#ifndef CONFIG_INMATE_BASE
> +#define CONFIG_INMATE_BASE 0x0000000
> +#endif
> +
> +struct {
> +	struct jailhouse_cell_desc cell;
> +	__u64 cpus[1];
> +	struct jailhouse_memory mem_regions[20];
> +	struct jailhouse_irqchip irqchips[3];
> +	struct jailhouse_pci_device pci_devices[1];
> +} __attribute__((packed)) config = {
> +	.cell = {
> +		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
> +		.revision = JAILHOUSE_CONFIG_REVISION,
> +		.name = "k3-j721e-evm-linux-demo",
> +		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
> +
> +		.cpu_set_size = sizeof(config.cpus),
> +		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> +		.num_irqchips = ARRAY_SIZE(config.irqchips),
> +		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
> +		.cpu_reset_address = 0x0,
> +		.vpci_irq_base = 195 - 32,
> +		.console = {
> +			.address = 0x2810000,
> +			.divider = 0x1b,
> +			.type = JAILHOUSE_CON_TYPE_8250,
> +			.flags = JAILHOUSE_CON_ACCESS_MMIO |
> +				 JAILHOUSE_CON_REGDIST_4,
> +		},
> +	},
> +
> +	.cpus = {
> +		0x2,
> +	},
> +
> +	.mem_regions = {
> +		/* IVSHMEM shared memory region for 00:00.0 */ {
> +			.phys_start = 0x89fe00000,
> +			.virt_start = 0x89fe00000,
> +			.size = 0x100000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* ctrl mmr */ {
> +			.phys_start = 0x00100000,
> +			.virt_start = 0x00100000,
> +			.size = 0x00020000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* Main.uart1 */ {
> +			.phys_start = 0x02810000,
> +			.virt_start = 0x02810000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* sdhci0 */ {
> +			.phys_start = 0x4f80000,
> +			.virt_start = 0x4f80000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* sdhci0 */ {
> +			.phys_start = 0x4f88000,
> +			.virt_start = 0x4f88000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* main sproxy target_data host_id=A72_3 */ {
> +			.phys_start = 0x3240f000,
> +			.virt_start = 0x3240f000,
> +			.size = 0x05000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* main sproxy rt host_id=A72_3 */ {
> +			.phys_start = 0x3280f000,
> +			.virt_start = 0x3280f000,
> +			.size = 0x05000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* main sproxy scfg host_id=A72_3 */ {
> +			.phys_start = 0x32c0f000,
> +			.virt_start = 0x32c0f000,
> +			.size = 0x05000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* D552 decoder */ {
> +			.phys_start = 0x4300000,
> +			.virt_start = 0x4300000,
> +			.size = 0x100000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* GPU */ {
> +			.phys_start = 0x4e20000000,
> +			.virt_start = 0x4e20000000,
> +			.size = 0x80000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* dss.common_s1 */ {
> +			.phys_start = 0x4B00000,
> +			.virt_start = 0x4B00000,
> +			.size = 0x00010000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* dss.vidl1 */ {
> +			.phys_start = 0x4A20000,
> +			.virt_start = 0x4A20000,
> +			.size = 0x00010000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* dss.ovr1 */ {
> +			.phys_start = 0x4A70000,
> +			.virt_start = 0x4A70000,
> +			.size = 0x00010000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* dss.vp1 */ {
> +			.phys_start = 0x4A80000,
> +			.virt_start = 0x4A80000,
> +			.size = 0x00010000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* serdes 10G */ {
> +			.phys_start = 0x05050000,
> +			.virt_start = 0x05050000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* DSS_EDP0_V2A_CORE_VP_REGS_AP */ {
> +			.phys_start = 0x0A000000,
> +			.virt_start = 0x0A000000,
> +			.size = 0x31000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* DSS_EDP0_INTG_CFG_VP */ {
> +			.phys_start = 0x04F40000,
> +			.virt_start = 0x04F40000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* linux-loader space */ {
> +			.phys_start = 0x89ff00000,
> +			.virt_start = 0x0,
> +			.size = 0x10000,	/* 64KB */
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
> +		},
> +		/* RAM. */ {
> +			.phys_start = 0x8a0000000,
> +			.virt_start = 0x8a0000000,
> +			.size = 0x60000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
> +				JAILHOUSE_MEM_LOADABLE,
> +		},
> +		/* communication region */ {
> +			.virt_start = 0x80000000,
> +			.size = 0x00001000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_COMM_REGION,
> +		},
> +	},
> +
> +	.irqchips = {
> +		/*
> +		 * offset = (SPI_NR + 32 - base) / 32
> +		 * bit = (SPI_NR + 32 - base) % 32
> +		 */
> +		{
> +			.address = 0x01800000,
> +			.pin_base = 32,
> +			/* gpu, sdhci0, sproxy_rx_016 */
> +			.pin_bitmap = {
> +				0x1000008, 0x80, 0x0, 0,
> +			},
> +		},
> +		{
> +			.address = 0x01800000,
> +			.pin_base = 160,
> +			/* d5520, vpci, main_uart1 */
> +			.pin_bitmap = {
> +				0x0, 0x100008, 0x2, 0,
> +			},
> +		},
> +		{
> +			.address = 0x01800000,
> +			.pin_base = 544,
> +			/* dss common_s1, mhdp */
> +			.pin_bitmap = {
> +				0x0, 0x0, 0x10000000, 0x40,
> +			},
> +		},
> +	},
> +
> +	.pci_devices = {
> +		/* 00:00.0 */ {
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.bdf = 0x00,
> +			.bar_mask = {
> +				0xffffff00, 0xffffffff, 0x00000000,
> +				0x00000000, 0x00000000, 0x00000000,
> +			},
> +			.shmem_region = 0,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
> +		},
> +	},
> +};
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/429a088c-0f6c-b9f0-bf99-d8b49c634833%40ti.com.
