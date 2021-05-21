Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBFE5T2CQMGQEHM63M5Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B95038C524
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 12:42:29 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id o5-20020a05651c0505b02900e5a95dd51esf8646919ljp.10
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 03:42:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621593749; cv=pass;
        d=google.com; s=arc-20160816;
        b=v0c7M17Tb5Totjtc3Rsl6yrhOO4U/tty1BUBYSTgLSXHgg0Gb2QMCSsF6C5H8NHHej
         +fNIBMAjlXbCwceXEbcwwki751vtlUMtqK+wfIHYxszxiPzSLMrEflo3Z6jW+MIg+Wkv
         4MynhtH/YgMqUddbAg/ixvNjWhZGqa+GW7wQolhFGXAl7JAXBpy+Jz3BAm3PoNCNVh5/
         J5PdUyFXiOivLnN9h4qxB1ddxsMrm2yVyI71OpAMYmf32QWUN7qd1IuUBjL+7150yFwg
         ISXgEeSNvOsZEssZ6W3k1uC+BTHvOfbj4NbHmdK5xMyzUeszi+w0Zv/dXbvMmTVlPDvF
         8U4A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:cc:to:from
         :subject:sender:dkim-signature;
        bh=iVUDrKIpCffplYySG7Je0jbO5XAbti5pybhAcsXAJAs=;
        b=WE/Q6KcCk0JHGQ0LCVs56NHeu+7+W2ri9Bi8KILJwIsmyorl1WKQ/wzVMA3oLXBHp5
         HNqiRKlEGAgh5s2Sf7s19QLDEdyH6BHeNj5hUmja9PdGYwKv+CZ4elK6x+QfmYuIw3c3
         hOJUmXNFLsowdMUhcAn7SV8ek5dyT3vgt5lWj/9CXfztHhsFkqVmWji0ekA7LeZP4AUI
         5tjBUbQ729oZwdSt2yVq/7BUlP7+ycmB2asA9zt5CJZHHMj8cVWMndrG/VGiFayL5mRj
         vU6cV4dxpQ+s2bKF3EPsqwWBNAygnmzwF9Oy0upv/cKtAVuRNPMMDy4502y+wTIxFT2L
         qZ1g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=iVUDrKIpCffplYySG7Je0jbO5XAbti5pybhAcsXAJAs=;
        b=FSKSksHn9BR4IBTBPNBD3dSNifQN3k7uJ8EgY44BDk9n0TUqSRetXcynrHzYDY/boG
         BgAMny0DNsFGcpZ10QAjAnjy//j8nkNZbDoZL/2foL7U5W7gqigytiG7Teo76O1jaJXx
         rsBDMI6AjsZ32HQLDU95g7BzvQlvdpaYkuHf0z/RUJcCDL405FfJEjiCBT83ooivup2X
         LGm6Ws+OrR8SdFFT9CzihyHHThdwpBcoc7nyRdDDFr7PXP12k8S+PoIkihQI5FMraNgk
         XfAKpOuyuBzKPXpgGECtqjmr1OBRv3TpBH2awyAa8SRQL11tGNnODPYKnuPxbzTo5Xyd
         X9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=iVUDrKIpCffplYySG7Je0jbO5XAbti5pybhAcsXAJAs=;
        b=rA/IfMM7OJij+6OQSE9+NbaLt29OMzeYqA5cilRkaiX+0LHoymFqxoV8FY/gUDkxHu
         gU/BHWxn3kmCJbGf6Nlpl3NJhrYq+GrsH0g9xCeQfSqRQWYRY4S2z5c20lnUKeBHeI6z
         2hv6r8M+JHtxQaGnImYXjTR3o+9biUA0qKm9X3RPppLoo6SWd3yPfzj+cCxhpKn06XC1
         wjX8EQWBvwmFdO0QESl38wsQiat2RQV5eUeUZEzKWCWcK7eeQGkRmO8yjcjc1yKoZHkM
         9AcyScCWiUWitgwD4vz5+//HAiShVmALouUoHnZvIEjoNcyF+/AAPz4Mgfwiq6jWBuJ/
         lo5w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532GnejUhmjaDYW/WwGHl8+qBdo+VO3GX4hkWoExhjOylQIzVQsO
	XYEUyklm1wYBfKYEUUQXwHI=
