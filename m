Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBDNPRPVAKGQE3ZBDIYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEC07DB13
	for <lists+jailhouse-dev@lfdr.de>; Thu,  1 Aug 2019 14:14:05 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id m25sf17260880wml.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 01 Aug 2019 05:14:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564661645; cv=pass;
        d=google.com; s=arc-20160816;
        b=xHqm+qd/v35t6lqsI041FzIgGc6o78tOXvfbxdaC/qjrJb86LG/jIdFCzTUMibzpgz
         wOTwl1IGIWUceF91O1OZ7pcKTYSTmTMSj0I4+jkx1FYkiU7hO1EG4FbB+9XdVZkGTDok
         ovYcfTWUjLl27RpKSCltV+2pAelKwa9HFAMXMbm/z8/HC3Cdm7emNgmWR3ksRlG094ly
         z+j57cH0XtOnA2zZpthkwi6PJ0lyRDTYWZVfXBZOG99tQUYIFGg6xKv1pydqUEvSI+/U
         a5kwG8Y5BYUd7WiXjfRipJo5PdiXi+tbmEjfar1giytALK5QOXafYoEIiOZDQG9/33Hv
         ZYPA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=CSPmrBoFkG7KeWUKVQS3F+3kWpa1++WFAhvKYVOdzDA=;
        b=TyauRe0zbG/LnXZ3xxPcMawdfjSLXUVAGmj29/4Fw3AsZNy9furNgmtNipW/twD87D
         6DVlsx0YsLesx2/Khupat98nZwoaqqU9JQ3JeZghHJlbXuxTsn/tRBT4IRBI1/HPeQfQ
         lvcQil7niTeOqWzb9gqQ9WJDnSN/5yCONux+w/ZTt8mklIk2PhZhmYWF+Lxp9YUhgA3A
         YT+zgis40MQ4uX2G6cICwI5H5pQdXPYn5iTXNvRRnno+qjFJ3oMQX6s7lc8u1+hUPiFh
         9nlmWjmCiSEGjSNSiKTIM7uCbkkc2NP7ideLk7IhBvcBP9phIrPIdb31Pc5nm6ESzmmn
         t3aw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CSPmrBoFkG7KeWUKVQS3F+3kWpa1++WFAhvKYVOdzDA=;
        b=pnIgD4jQAcmgT5XUXkUFumF86XvaXsfw0Sg3N+R+iAjWllLqV1DEd0N4IY+2nY4mYV
         OGUNJ5vVX3pIBVmQ7d/2sPkw9rKSj0S5JIPr26jimjdtODkjqCGZxomBGPw4r+aTmIDM
         8WWMnvCLln6PHz5jbd0RhW+rdaEr0UKbWEqokxq6Gx4TkDdlN2qgKfTIyCK8O9t0GbEL
         pLy/r2W3e7UfYjLC76oKk9kfvE9H869CKQ5WnuypNMqovP5Pj8R0++MYxL1+7VZ0TO2U
         STpXerKpVfOpiFA7pgyhdxNmSaX3lEXakvC7An6+uUZ5KfTacLp1o1NCJ0IIzhL+3L1Q
         ILkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=CSPmrBoFkG7KeWUKVQS3F+3kWpa1++WFAhvKYVOdzDA=;
        b=nqrwfmHFsnPoyammszsawyjvXpVHsh4//zTIFJDp9gN9qjbvPGGwbNxZy7iga7mqtv
         5toB67f6toWrU7zp+V6Ah8Qedl8wGP9ry45PY2iXbn3R942Kx/HpG86wtL9H2JilnsCS
         F+Obyz9h2qjPeEvTtY8wVJ/irAoV84jW6FpTu1X6RJS9ji6mV/USLLhWUlyXWVeQWMCz
         1lp/gDmJ5Xp/V2fLcXcmRUYVGiG+EgIJbQfGZONAcysVSbNzSMsXTnqOL9c9GRoArtng
         40jcu2soglP8S3i+vFoZIbXth1rSX84A+1CIgMOFdy5eD26LzKXV2gBW3+1H0Yxg81LN
         fssg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV29icxPjQ/GubjNMm/BEv5tejADoru3QnpSyfeleBZM0pidHQQ
	v5Q4AIUUTVlBuWt22Yex7Xw=
