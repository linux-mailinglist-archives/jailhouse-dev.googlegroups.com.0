Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBMGH5T5QKGQETGSA4KI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AC82836D6
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Oct 2020 15:46:25 +0200 (CEST)
Received: by mail-ed1-x540.google.com with SMTP id e14sf1065267edk.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 06:46:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601905585; cv=pass;
        d=google.com; s=arc-20160816;
        b=E3Wyr7Ji1ATrR/soyzT2RK/ynKo1JR5omW09GwvKEgP20dUEUjiv3c3TBI1uS96hP4
         mr981riSxA3yUBnjIEqBh7Ukm4pTHiVGcJD+Rh+2kLKlrxkB4NjeWmJkEcMVvefCsu87
         ky8IVnfwzAgf74Wu+BTjQ/QsvmJxFkYncP/4zPGUgFnqfnwp9jq5KYxj04ElRPF096Rv
         eLQeSnwMTZMF/SB11CxDm50EoBvNscf7l++Y7/fZNFegRgizIxgYlq+E01vo4IzEFX0M
         jcOkuNq8uA67t8g6e+jgzg1hhmimUccKmaoJkZWv/rjfSOKafTBHPRuRGH7DCSVBcgO7
         prEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=DfBfsxouAOCCRgiOBCBBZ34Nz6pnPtVciiQIlgVx0E0=;
        b=KoeD/cvsgC2fisfKPCLlxoR4D/Epxhu1IZViSRbzD/lvpF3fmyBUXPFg6rSIbUQRW8
         pxLbzrmKs4fz6hkZ2KGb3yT3jszdpXhhTY5HX+eRf3nnHNlsLzC4mFMzgMUpGkMIVWlR
         wST93XO5f535uCysH5F64YsW1Thu3lagPARTcW74wm7yPbb0TtRfmvvxIabHPVF4SMex
         +NQ4yZVFCpwnkzGFMbgC0tv7sg31uz1yeIXJWbDPpsx9AN/piJPguPx4I8RnD1FhjdBy
         NwvoIYUdpQWY1mATU+6PHR/MDpVraSJRwL3K+ISj7NsOCn8L+CKHg66ThwW5QtJVh+zX
         YJbw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=DfBfsxouAOCCRgiOBCBBZ34Nz6pnPtVciiQIlgVx0E0=;
        b=AX8EblJyPRkXGCW0waESdUeIphq7khTYnDUWEFIuyUsdZFpEkEYsSxuUZ2NDfjNmmN
         +wx2SyiK5cvC6OBnAI2vJg7+YDCNywIZRrkLmAUgVb3weei3QDQQoPuk8Fda53sBw0Gs
         l58MRbqSqvVIAo3XO6Jnmkb6L8kFB5su1sQ1sFGaPJeB40YRpnSTI1oUUKb9bX9wCXGa
         LMlwra/mmsz9lXkW/zx/xhO5aE66vg0UIAgKFb9MoYBfOkg8tCK3g1QmcqNBRbh+j6eW
         8uYCRcepvDFHbu/6KM7qFABlqKpbs2oHbyxBIaL0kwHEJ4YDF1Fy7WvX29EcknTPyGK+
         cfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=DfBfsxouAOCCRgiOBCBBZ34Nz6pnPtVciiQIlgVx0E0=;
        b=FqSKoFjhN843oamPyM2S7x39E/kzkhcBX/qlduJrd09UEAGureSYWP/fIcOcalRT9f
         Cp9VCr8WwWIkhnviRS2va4vr01PHrUfrtoIS51aqO1fbvvJX/rBQ1wPk7Rsp5DDtVAdC
         tQtu0itXiSCjKyar9LAyW/TY8XQZXp8PbkYRv8KaNSECbH7tJIinTXKwDwvFmAqQIR8g
         NCvOxsLT84qZB3DPXS0HLT3Pwld5klmtVfAhTtQMrsXrV3uV+imi9xl96/COzQX4MusB
         bJjOa+RUhQ94ErlSmSfy4D7SGCU7AqqlmnvdaB2rsHcXDYEPCPRXlk1Si+fzsQ25x4w/
         O+og==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5329i9MP3u1EY7soJRK7GZfLxzqOB4+btLg13IZTW2pogkY9qcA0
	UbpICktapaTLdghZ9xajBgc=
X-Google-Smtp-Source: ABdhPJxgICGfIMzmiwx3FDJUQpmneLUU1rtPs7LvW3W34YKj7ofM4YZC7athLrzzHwr1bDHZp4ybAw==
X-Received: by 2002:aa7:de97:: with SMTP id j23mr15927980edv.45.1601905585167;
        Mon, 05 Oct 2020 06:46:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1d3c:: with SMTP id dh28ls5392479edb.0.gmail; Mon,
 05 Oct 2020 06:46:24 -0700 (PDT)