X-Google-Smtp-Source: ABdhPJyGMqVBUcSQqkZiqFGn8zYiDH9Xo2nU7r1jb4Kk2mUYn1dzJnjSOWVcT5EMGLVIa32ZCIubcA==
X-Received: by 2002:a2e:3317:: with SMTP id d23mr6590475ljc.60.1621593749138;
        Fri, 21 May 2021 03:42:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:6c2:: with SMTP id u2ls331979lff.3.gmail; Fri, 21
 May 2021 03:42:28 -0700 (PDT)
X-Received: by 2002:a19:c107:: with SMTP id r7mr1730591lff.247.1621593748092;
        Fri, 21 May 2021 03:42:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621593748; cv=none;
        d=google.com; s=arc-20160816;
        b=HWBVJ+EYJAC3FR++sFpq3zdUwEIzzI+aaBk/H7t2/9ImA/iQQ51QFuyLCtpJjkV0g3
         2dpolaFnfDBf1II3cKXuNZ0LgrJ2rB72LFdS0jDvhTUWliCxwp2Hlo8Q0NRRW0Js6jpa
         KZP6MLkHnfnOfzg4ET8MgQxMpfMvWw7L1kjMfF9PTCzaBZUTMrBJAtpdhsCEW4ZmSHGi
         h8X4CU0st1OjVzFYg1mWRMVgmuFQpl4PSzkHJkIDcV4cybDkgMOKqbY5dUdMYAnWfA6d
         ydXJ/0Akg6z9duScqej0HSI2hGWMGH33fvcnqCrb3SKjwNv4PAFAxZ9NecMDYD2/Zm7h
         Q1Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject;
        bh=nIW3jcEezDJCZybmK4mziAlpF+3tUilEqBd9UUwrgVI=;
        b=m8qFF9aAPMHgZd+KZubdszTuldyxg9NKOzE3ztT8IP+48W7vrNToiYgylBlT3LWLv/
         /OptKD0JpQEPMBy+iWTw8KN7pr6TZAQjyfHE5bdAb9xRKCziR0ROIuxADL9JZsOA2LqU
         qa4/bf2MMw6vNUVTQSMy4iuQKU5yqpM0xxEjMWNQuK5bXtQtN+yBIzZqKUH6C106Iy/M
         gIogFX5l1KGtqzZDL78+ccBxY0OkmMWNWxFXq5ENIStmagK9xwMTVOCEnOmKkLTeAAG7
         QYogDpONXD4nZ3AD3aXKspirHEdXtUXtvONd+1moO2Tp3MG6MDccUpUM6HXFq8zDBw8w
         xOOw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id j2si277666lfe.8.2021.05.21.03.42.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 03:42:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 14LAgRZs007295
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:42:27 +0200
Received: from [167.87.240.49] ([167.87.240.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14LAVU6T027505;
	Fri, 21 May 2021 12:31:30 +0200
Subject: Re: [jailhouse-images][PATCH 1/4] jailhouse: Update debianization to
 be ready for Debian 11
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Florian Bezdeka <florian.bezdeka@siemens.com>,
        jailhouse-dev@googlegroups.com
Cc: henning.schild@siemens.com
References: <20210521080646.488836-1-florian.bezdeka@siemens.com>
 <20210521080646.488836-2-florian.bezdeka@siemens.com>
 <3c5fb82c-a704-3ef4-e37f-c18f04187d4f@siemens.com>
Message-ID: <86f41489-f4a6-e6db-7625-a2582b2f34ec@siemens.com>
Date: Fri, 21 May 2021 12:31:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <3c5fb82c-a704-3ef4-e37f-c18f04187d4f@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 21.05.21 12:30, Jan Kiszka wrote:
> On 21.05.21 10:06, Florian Bezdeka wrote:
>> Debian 11 removed python2 support, so we need to update the (build-)
>> dependencies to python3. As python3 is already provided by Debian 10,
>> there is no breaking change.
>>
>> Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
>> ---
>>  recipes-core/non-root-initramfs/files/debian/control  | 2 +-
>>  recipes-jailhouse/jailhouse/files/debian/compat       | 2 +-
>>  recipes-jailhouse/jailhouse/files/debian/control.tmpl | 4 ++--
>>  recipes-jailhouse/jailhouse/files/debian/rules        | 2 +-
>>  4 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/recipes-core/non-root-initramfs/files/debian/control b/recipes-core/non-root-initramfs/files/debian/control
>> index 5ff2c5c..0ae9a97 100644
>> --- a/recipes-core/non-root-initramfs/files/debian/control
>> +++ b/recipes-core/non-root-initramfs/files/debian/control
>> @@ -2,7 +2,7 @@ Source: non-root-initramfs
>>  Section: misc
>>  Priority: optional
>>  Standards-Version: 4.3.0
>> -Build-Depends: wget, cpio, unzip, rsync, python:native, bc
>> +Build-Depends: wget, cpio, unzip, rsync, python3:native, bc
>>  Maintainer: Jan Kiszka <jan.kiszka@siemens.com>
>>  Rules-Requires-Root: no
>>  
>> diff --git a/recipes-jailhouse/jailhouse/files/debian/compat b/recipes-jailhouse/jailhouse/files/debian/compat
>> index ec63514..f599e28 100644
>> --- a/recipes-jailhouse/jailhouse/files/debian/compat
>> +++ b/recipes-jailhouse/jailhouse/files/debian/compat
>> @@ -1 +1 @@
>> -9
>> +10
>> diff --git a/recipes-jailhouse/jailhouse/files/debian/control.tmpl b/recipes-jailhouse/jailhouse/files/debian/control.tmpl
>> index c8e625f..8caee4c 100644
>> --- a/recipes-jailhouse/jailhouse/files/debian/control.tmpl
>> +++ b/recipes-jailhouse/jailhouse/files/debian/control.tmpl
>> @@ -3,11 +3,11 @@ Section: misc
>>  Priority: optional
>>  Standards-Version: 3.9.6
>>  Build-Depends: linux-headers-${KERNEL_NAME}, git,
>> -               dh-python, python-pip:native, python-setuptools, python-mako:native
>> +               dh-python, python3-pip:native, python3-setuptools, python3-mako:native
>>  Maintainer: Jan Kiszka <jan.kiszka@siemens.com>
>>  X-Python-Version: >= 2.7
>>  
>>  Package: ${PN}
>>  Architecture: any
>> -Depends: ${shlibs:Depends}, ${python:Depends}, linux-image-${KERNEL_NAME}, python-mako
>> +Depends: ${shlibs:Depends}, ${python3:Depends}, linux-image-${KERNEL_NAME}, python3-mako
>>  Description: ${DESCRIPTION}
>> diff --git a/recipes-jailhouse/jailhouse/files/debian/rules b/recipes-jailhouse/jailhouse/files/debian/rules
>> index 0b53ade..8b14792 100755
>> --- a/recipes-jailhouse/jailhouse/files/debian/rules
>> +++ b/recipes-jailhouse/jailhouse/files/debian/rules
>> @@ -27,4 +27,4 @@ export ARCH=x86
>>  endif
>>  
>>  %:
>> -	CFLAGS= LDFLAGS= dh $@ --parallel --with python2
>> +	CFLAGS= LDFLAGS= dh $@ --parallel --with python3
>>
> 
> This depends on jailhouse/next containing your python3 patches as well,
> right?
> 

"Yes, see cover-letter" :)

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/86f41489-f4a6-e6db-7625-a2582b2f34ec%40siemens.com.
