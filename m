Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB7NUSXZAKGQELGWF7XA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F8C15C030
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Feb 2020 15:17:34 +0100 (CET)
Received: by mail-wm1-x338.google.com with SMTP id m4sf2391482wmi.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Feb 2020 06:17:34 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581603454; cv=pass;
        d=google.com; s=arc-20160816;
        b=J/7zuRroVmcUKGkenhpthMHx1FRqBmOHuh5Dz23qtPstkRJnhMN9gvThMVoZ5w4L8N
         cCAsZL08WBiB8JxpuFmsjFkRqX0JJiF5wHC8kD7tu3pyV82au8jAazTsqmEKHCPdB3Lu
         pF0VDbFj3UWcgFUXj4R6qfimJ0EC0nB/gw5GFyLHOWb1sPyG5aBGbr1Eo5y0yJW6Gnms
         JJLL+t3g7w/zul8Rxh6agDP6UVoURZHx8GBPvcjUxdpU+5NE3qYEpjTp/wm4fnqg4Me0
         kXrpjEZ3NThcqQCQAXcI5TfuJnUGCfFw63Jv0qHebutoUwQSCzLLxFcW0jabU6Meylyy
         /E+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=KzGz/h4dCKBZBweOb3YVF8YTi6NmPW4KidA+pf+2ICU=;
        b=K8QOhuQo/DcrnurhV1PgElyZwG+V+VK0J3t32kWE7I3MoxybbuKl5pGRDaWqJ+Qejy
         fgsJY3nli3TznNxepC+SSCRHufpUehSPrOmwZko6hbJug/VBwXIj5jWb4yXpgqzUVDbP
         visKKzdtmyYyQ1ZR1IYTdEGgCzZjGyseskYOiAKU4t9Qxwo+3bdoNW6fPFNb4BbNwyR4
         LHIlfeDD16eK174McePhZAvipW+TCGnnMnqP8ukn/q2Uh2ZZdXThlf7d6gPNvLQ9AqmF
         BwGBPIEkZu+Au8IJVI+W/Ec7PzW1LNR0alQXM0jFO5aycn3YqOa86OTE1dSuxztSLwlb
         XncA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=KzGz/h4dCKBZBweOb3YVF8YTi6NmPW4KidA+pf+2ICU=;
        b=mzu4NKNe354Q7V363hGz68DJA/qJGsMywgtk7beheSN/dLtpedvjCqFMgJaTOdd2Qx
         vf5H0C0G0e3nstiayTkF5jMKX/ANok7wCi58ymG4vLn/Gzl+CulbcnEFl4bXFwPwydPI
         ABToHRrl7HgpvOWQH7+rVNZy9pfc114FLePJIV/Mcmf1lJXtqivxtnr898qrvt5TwtcJ
         F2c541CXOPq8Kf2CRaoju8VQV/j9kREaonFMWQliVZf4NYye06Zzlgz8bEacSa4jw2yl
         +a+gAGn0PapG23CcK4IMcB2dZNMwq5UzK3AyQzJ/L63LxBvx4Z8ZmxxaH34dxlW5EOf/
         pcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=KzGz/h4dCKBZBweOb3YVF8YTi6NmPW4KidA+pf+2ICU=;
        b=ZwPj/7cWgXYcep8vgiXovp4MMv7RKa/HQ3rfOjOUCr8lUdE2I3lt3jzN0HDv3YFXcX
         Pmj7fO9j3ZF3I3E0ajt+2rm9dVWb1M1mXVYOIzBWVpjXx6dh7Xn6bQjJ9Lb8oeVXSL/O
         38cb7QuAaZQQ/CNWNuUny1ZmRHQdNVAR07FcAL5uOtgI3IYwOce6Jn5JZW+cwPInLsBF
         nKPvynEDOB7DEsQDQ5v/Xt8bvSGIe4IxnzTwqe0bgcXDOnGaA85gcSqnsE4iKjXhTRsY
         Xu3OLOcaa3rbWWfZdvCA1NlpqW765TT91otk3KFl0YmmsP/ZA1SuKysywwyFnZ6EKUlB
         Nz5w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU1VVt/w3ov7AphTGpV0MoxH28u4hR7BAi5qkBTDNgl/ECZBqk5
	1c9xF4Kn2K6Hg7JO0vi70hs=
