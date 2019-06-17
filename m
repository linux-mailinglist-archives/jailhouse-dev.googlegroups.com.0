Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB5UYT3UAKGQEEHM7HUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE9D482F3
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 14:49:59 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id a2sf1885927ljd.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 05:49:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560775799; cv=pass;
        d=google.com; s=arc-20160816;
        b=A/hPXSyA7iXBVXkSTj7/plylYaffbck1aYtUnhIJrwB5koNPOLIojuO6vWfkC7smAs
         ZY72jQuG9i0+PoddKX9AYUWjDfQ9Y8WdgreFNYbdz8elfvKMP4VoElL84AgLPTzF+dmg
         CtPwVrEmu17AfFQjwHdJeD7LYRUPWGkfXyRPXYlgBdzwmfYuYVUUVYIg8x1tL3HCQ/ZV
         /Ku2LS891erQXfTEnl3ZUmm/w9LPT2MsI3/OrRckE7DrUowlHFr/sBH14l6ZRZIrXEJb
         VnwQMA3Y9vpxpSbhEfw5wjH2h7M39hkR0d2iKo6JFB5DMKr9OaCo0e6ilAaW5vb4XCJT
         QY1g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :subject:sender:dkim-signature;
        bh=Hg1gR2G68iQCvHxLfTTQOeFV1npItrzf+Y2LW3Bta7o=;
        b=WZh4di1WipTqzTTvIoUKbuzBynem6WYKqUKtWlJrrxT67gb9XQ6OFdXDffbrm+rUEh
         bEEv615irZ364L/1vIbB9SqdbPJ+Qa5oxIrM2KePI0JzgznMvk6uGReLeU2EuR50YkCG
         wx7W/Q8W3g39Z/05oGDdeQ0Z1kOns+T20ZwBN8g35Yp8doj18ZPA97M9IAN8yQqgdlJ7
         rik1pc/kUJyTA2EmJ4zVSUCb8jSQwFV/Ah6xWiR9I4tCRTa6qbAGI+c6+P6Fslp9CpLI
         WMDDQ5ZPPwN04TvS0VTZ+Sr4c+8nq7dIhKsNqGyvKn8vDnjJ0eotKC6YI7GGa/V/oiha
         UxsA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=EmmyrMmz;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Hg1gR2G68iQCvHxLfTTQOeFV1npItrzf+Y2LW3Bta7o=;
        b=G9QMcQhi8nMNARGFS87xO1kVZnU+8i0iRvKzmB9vnZxNAuAz8xY19uqgRAVmq71THE
         LOG49B2uIfGyt1wtRrk3k/kX7btTSWHOSOnQXcySzXazSM/BTCGiOgXgJYGhWlnVjhj5
         zOfNLl0WzDDXk/x3+Ois2upRykcopq5wuyd0TgapGArsOW31OgbN1PdWfmuDOUOXWjNJ
         ZFhugiR7wigXfneBu1iPkIJvpJ9JEsxh9cqQNahwgCXw30vNJE3/ZdtoNcHgSvWuqp6A
         /c4AYwJllfiURqfDcVofO0fLO2tHXc0aVNxP7Ze0FhRpVE/gVl3lLik1Lnp5t0mOJRP2
         xn1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Hg1gR2G68iQCvHxLfTTQOeFV1npItrzf+Y2LW3Bta7o=;
        b=U4AwnG1ZgAsSnXQFd82b4AOO3QzUo37UNuLkOTa+/keHKIn6lTvkmJGSjVkQhEs4ku
         SHIBBXpCYSbfgMQM+RB0brlpV3C6nrlSdMGImKkOgLJlPwuRBF6SEw8CJsX+/OdVHXOT
         fyEq4q+DpjMMg2AOQoYVbsRnewU7Sa2fskv/4jyMdDSpPFHAWHAavHLKat514x2ubS6t
         6pQiNZNV/qtOWLps9l++anv6PBFYnuLyHoDeF01xU1FI04WUyC7J7b4reYlv+WZ44b/H
         OoXvAI/W9BETAyJ7ZbtC8H9h8JvdMhvpeo6ZiNUPP8gzoY3SSA5OPx/WNpQOVfYs6DIW
         AUcg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWs9AgiNzC+3F5AfQ6n4YKrMJ1yi0gdlefLuFEqn3Oz3P/AKooT
	5NMqC2CUO24xCAA/P2DSS8Y=