X-Received: by 2002:aa7:c1d3:: with SMTP id d19mr2122980edp.293.1601905583995;
        Mon, 05 Oct 2020 06:46:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601905583; cv=none;
        d=google.com; s=arc-20160816;
        b=GaiZULEAjGHSiSOSlX12CoVTGoZ49rnGSO4GbTgY4LIHsTd+pmbRU+8Jh2jg4ceC44
         2b+MC9KI4JIRmYx8Dmf+KvcWcgR8ka+riooxobBPBhU1mXcTjE1C4lFyre7lqCfwc11h
         zvkx8Pxe7o0LnxNaHNWB85sUoDdRGKvos4fdQFqKmU5J/cG6+PORxEo4xb5hnwyZ2vqG
         z4CQPoxOxypaceV8ZTg/cG7Te9hhdnxdoRyMPW9HfwgQ8UGHTrMpTya1foV8WEj2uYP0
         D+H0cLE0Szdq4bRYF8BnEYCd3+twl9gPXtI/Bnb95JJIXHsP2cnTPwNZhFb570MaLFZN
         Qk6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=XClGHCD3egYPxuXxPqFRSmBFFcvNtOpfmndNzndOCXQ=;
        b=IKdpSi5Vv8uIYFwGq/T2bG5FMbBhiZT0Y3cqkyC9RL6P3KxI3GgGCt5m4/uJZPVyYx
         FWA3q6/dbUrTK40HjIO0LdcbZcVBXGtfEaPq5+Y/0XHX/WSvmFh3lXeUDgWc6AvbOfEb
         Js7xw9wCGPUtQ2x+OPkuDK+D9mZEWyl9zSOAwx29CfW1TJAe9eAVcLJZS0YX4cN9Aeb/
         7Ga0m4KmIzfj2XIWdNiT7z8d9ZzLWPEmC5C0wnZERJI8zgdjNfLZLxrVx6e/uNtKGYDD
         f4wUQMrgGfs48GWv/5q9e9ltRdF6zIgHoqYlQ8uq80fhOBoZcpSttal/MrXmW7Za+s9R
         dMog==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id a16si425322ejk.1.2020.10.05.06.46.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 06:46:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 095DkM3M026227
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Oct 2020 15:46:23 +0200
Received: from [167.87.39.163] ([167.87.39.163])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 095DkMS3031759;
	Mon, 5 Oct 2020 15:46:22 +0200
Subject: Re: [jh-images][PATCH 00/19] Add Ultra96 v2, refactor/update TF-A
 integration
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
Cc: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
References: <cover.1601876389.git.jan.kiszka@siemens.com>
 <f13614cc-920a-e8f9-8a36-e6992b736698@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1a0cc554-a3ce-1698-4d7c-392498d73fc2@siemens.com>
Date: Mon, 5 Oct 2020 15:46:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <f13614cc-920a-e8f9-8a36-e6992b736698@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 05.10.20 14:53, Ralf Ramsauer wrote:
> 
> 
> On 05/10/2020 07:39, Jan Kiszka wrote:
>> The primary functional enhancement of this series is support for the
>> newer Ultra96 v2.
>>
>> In addition, the series refactors the Trusted Firmware A integration,
>> using a soon to-be-upstreamed Isar patch. The refactoring also bumps the
>> version of TF-A and U-Boot on affected boards, namely Ultra96, RPi4,
>> Pine64+, MACCHIATObin. For the last two, I'd need some test feedback as
>> I do not have them in reach.
> 
> For the MACCHIATObin, please find the log attached. Early stage
> bootloaders seem to run, while u-boot gets some abt while trying to load
> the device tree.
> 
> Test on jailhouse-images/next, 6d797f1f59d.

Grr... Will be hard to debug remotely.

Could you try generating a card with the old U-Boot revision?

diff --git a/recipes-bsp/u-boot/u-boot-macchiatobin_2020.07.bb b/recipes-bsp/u-boot/u-boot-macchiatobin_2019.10.bb
similarity index 52%
rename from recipes-bsp/u-boot/u-boot-macchiatobin_2020.07.bb
rename to recipes-bsp/u-boot/u-boot-macchiatobin_2019.10.bb
index 2bab197..088188e 100644
--- a/recipes-bsp/u-boot/u-boot-macchiatobin_2020.07.bb
+++ b/recipes-bsp/u-boot/u-boot-macchiatobin_2019.10.bb
@@ -9,7 +9,12 @@
 # SPDX-License-Identifier: MIT
 #
 
-require u-boot-${PV}.inc
+require recipes-bsp/u-boot/u-boot-custom.inc
+
+SRC_URI += "https://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
+SRC_URI[sha256sum] = "8d6d6070739522dd236cba7055b8736bfe92b4fac0ea18ad809829ca79667014"
+
+S = "${WORKDIR}/u-boot-${PV}"
 
 U_BOOT_CONFIG = "mvebu_mcbin-88f8040_defconfig"
 U_BOOT_BIN = "u-boot.bin"

TIA,
Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1a0cc554-a3ce-1698-4d7c-392498d73fc2%40siemens.com.