X-Google-Smtp-Source: APXvYqzjZTYk2tOWMRy6AM6z6YY/GDOEGUJsDkO1N8yBgU0T4SAHtCjUBWKM1gR8/5cXPWZiuIMrpg==
X-Received: by 2002:adf:f80b:: with SMTP id s11mr22927921wrp.12.1581603453831;
        Thu, 13 Feb 2020 06:17:33 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:82aa:: with SMTP id 39ls13413047wrc.3.gmail; Thu, 13 Feb
 2020 06:17:33 -0800 (PST)
X-Received: by 2002:adf:fd87:: with SMTP id d7mr23095511wrr.226.1581603453016;
        Thu, 13 Feb 2020 06:17:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581603453; cv=none;
        d=google.com; s=arc-20160816;
        b=PZ/0ebewk3ZTP4MJZQEH0o3HPLW8uDd0LApmLjvyB+4lJOU7U1dQYmqFsFdnORb/b9
         Vjca8kbZDZy/ryhZ8qzdmJhbEDYJ5zABaENBBYYpI3Ape59hVbg0O0nf1qQVwpbiKUzf
         EAIIzBXZPdr8dFdi372dBb+ds+ldZak8QzADTWx9ZYLlpz3Fmlqz4nX6OooQFhnXRhPx
         R4+REP4RDl7Sc4MG6ruAkJTl/Gcy4bFP6RnsK37y0nHSxdJRYpCGKpdEeBVRr4WXNIls
         U0gPiSAMIsy2Uz+sHz2TG5NU+a5XLRaIsQU7XkZy+pWcg7u/JDKQ894xT+6lm8Ew/NLr
         aJrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=B726Y1H6b5orlnuCW1DGcj2g1tTvxwvyTJZH23jlnqk=;
        b=h//TMzgzemsP2km/WyFB1vQzJbtMNDEU73mdNZzd6Nd0VWiuOupyBGvz33KxuYT6Fj
         g8U8EdXJXxEW/4x9/M/OP93BbBq/ERs8KL+sqaDGMXhMv8T61TTtuK0q4AiOHEe7F3Pu
         CN3Dyrv96cEz/CnZX+ahf7I1ulfOgPIQWQjp6WH2xrFZ2K5250Avlh6YZTaAuWa3p66t
         ZEARvY8AlgQcx2dkCkWPD4wdFGcBzb2NS96jEc19CvOcLZz0TrtXkYv+1IS7b2CluRUO
         lZTB+eZIsnU6TnmDOs89lv7d2hE6gRllcdW3ffNWpwpgNRM0nL1IEkuQn5fsv76/4Q2N
         Na1A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id u9si131858wri.3.2020.02.13.06.17.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Feb 2020 06:17:33 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 01DEHVxA030738
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Feb 2020 15:17:32 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 01DEHV88031093;
	Thu, 13 Feb 2020 15:17:31 +0100
Subject: Re: [PATCH 2/4] recipes-bsp: Add support for pine64-plus uboot
To: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>,
        jailhouse-dev@googlegroups.com
References: <20200213134430.3052-1-vijaikumar.kanagarajan@gmail.com>
 <20200213134430.3052-2-vijaikumar.kanagarajan@gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1b4ffcca-2b1f-cb4d-1548-c95cd4a2772c@siemens.com>
Date: Thu, 13 Feb 2020 15:17:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200213134430.3052-2-vijaikumar.kanagarajan@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 13.02.20 14:44, Vijai Kumar K wrote:
> Add support for building pine64-plus u-boot. Use mainline u-boot + ATF.
> 
> Build only the necessary envtools. u-boot tools-only build is broken
> upstream and hence not supported here.

Actually, there is rarely the need to use self-built tools. Those 
provided by Debian prebuilt are generally fine.

