Return-Path: <jailhouse-dev+bncBAABB6V6XHZAKGQEZW4VEXI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x637.google.com (mail-pl1-x637.google.com [IPv6:2607:f8b0:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7EC165B80
	for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Feb 2020 11:29:15 +0100 (CET)
Received: by mail-pl1-x637.google.com with SMTP id q24sf1960611pls.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Feb 2020 02:29:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1582194554; cv=pass;
        d=google.com; s=arc-20160816;
        b=lQFavq8iiWePmGJJuPiOq68IfAkbuRafyAd4plRrovOMFFVy1fojCii6WAD+xB3OpN
         Cz1GQgbXJ2FGDhjgR/D2C30Am9g2ir8xO+BVrsYYvHCfUkTwsyrTlLXh9lA6Tr6zlQRD
         5jH6qrJY62OKXcjAHHZ2Y0pKUXsknWJDjHguGCIYUOY5k/RSwGx4S8QSr3EK3DrOoyY7
         rlwUV/o+kcIYOApGmVCFjLG7GTLioC3O/TGHVz1UhMmFkS35Cifc1YL0+QXHsIn9EWOG
         DDGyTQCxWGG/a8d/YW4+LFuMb9a0cYE+5XF8Tf7FicaatH9RW+e5NfLY7IOvbSFKulXZ
         ZAkw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:user-agent:message-id:references
         :in-reply-to:subject:cc:to:from:date:mime-version:sender
         :dkim-signature;
        bh=0llqFJK4t9y7pDICFlHC9MkB+HrYgf5QWclho+K6F0Y=;
        b=OJF/KKwXcdir/3TQPcA/cEmpRkpfDOuvkyBQ/4kha/aVCAV6/O/6nqJyFHkC1N3QmK
         Dje7s5seFTrNRbhGIpvMYGYXZOnxqGCTE3zeGROP9+XVbN1OhnIb+BD+wEQHtrqw3Mrf
         xyb1UfHBZlHQLJDKQIaMlSs0ZU/fRR1L5tcU5S1DByaqUiuZokYFj/i4iNifxY/xB/yp
         P09gcvWiNJTC1W9S3P8E+5ylVhiHoHLT2krPmlE7neaokJLF/k2zUPg9/fWDFke0JzA2
         7QFZ/g2lX2GkevZkq8bjdzw9SIBty3qo7YPgnydb9+i3vJpd4N7KT3VPQP12jCyJXOjQ
         PYmw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=JeR9EVZC;
       spf=pass (google.com: domain of maz@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=maz@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:date:from:to:cc:subject:in-reply-to:references
         :message-id:user-agent:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=0llqFJK4t9y7pDICFlHC9MkB+HrYgf5QWclho+K6F0Y=;
        b=TciA6VNuQmjEl0m6bUMfMCUuBXi0LR1Qo8oL5Vbn8rsCqF2sAkwa/HfHmW5KWisKfA
         9d+1VSQQWgSOPVjKriy2eKQonqvTeKYZG7se5psHsoOmchy3uU803ZXRZycqZq+ItD4o
         jQGYpnuL/4hMLSZO25D3gUKpdQW/9zZjosXb+ikFcNU87Hx/RkWdbJNsAwTzNZcftp1Q
         Xfi4cuC6DTBGmKuym4iVhhP2av6dzEmFhQLPmyHa/IhBOWejz2/qvkoyOZusj7XqtlZH
         H0u8+2j/du1BGRMW4gqj++AmAyAfw5XfJ5KxjLRGd8xJlbvFeYAG0Dq3zhTJB94PU/T/
         01Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:date:from:to:cc:subject
         :in-reply-to:references:message-id:user-agent:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0llqFJK4t9y7pDICFlHC9MkB+HrYgf5QWclho+K6F0Y=;
        b=WeicDWMBKgA4OxfLDFxxID9kt8Lj4Qjt/6H15o60nKVT5Jqauz/WPv8uXxJS8Wirgz
         E6KWQ+GEtEM3a3Fp+K62YA3uE8fCB6NhG6qJY7WjLXRv3Z3ZjG4BeCABCQwyzP+49XH4
         GxN6mZkSa5ri6TOXWOgBk7KUhTqfZRpCsyw2lME/K5JCuUxoOFT0V+dRTF1dEw2EYFfn
         W6OQEn0esB+k2xyX1FGSxrWUV15hnvHaAfQXV8mq9GwfNgk4/R03wofyxV5uKcMEBWs4
         28caECIUx9QoXJla8+FwyWLPncPDTX7eLuES59km/4vB7SRl97tR1eLWafGHN9asXE8X
         A3OA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXRoKtCrye6Kb0+HQ6urHOxvDc/QRDpYgtm8RILB0OzXm2zB+r3
	4ERgmEq6CMrFPaBbDI3lPVc=
X-Google-Smtp-Source: APXvYqzVZOXWoU/dg7d6W7fhKHL54HhPDYAtOmi8XrrIMBMR8B4WupHV/7jLHppE4Lv/zAwkZhIAww==
X-Received: by 2002:a63:120f:: with SMTP id h15mr33608341pgl.235.1582194554218;
        Thu, 20 Feb 2020 02:29:14 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:7c94:: with SMTP id x142ls8574205pfc.3.gmail; Thu, 20
 Feb 2020 02:29:13 -0800 (PST)
X-Received: by 2002:a63:b51e:: with SMTP id y30mr33074797pge.141.1582194553753;
        Thu, 20 Feb 2020 02:29:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582194553; cv=none;
        d=google.com; s=arc-20160816;
        b=Eb8S0rHBDohBEo8O7tn1G+jWjktWZt5jKLflGpVUE9Yu59b6uIrFbMiwQDLQ5dO8Nn
         NY9BxV2KyPwMvRm1kpaoPIGFjvS6EQXPsx3sxvUG3v92yBnz4d6JrS1vYS6E6R4w85IO
         kNdJaRTw/dsr2qkANgaCOjIkqvt5J9PSNjte8BDAut8/s5XMulDgFtn7A0RUk0ceiUOD
         CUpn6mVHJDT6/k8R5BdO4ZqvSYA09hRf6q1sAewdE+vHoqMKhVH3MEq9l2ohuQ6RYjvp
         wfec+szKy7vgE8hmaTzpdXU75mDbYn57eSpPVkpoc0JFY0gS/ONnTUknC7ZfGwjXjl/g
         tYJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:message-id:references:in-reply-to:subject:cc:to:from
         :date:content-transfer-encoding:mime-version:dkim-signature;
        bh=Ibct4DzwE6Qnez9TiVyB25VYCk3YkGKWQg/XlCZ08As=;
        b=lT0FPSQDtnfpgNSatpfKnevuWh/vR/uKmGwTNXD42xe+TjWppzl63YmiMm/4GnHsmc
         k/5X5xawJFbAatYL/Q2IAFBtx+26CrV4MvXZp8Oqjp6mdMpKPexXEFO22ExyR+NOZuCw
         Fd/AOMplkEh5azh2CxUGFtkbKG+vjztDMZvxXMUex9r/OdsWFugEgrqqFEBl6PngumoJ
         vzvVn2KQY0MPzknadcWpQSnNky1lvFZo51m9CzDUHjKcyByKyajJb9FlWoTZ/HeyU3c0
         e3RT6wnoEwf2hNckdGNNzbzcg7Ec60p4iSi1uckdtBxvvx74Jhf7LyUI5vud0aEp0Yvd
         Mj0A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=JeR9EVZC;
       spf=pass (google.com: domain of maz@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=maz@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by gmr-mx.google.com with ESMTPS id x78si150987pgx.5.2020.02.20.02.29.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Feb 2020 02:29:13 -0800 (PST)
Received-SPF: pass (google.com: domain of maz@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5BF7C20801;
	Thu, 20 Feb 2020 10:29:13 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <maz@kernel.org>)
	id 1j4j4x-006hip-NY; Thu, 20 Feb 2020 10:29:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Date: Thu, 20 Feb 2020 10:29:11 +0000
From: Marc Zyngier <maz@kernel.org>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, kvmarm@lists.cs.columbia.edu, kvm
 list <kvm@vger.kernel.org>, James Morse <james.morse@arm.com>, Julien
 Thierry <julien.thierry.kdev@gmail.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, Christoffer
 Dall <Christoffer.Dall@arm.com>, Will Deacon <will@kernel.org>, Quentin
 Perret <qperret@google.com>, Russell King <linux@arm.linux.org.uk>, Vladimir
 Murzin <vladimir.murzin@arm.com>, Anders Berg <anders.berg@lsi.com>,
 jailhouse-dev@googlegroups.com, jean-philippe.brucker@arm.com
Subject: Re: [RFC PATCH 0/5] Removing support for 32bit KVM/arm host
In-Reply-To: <ea7bc1d0-0a11-8ed6-da70-d603d8107bf6@siemens.com>
References: <20200210141324.21090-1-maz@kernel.org>
 <CAK8P3a3V=ur4AgLfat2cSyw8GrkCS2t06eqkzC-gXcc0xBpEPw@mail.gmail.com>
 <ea7bc1d0-0a11-8ed6-da70-d603d8107bf6@siemens.com>
Message-ID: <535d8a4498d81b4901dfab232638d865@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.10
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: jan.kiszka@siemens.com, arnd@arndb.de, linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org, james.morse@arm.com, julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com, pbonzini@redhat.com, Christoffer.Dall@arm.com, will@kernel.org, qperret@google.com, linux@arm.linux.org.uk, vladimir.murzin@arm.com, anders.berg@lsi.com, jailhouse-dev@googlegroups.com, jean-philippe.brucker@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Original-Sender: maz@kernel.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@kernel.org header.s=default header.b=JeR9EVZC;       spf=pass
 (google.com: domain of maz@kernel.org designates 198.145.29.99 as permitted
 sender) smtp.mailfrom=maz@kernel.org;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=kernel.org
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

On 2020-02-19 15:46, Jan Kiszka wrote:
> On 19.02.20 16:09, Arnd Bergmann wrote:
>> On Mon, Feb 10, 2020 at 3:13 PM Marc Zyngier <maz@kernel.org> wrote:
>>> 
>>> KVM/arm was merged just over 7 years ago, and has lived a very quiet
>>> life so far. It mostly works if you're prepared to deal with its
>>> limitations, it has been a good prototype for the arm64 version,
>>> but it suffers a few problems:
>>> 
>>> - It is incomplete (no debug support, no PMU)
>>> - It hasn't followed any of the architectural evolutions
>>> - It has zero users (I don't count myself here)
>>> - It is more and more getting in the way of new arm64 developments
>>> 
>>> So here it is: unless someone screams and shows that they rely on
>>> KVM/arm to be maintained upsteam, I'll remove 32bit host support
>>> form the tree. One of the reasons that makes me confident nobody is
>>> using it is that I never receive *any* bug report. Yes, it is 
>>> perfect.
>>> But if you depend on KVM/arm being available in mainline, please 
>>> shout.
>>> 
>>> To reiterate: 32bit guest support for arm64 stays, of course. Only
>>> 32bit host goes. Once this is merged, I plan to move virt/kvm/arm to
>>> arm64, and cleanup all the now unnecessary abstractions.
>>> 
>>> The patches have been generated with the -D option to avoid spamming
>>> everyone with huge diffs, and there is a kvm-arm/goodbye branch in
>>> my kernel.org repository.
>> 
>> Just one more thought before it's gone: is there any shared code
>> (header files?) that is used by the jailhouse hypervisor?
>> 
>> If there is, are there any plans to merge that into the mainline 
>> kernel
>> for arm32 in the near future?
>> 
>> I'm guessing the answer to at least one of those questions is 'no', so
>> we don't need to worry about it, but it seems better to ask.
> 
> Good that you mention it: There is one thing we share on ARM (and
> ARM64), and that is the hypervisor enabling stub, to install our own
> vectors. If that was to be removed as well, we would have to patch it
> back downstream. So far, we only carry few EXPORT_SYMBOL patches for
> essential enabling.

I actually have a few extra patches on top of the series, one of them
actually removing the ability to register new vectors (mostly because
I don't like leaving unused stuff behind), see [1]. I'll post an update
so that we can discuss whether we want this particular to stay or not.

> That said, I was also starting to think about how long we will
> continue to support Jailhouse on 32-bit ARM. We currently have no
> supported SoC there that comes with an SMMU, and I doubt to see one
> still showing up. So, Jailhouse on ARM is really just a testing/demo
> case, maybe useful (but I didn't get concrete feedback) for cleaner
> collaborative AMP for real-time purposes, without security concerns. I
> assume 32-bit ARM will never be part of what would be proposed of
> Jailhouse for upstream.

I guess we all come to the same conclusion...

         M.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?h=kvm-arm/goodbye&id=0943dd119105b65197adffda52c402cce28da56d
-- 
Jazz is not dead. It just smells funny...

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/535d8a4498d81b4901dfab232638d865%40kernel.org.
