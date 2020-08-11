Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4MYZH4QKGQERV4YQEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 239CE241783
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Aug 2020 09:44:50 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id l5sf4251913eds.16
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Aug 2020 00:44:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597131890; cv=pass;
        d=google.com; s=arc-20160816;
        b=hoWn5JdUBzcQ3+FoWhLdFPp+aSNm3GodNQydsHpJ/dHY4Uqm1kS5KILRXpYUpN0ISF
         DKabMtjilm6qcldyAGL0LOFApR88YoGibwJXSwiTtpcqr7nSV+ileJ2Myml6Hp+SHIqm
         8DTQdj4Npfg3iKku9gW8BTP/5DqVgOX7DczACr0k4oRQ076YdRhcdQ5rjp6eLtPbSPrI
         OuBKUXPQHJfsorSnf+UyKH80dodkO8iaMHSMN6GwvqYw1D5PdNRMZCZ8KblT1dJWfDlr
         yZOB3z/hpsx0UPDDcl+yc2w9BnMtp6bNIS0zirc3RnQNelkEHpUSid71BMtBQHksAFVL
         XokA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=h5wdmSN9NGBYyMYVX5eZVQqJ+xJ1lFC997Avr7+DLQo=;
        b=D3OBBHv5JKBIxi74PBm+GBc/UjNiRo/Fpe4c5a33/kE+BqstAo/uExAkYQEIsmC4bs
         hpMxmTc8poA/XrZf0bv8mnHpxSTi/8jFuzt2qGOQFdmRl34DHpvMU4cK0hpawj8IvPmV
         oQk4NGtE86xF15ckJ9yrSlFa6qMbl6DzMp17oC8Tdfa8svo61lTKwh/pNHXQSY89+VqC
         1oNmOdRan48qngYxoumYSp8soAXTvf25vXZRWvuyQsBewS9/YxlmkkmQoPawxO89WI3A
         2+0W6C+qw2HTlhKFlNXRwgdL0GkS61pt06a6cUGPk7jle0iY/kkCOEKK6RbA7xUfsC3A
         L0Ig==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=h5wdmSN9NGBYyMYVX5eZVQqJ+xJ1lFC997Avr7+DLQo=;
        b=IKBwl8dK5jrUnQv9xCXrSidVqa0990NyBP1VE0U53zuxNDvm1D9lKNsPa12qHUXpHJ
         MPIFv6N8aFdYHDZYrsszflCamK5NRMsX3UIR4VSF/vvWIF1870FhMAWs+7HpshMkpRs0
         gtNHZwpduDiRA4LV1uPQ2F5uNijXyRD2A/WVavUPKvGk8+2onM+SlwvDHaJPXiG4xGG5
         XJR8qzGxJsSoOAZSCs+N/6MDun0Wu+tqqoQc1cN7wHQrjP8Ynf9OHQF95dUu1RaulnHu
         UH7mALZk/iaigTg96ar1pVnZ8CKfDydC8S2zqH9BbwCEP8uhqBlLEFgPf3kEwAxkJj0y
         limA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=h5wdmSN9NGBYyMYVX5eZVQqJ+xJ1lFC997Avr7+DLQo=;
        b=CMlpyW5SVOrmZg3kHfr9U0dLb/oFpaaiEt9LgWmcGYIQib9nZUdpdHnAH0v4gcZAfC
         0QSA6YND80KTMGeRxIkBMtKWvRdpOMXzv03oSIcDtwFykYPwxSaak53UaFLiQBjZQmuk
         MPz+yj5fYb8T8966cCVXVvvwB5kKZUnfwizUrb3Y8uEQfPiUgP1D9dpd361vlmYdteKx
         tWa5FKbMDpdx+XDjlO16oOjQv6BtoxTXgj6VeMe0vIzzuHpuFyE5I5g1/Yp/l7thiPj7
         +lJls5xNWP9+d4yHEf+io9jT9sYjh1fTwdzCzVl+rvB9BJeqq76CN4zFc9EnpZ8tJJ8+
         qU1w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533miD6tdFe+4QgaXSlgO7sB6bR9cpfcBNefs/1XmG2i2tJxfjnW
	wciRjnMwkOBX+hHM6Pxekao=