X-Google-Smtp-Source: APXvYqxOpt7zfhtFVVumrKMIkuxtPRZ8L4af+DF4QCWRwyLh5uyH4PPINnCNurlpzqlqXtoHerAPmw==
X-Received: by 2002:a2e:7d03:: with SMTP id y3mr12878804ljc.240.1560775799007;
        Mon, 17 Jun 2019 05:49:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:868a:: with SMTP id l10ls1844554lji.3.gmail; Mon, 17 Jun
 2019 05:49:58 -0700 (PDT)
X-Received: by 2002:a2e:2b57:: with SMTP id q84mr12379453lje.105.1560775798046;
        Mon, 17 Jun 2019 05:49:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560775798; cv=none;
        d=google.com; s=arc-20160816;
        b=JCcJiHvHdzH64NRMCCxgC1NDRjPk3i1a1TlUM117I0wg+RIe5KCgI09ZewmxEJcWlY
         dF3y+6Lfkb1qj2BqqyqSlG0GDktqQlYoD6Sc16tZsCKBK5FQ7UXPY1W2HwDslmVXxsPO
         /1/bx6uT867BNmDACeKh6WOv18+6qy7jbLSA6i7ZdILAVTFIe1uSaCkOkjTWigkhawJ9
         GkLcLHh42fdxK+02SwZYPyfijou9Bh9eT2nbr+bbdzvvHJ5RqK+SoH9Xa6EHj9F8J2D/
         wcwm4XYoSkQsd1R9B4E2MGQPaqpzXMciyOMVpIYGhBqzJ6jHgnH2KTbjBtRtt54EwRcL
         JFog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to:subject
         :dkim-signature;
        bh=JvFrd3slZQSmrMvMtfTtlm+EW+SUaUzS0wpfOB9KiDM=;
        b=irQtwQTAnF4QMm5gQFMa1ewpR/c98JY+FN0dAEEucUksGVTTis/ljBrmPTI0/5z2mD
         S662/3wtHFCw0IOl3eV5qP9ji6i+dU679N/J4aFJpGbE1Grt0Ch3l9tqrafCp3oN59HT
         JEKn6f7p0Ibj8bKkfXcGpgc64g8ebuBz13YlhW0SYmWeKndtRzIu3/7Xo0q0nCfKTQf4
         MOY0FuwPRHFm8dvXjRUcXv2uRC7MC/Hvmnet4mI8QFSIy4QzN5uS7nQDdTcY+XlSr7g7
         DPg0MarQHyotflRQYC9xrVndR8jpXP51CGFurGtakujIZaU7FDmLxKq7aw2vxeN6AYoO
         ICmA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=EmmyrMmz;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id q25si487112lfp.0.2019.06.17.05.49.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 05:49:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45S9z86fkNzyBH;
	Mon, 17 Jun 2019 14:49:56 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 17 Jun
 2019 14:49:56 +0200
Subject: Re: Freertos-demo bare-metal boot
To: johannesmaisch95 <johannesmaisch95@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <f8c8bb48-ac7a-4bd2-a554-0f42a31fa5b6@googlegroups.com>
 <90eb1048-d5b5-7dcd-fa9c-ff9b715bd97b@siemens.com>
 <20190604102704.7xy42j25eq2h67rq@jpc.jpnet>
 <9d12161b-a004-ad5e-0dfe-1b1c249358cb@gmail.com>
 <95b6464e-f439-9b8f-8df6-2ad7281c5cf9@oth-regensburg.de>
 <20190607073050.z6bwedzkvwvy6u5l@jpc.jpnet>
 <cdee0865-fb6a-4811-837d-b48ba82925eb@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <ab4e9faf-109a-8a89-3086-c4bb782c3486@oth-regensburg.de>
Date: Mon, 17 Jun 2019 14:49:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <cdee0865-fb6a-4811-837d-b48ba82925eb@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=EmmyrMmz;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

On 6/17/19 2:31 PM, johannesmaisch95 wrote:
> Do you have any ideas, how to handle this problem? We adapted the start adress in the linker script, but we couldn't get it working. Are there any tips, how to handle the problem with the MMU?

please don't drop content of old mails if you refer to details of them.

I don't know if it actually is a problem, I just mentioned that this
might be an issue that you would have to figure out -- the initial
status of the MMU is one thing that differs between bare-metal boot via
u-boot and Jailhouse.

I don't know how FreeRTOS is typically booted on bare-metal hardware,
but I'm sure it somehow supports u-boot as bootloader.

Is there actually an official BananaPi BSP to run FreeRTOS on bare-metal
hardware? If I google for "BananaPi FreeRTOS", then the first two
results point to Jailhouse. :-)

  Ralf

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ab4e9faf-109a-8a89-3086-c4bb782c3486%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