X-Google-Smtp-Source: APXvYqxZ8MZTEnKWKHnc7G3EeHiMAr7cpmF7Wwqdp+s7yVgDfC4hwtUFHEqnWGVkJXHQvPcs2jJLRw==
X-Received: by 2002:a5d:4101:: with SMTP id l1mr2210493wrp.202.1564661645324;
        Thu, 01 Aug 2019 05:14:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2d02:: with SMTP id t2ls25203903wmt.0.canary-gmail; Thu,
 01 Aug 2019 05:14:04 -0700 (PDT)
X-Received: by 2002:a1c:44d7:: with SMTP id r206mr119370891wma.164.1564661644711;
        Thu, 01 Aug 2019 05:14:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564661644; cv=none;
        d=google.com; s=arc-20160816;
        b=IfFIHT6YgpFhxfSXpYGicqiTIr1IwBwm7zDLoFYb42CiIU+Tz/WdWMtYauxkc5d1i2
         UthPz+08nk1hL7sA+THudfc0MNeTM9ohTAJvHmjN5NE1gMJsIQWK1aX/MUQ7byYw2IWe
         gsC3hUXtVB//c7IJl9zEhok27DCygGxFFk4YK8C3idRiYk39kHv8mIVp2qsWVPMiyX/Q
         R4WxCTRPAlBahPzFkBTOIXp3Enx1bGKtBoz0KiQWR3Fw/uq7Chl4d12gc9LA9baSXlQ5
         EZu8GQguI/TJVcOOVwXM4SK7+xYV95gFmdpUk68AgpxWjcKvbId2Mr+d8YbJH6roxSFE
         kZKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=r0TU1MJC8rzR9dxmK4na30fEinYirpYSjPASCCY2UVM=;
        b=JJg01ry2XYrKO/ynagqpCpqbZIG8fqvIiXKJ864niGxWZIGq9ioYX7ThsVamD1oyJh
         UGSrE5N66ar1AAg+qY3b2DHo0isp0wrRKMrMiOnA7wXX3no/GsZI0T+VWdypwHOtNV46
         Ff3lGw7wNjfVw+51+36mLJ2+NTiSsrtf6D6XJ1U+q/BGqFKYlugDN57rf/dqekWVtuPn
         3WDgeCQu11Lqfsao6TAH32+qNv53acaPtpslLaF0mhNVHbkCS6rKOq8fMmqwH1+g61RP
         btmEdthP7oziL3QKoAvJR49HtYPGZ0mzArViNGEmc60O5QY4O5ijH8s16tQdtm+1dKJR
         7rqQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id u18si4287503wri.5.2019.08.01.05.14.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Aug 2019 05:14:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x71CE3e0012833
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Aug 2019 14:14:03 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x71CE37C015286;
	Thu, 1 Aug 2019 14:14:03 +0200
Subject: Re: Disable RTC
To: sebastiansaueressig@gmail.com, Jailhouse <jailhouse-dev@googlegroups.com>
References: <eac59b7f-0f8a-447b-89d4-24f933319910@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <8ea6b608-7cdf-87b9-3179-da3262348090@siemens.com>
Date: Thu, 1 Aug 2019 14:14:03 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <eac59b7f-0f8a-447b-89d4-24f933319910@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 01.08.19 12:02, sebastiansaueressig@gmail.com wrote:
> Hello,
> 
> a short question that doesn't have so much to do with Jailhouse directly. My
> root cell and my inmate cell (linux) both try to access the RTC.
> 
> Unlocking them for both in the .pio_bitmaps is certainly wrong.

Yep.

> 
> I could now use the hammer and disable all RTC things in the Inmate-kernel
> configuration.
> But I wonder, is there a more elegant way to do that?
> 
> Possibly via the -c "console= .. "? or in the GRUB_CMDLINE line?
> 

When I last checked, but that was some years ago, there was no runtime way to
disable the access. That's why the jailhouse-images kernel has CONFIG_RTC_CLASS
disabled.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8ea6b608-7cdf-87b9-3179-da3262348090%40siemens.com.