X-Google-Smtp-Source: ABdhPJyR4ZonPdgIg7JJhBODEzsm8CxJVTuvnBBJQTbf2uBJvHbDJgus7wPAH7bbzbMDOiapYZu7kw==
X-Received: by 2002:a17:907:104a:: with SMTP id oy10mr25283235ejb.267.1597131889821;
        Tue, 11 Aug 2020 00:44:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:b01a:: with SMTP id v26ls9243419ejy.8.gmail; Tue, 11
 Aug 2020 00:44:49 -0700 (PDT)
X-Received: by 2002:a17:906:359b:: with SMTP id o27mr26393109ejb.103.1597131889120;
        Tue, 11 Aug 2020 00:44:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597131889; cv=none;
        d=google.com; s=arc-20160816;
        b=wP9tWO1Irn3D6jTllaG1D8peGdS02vCp+uZywXrUVB3m6ZbvRC0lZaFbQj/MQbdVH7
         gZFVvKT/lx12VHV5V9liG3R0G8AknquGi5y69aUwzWsFK8JG3H2j1Tl8elry6esQShtW
         My5nWk7cXkMm+DvK/ryE3sNmBZIsdUFxaZYQNNyUBwLf5oeSK8VHMJFhwctM7unk/dOM
         ICEEeKi4KEFYrMB/GY4MdI+7OozU0/40hfDbt7aVlTEZeCaO3+JGGPsMaOf5zLBJUbf3
         +md0b8q4R8qYMHmOQLB2FI9JJRlgHyFunxwZEfQJ1iTISeEU8uzMMiqjg/JLNbURVds9
         ARkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=PYyyiAbte3JvooFU5FXVlYRYrfyBtluZVqTjeakZydQ=;
        b=mUcGlGoI+63Bqt06IjlMStCDlynLgfq6i27A5nAFhy59scN9IuhH2AtKZNWcy/gr20
         mzCiI5KoI7JhbUIOK3fOFh8IfR1p6y0LO74qoldhJjndxiIsUSZsDnMJtzpubCQekL97
         SslbX0GBLtXK2qfc+HNPoMI9s5R1HjdetZWjKZTttjeQCMjfhWft9VXVwc0Y0H50bmIR
         1uzA2R9eklPnypE0TqyRp8XI9bkeQ7C6tjdrp7QaYSC1StjEujipgugn7Bdpd888r+yq
         tQJzCOjsQmR8OvszJ0B4GqpRbCgxer1STTGYJEWzCeHnAk4fg7LpNmpVieub1PCVGdXu
         LQCQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id h10si1146390edn.2.2020.08.11.00.44.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Aug 2020 00:44:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 07B7imb7021350
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Aug 2020 09:44:48 +0200
Received: from [167.87.76.230] ([167.87.76.230])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07B7ildl015951;
	Tue, 11 Aug 2020 09:44:48 +0200
Subject: Re: [PATCH 00/10] ARM64: boot jailhouse before root cell linux
To: peng.fan@nxp.com
Cc: jailhouse-dev@googlegroups.com, alice.guo@nxp.com
References: <20200807030632.28259-1-peng.fan@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <891d13c9-6845-ef65-36db-4327d6736361@siemens.com>
Date: Tue, 11 Aug 2020 09:44:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200807030632.28259-1-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
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

On 07.08.20 05:06, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> This patchset is to support boot jailhouse before Linux.
> The previous RFC patchset:
> https://groups.google.com/g/jailhouse-dev/c/IZEFz-e2lh4/m/BBmGI_spIQAJ
> 
> Patch 1~6 is to create an new folder libbaremetal to hold
> files that could shared between inmates and new bootloader.
> 
> Patch 9 is the central part to boot jailhouse with a baremetal
> bootloader, which only support ARM64 + GIC_V3 now. It will use
> psci to power up secondary cores, do GIC_V3 dist initialization,
> Then kick inmate cell.
> 
> Images/cells loading is done by U-Boot bootm command to boot a fit image.
> 
> Patch 10 is to support using jailhouse userspace tool even boot jailhouse
> before linux, just do as "insmod jailhouse.ko early_loader=1", then
> it will bypass fw loading and etc, but setup information for linux usage.
> 

I'm missing the big picture description here:
 - how is the memory structure that the boot loader needs to set up?
 - how is the handover between loader and root linux?
 - how are things configured?

From a first glance at the code, it seems a lot of things are still
hard-coded, likely imx8-specific. That may mean we need to work on the
user story further.

Also, a qemu-arm64 target would be good.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/891d13c9-6845-ef65-36db-4327d6736361%40siemens.com.