> 
> Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
> ---
>   recipes-bsp/u-boot/files/pine64-plus-rules    | 32 ++++++++++++++++++
>   .../u-boot-pine64-plus_2019.10-atf2.2.bb      | 33 +++++++++++++++++++
>   2 files changed, 65 insertions(+)
>   create mode 100644 recipes-bsp/u-boot/files/pine64-plus-rules
>   create mode 100644 recipes-bsp/u-boot/u-boot-pine64-plus_2019.10-atf2.2.bb
> 
> diff --git a/recipes-bsp/u-boot/files/pine64-plus-rules b/recipes-bsp/u-boot/files/pine64-plus-rules
> new file mode 100644
> index 0000000..f6340f7
> --- /dev/null
> +++ b/recipes-bsp/u-boot/files/pine64-plus-rules
> @@ -0,0 +1,32 @@
> +#!/usr/bin/make -f
> +#
> +# Jailhouse, a Linux-based partitioning hypervisor
> +#
> +# Copyright (c) Vijai Kumar K, 2020
> +#
> +# Authors:
> +#  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +ifneq ($(DEB_BUILD_GNU_TYPE),$(DEB_HOST_GNU_TYPE))
> +export CROSS_COMPILE=$(DEB_HOST_GNU_TYPE)-
> +SET_CROSS_BUILD_TOOLS=CROSS_BUILD_TOOLS=y
> +endif
> +PARALLEL_BUILD=-j $(shell echo $$(($$(nproc) * 2)))
> +
> +override_dh_auto_build:
> +	$(MAKE) $(PARALLEL_BUILD) -C ../arm-trusted-firmware-* PLAT=sun50i_a64 bl31
> +	$(MAKE) $(PARALLEL_BUILD) $(U_BOOT_CONFIG)
> +	BL31=$$(readlink -f ../arm-trusted-firmware-*/build/sun50i_a64/release/bl31.bin) \
> +	$(MAKE) $(PARALLEL_BUILD) $(U_BOOT_BIN)
> +	$(MAKE) $(PARALLEL_BUILD) $(SET_CROSS_BUILD_TOOLS) NO_SDL=1 envtools
> +
> +override_dh_auto_install:
> +	mv tools/env/lib.a tools/env/libubootenv.a
> +
> +override_dh_auto_test:
> +
> +%:
> +	CFLAGS= LDFLAGS= dh $@ --parallel
> diff --git a/recipes-bsp/u-boot/u-boot-pine64-plus_2019.10-atf2.2.bb b/recipes-bsp/u-boot/u-boot-pine64-plus_2019.10-atf2.2.bb
> new file mode 100644
> index 0000000..4842ef8
> --- /dev/null
> +++ b/recipes-bsp/u-boot/u-boot-pine64-plus_2019.10-atf2.2.bb
> @@ -0,0 +1,33 @@
> +#
> +# Jailhouse, a Linux-based partitioning hypervisor
> +#
> +# Copyright (c) Vijai Kumar K, 2020
> +#
> +# Authors:
> +#  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +U_BOOT_PV="${@d.getVar('PV').split('-atf')[0]}"
> +ATF_PV="${@d.getVar('PV').split('-atf')[1]}"
> +
> +require recipes-bsp/u-boot/u-boot-custom.inc
> +require recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_${ATF_PV}.inc
> +
> +SRC_URI += " \
> +    ftp://ftp.denx.de/pub/u-boot/u-boot-${U_BOOT_PV}.tar.bz2;name=u-boot \
> +    file://pine64-plus-rules \
> +    "
> +SRC_URI[u-boot.sha256sum] = "8d6d6070739522dd236cba7055b8736bfe92b4fac0ea18ad809829ca79667014"
> +
> +U_BOOT_CONFIG="pine64_plus_defconfig"
> +U_BOOT_BIN="u-boot-sunxi-with-spl.bin"
> +
> +BUILD_DEPENDS += ", libssl-dev, swig:native, python-dev:native"

Where do those dependencies come from? libssl-dev is understood, but the 
others? Just curious.

> +
> +S = "${WORKDIR}/u-boot-${U_BOOT_PV}"
> +
> +do_prepare_build_append() {
> +    cp ${WORKDIR}/pine64-plus-rules ${S}/debian/rules
> +}
> 

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1b4ffcca-2b1f-cb4d-1548-c95cd4a2772c%40siemens.com.
