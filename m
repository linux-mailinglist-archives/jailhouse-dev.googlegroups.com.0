Return-Path: <jailhouse-dev+bncBAABB75LST2AKGQEJ6W7IKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id D52AC19B864
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 Apr 2020 00:30:23 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id e10sf545447wrm.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 01 Apr 2020 15:30:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585780223; cv=pass;
        d=google.com; s=arc-20160816;
        b=WcD5H6uz1BfaqzAnDCSzAsttOU13ivvrn4GrANBxuodhKHwIkNCbW/8wCaHw2vCGTr
         7XJqeM53bGKrrYq5h3NEtG7R7U+65GmbP3liAViIt8Po6YNMFY5GQ7jKKw7+PYhPcEo/
         SwNbcF8pJdRQNQ+mlUyEl09WR+wcoPlZBY6g0Cm9DnZjlV8CDAeobDsO/DVUDIIf/Idr
         LQFGuh5lHhi7pUWPxO2sDsk3bOK+479cWp/bnHLm0do5fl7L99ciKcXBwOMgsLaKDHSm
         ToBtkQPDEOKQBRFCqm0bCRnxeiNpg8jGngv4pm5zvCYQCPa3SCj7yl4sNT2uoJzLA3Nl
         4XrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:ironport-sdr:sender
         :dkim-signature;
        bh=KVpEA77bpa0TpFNY3VPIQYQ9ybAhP87PRv/lX58x8IU=;
        b=KylTQkAC0+OhCrTHDfF4FncDCZcUlcoroZLMV/Ov101sbFjguqP4W64wZ1ep+xEf7M
         THejwTtvGQnYseBcsUuhYjv84tn5mvA/LmN+OoWMFPuK4G67xK34tWcHasUKEIJ1gSIe
         qa8A8QfkkBfhaPJZgd4NmRcXBgBecHBdCBRK+FraQ9QvUxHKng5BbU6KBG0mA5GDcHE1
         /fNWD8DxXWiC+IRdwVCi1WDNfe/bWwxHxMc8BxAYhZD40BJKMJsoLO7SNk+upZwTPnzj
         3ZFBDgZ7mNQsu/Hhlcvt4c4idM4dc9EjLkkMsvHMzpi7dbj0z9Xl5NZhthZ7+GcyJLT6
         yudw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@citrix.com header.s=securemail header.b=MrUI5UNF;
       spf=pass (google.com: domain of andrew.cooper3@citrix.com designates 216.71.155.144 as permitted sender) smtp.mailfrom=Andrew.Cooper3@citrix.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=citrix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:ironport-sdr:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=KVpEA77bpa0TpFNY3VPIQYQ9ybAhP87PRv/lX58x8IU=;
        b=gGSHduBv0OYqNDuzOqoEeZMvUDGS2wuGcS6mOyfdI0hIOhmfZI0h5xsYiffxO/lZQu
         OrdPgyPMYoXwC6YnN7YPH/jvgpjdroaXHkBfUi4zI2qqpfS2ahCH584KVy0QQOszu8Mm
         S7CGfeuNabWnAbICQvehRvQ9V3S+JruMeM/7mENZaSmMG6dlAKGklvB+0+Z4sxrgpJIS
         IpSW4nNNm29ySkIqyV09cbLssCjZMW+VpmcthS49ZO/QrBOGr113d24VoVIKBvIdsUJG
         +yonITJ2GklP0DBLpJByRCIZ0PZaNgOsLqlPaQ6R0wLD6LZ5g52/mZhX7QL1g+eWeNPB
         U3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:ironport-sdr:subject:to:cc:references
         :from:message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KVpEA77bpa0TpFNY3VPIQYQ9ybAhP87PRv/lX58x8IU=;
        b=ZAeIZnHgpyeUQWtQtaX+7vLQdZp0EYb3h4XyNJg44Wx1DaCCHS9t2xmD2FjeWNwZcT
         em5DMZFIey/FFWeAiV4/fNuBn2suiP8MZCLvwD/3B6wFqABk73x0H8D7WvSGdpWT8iSc
         2xltNcHSEn/d+W8P3oWfxzjS4ubu3WNiQey4jh+qyIiUt+qjUxsNn9J1K767B7hlfl5y
         4fTEuzkFBlxqRoA9TxBbWVDKiHr5EyeeEFaqr/oRMb3jK2iVs6TwKV5DXU7C/7zC5/TK
         iBkpHAVXF5tjTTMcAHMZEZ75ld+zAjl7m/NLg9WGid8xpXyD2vB29+EEscc9ics7M+GL
         1ckQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PubCacFbCyg9fMj0MyNInaQ3HnoozkKT7jArRebYpC06wkuvg91W
	/jeCmV9rwi2XQglrKsb0mIA=
X-Google-Smtp-Source: APiQypJAXb62ZIpM+E9RI22J9Vx53qvwZTeJ6qfTdmP4XnlSCqBBpZT59El+A7RFJzKvLnCbQs9p8g==
X-Received: by 2002:a5d:4111:: with SMTP id l17mr170950wrp.271.1585780223553;
        Wed, 01 Apr 2020 15:30:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:8104:: with SMTP id c4ls18037wmd.0.experimental-gmail;
 Wed, 01 Apr 2020 15:30:22 -0700 (PDT)
X-Received: by 2002:a1c:2d41:: with SMTP id t62mr211846wmt.128.1585780222711;
        Wed, 01 Apr 2020 15:30:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585780222; cv=none;
        d=google.com; s=arc-20160816;
        b=JngdPZbYnlQbuRxmiKK/d7AN1TDA87kSEHvbWXtPc7Gzyko4blyTfi3NqsMtahmRZu
         YNHgG9kYegFTW3uHlVM54zxMPO3iOspdi59wR3Ez5WXq1+k1t5q8EgjKxFJREcQcPBwv
         xi7Dzl81UYICohe0gVVSIiPuD+s1Pjd1r5wvsmeTR9vypSC5GDXw+k0kJy4zRe3mdETM
         28axFb6Im8/Wf+wCy9ucXpiWpyxkPc/IKq2C//36npVqoZQWs8behAsMhx/76AxwOeOK
         MKAeKFXdOs3e5CWdUitr4VKms2SO28Pctnqlaq24/OCMDkqitlMYesdgdi/ljJfymvcy
         9oWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :ironport-sdr:dkim-signature;
        bh=FeTi8r30vfolfu5d1f/8SeVwgzbGoq0+Vccyr83o7+g=;
        b=gBPYNheVrZIO/HXbcEIFlfCtdjTzt05oQFCUizLHQdeUjoQHWcvtA9EMZO4B6amxIm
         J7sy59s2PK6UH4tTCYNF5v54+8xYnIDBLaC3KbZ5X3rELpsmV/Yy7ZvR/HjM7lHaieD0
         Jp/wB0aG5FJkYrkBxKX5o7kizKAb2W7WnQMOe6rm3s/AdqQQdpGgx8E2DRsJms+9jAqy
         MS+6vuEUgujVW7XoJCDqxrTTDyTZK1QBKpt/GbSqm+hXNHf5ovLr7YGa9SSbDFKMaO2B
         STlI0Ed/zKWeDbPDWwmfrVyBjUCcKkdVWega4/OmxvXpdx0kfGQMdlJro9AT1qN+UoCz
         piQA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@citrix.com header.s=securemail header.b=MrUI5UNF;
       spf=pass (google.com: domain of andrew.cooper3@citrix.com designates 216.71.155.144 as permitted sender) smtp.mailfrom=Andrew.Cooper3@citrix.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=citrix.com
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com. [216.71.155.144])
        by gmr-mx.google.com with ESMTPS id s4si182764wrm.4.2020.04.01.15.30.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Apr 2020 15:30:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrew.cooper3@citrix.com designates 216.71.155.144 as permitted sender) client-ip=216.71.155.144;
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
  authenticity information available from domain of
  andrew.cooper3@citrix.com) identity=pra;
  client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
  envelope-from="Andrew.Cooper3@citrix.com";
  x-sender="andrew.cooper3@citrix.com";
  x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
  Andrew.Cooper3@citrix.com designates 162.221.158.21 as
  permitted sender) identity=mailfrom;
  client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
  envelope-from="Andrew.Cooper3@citrix.com";
  x-sender="Andrew.Cooper3@citrix.com";
  x-conformance=sidf_compatible; x-record-type="v=spf1";
  x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
  ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
  ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
  ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
  ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@mail.citrix.com) identity=helo;
  client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
  envelope-from="Andrew.Cooper3@citrix.com";
  x-sender="postmaster@mail.citrix.com";
  x-conformance=sidf_compatible
IronPort-SDR: SlBOpDVSyfmlaZYloDXfRtyji0AMLQW2ggHFzCnIad2qFJeMl2e6w5vnfnDP1epnj1a35l01GE
 gJ7p7IE9mrSXq7gTPDtz4HLJaxJsYAKLarA2Put92a64Iob8XDKqpo0/8TG+R+KdS4IwfCptHM
 3sa/qfuCnMhgrFOog8P6Z8VQCurgolww554Z39ZPQ4r42ACZAW9vDKaDbgS46pyXIssmpFvjXA
 JMqF5IT32+YSitByXxOUC0NDPlCySni8S5lfM4ufZGVyGZGgHJW77gz+rXUO1e3O0guDB0wtz/
 bH0=
X-SBRS: 2.7
X-MesageID: 15694073
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,333,1580792400"; 
   d="scan'208";a="15694073"
Subject: Re: [PATCH] x86/smpboot: Remove 486-isms from the modern AP boot path
To: "Maciej W. Rozycki" <macro@linux-mips.org>, Thomas Gleixner
	<tglx@linutronix.de>
CC: <hpa@zytor.com>, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, "Jan
 Kiszka" <jan.kiszka@siemens.com>, James Morris <jmorris@namei.org>, "David
 Howells" <dhowells@redhat.com>, Matthew Garrett <mjg59@google.com>, Josh
 Boyer <jwboyer@redhat.com>, Zhenzhong Duan <zhenzhong.duan@oracle.com>, Steve
 Wahl <steve.wahl@hpe.com>, Mike Travis <mike.travis@hpe.com>, Dimitri
 Sivanich <dimitri.sivanich@hpe.com>, Arnd Bergmann <arnd@arndb.de>, "Peter
 Zijlstra (Intel)" <peterz@infradead.org>, Giovanni Gherdovich
	<ggherdovich@suse.cz>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Len
 Brown <len.brown@intel.com>, Kees Cook <keescook@chromium.org>, Martin Molnar
	<martin.molnar.programming@gmail.com>, Pingfan Liu <kernelfans@gmail.com>,
	<jailhouse-dev@googlegroups.com>
References: <20200325101431.12341-1-andrew.cooper3@citrix.com>
 <601E644A-B046-4030-B3BD-280ABF15BF53@zytor.com>
 <87r1xgxzy6.fsf@nanos.tec.linutronix.de>
 <alpine.LFD.2.21.2004010001460.3939520@eddie.linux-mips.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <beefca46-ac7c-374b-e80a-4e7c3af2eb2b@citrix.com>
Date: Wed, 1 Apr 2020 23:30:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2004010001460.3939520@eddie.linux-mips.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-Original-Sender: andrew.cooper3@citrix.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@citrix.com header.s=securemail header.b=MrUI5UNF;       spf=pass
 (google.com: domain of andrew.cooper3@citrix.com designates 216.71.155.144 as
 permitted sender) smtp.mailfrom=Andrew.Cooper3@citrix.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=citrix.com
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

On 01/04/2020 00:35, Maciej W. Rozycki wrote:
> On Wed, 25 Mar 2020, Thomas Gleixner wrote:
>
>>>> @@ -1118,7 +1121,7 @@ static int do_boot_cpu(int apicid, int cpu,
>>>> struct task_struct *idle,
>>>> 		}
>>>> 	}
>>>>
>>>> -	if (x86_platform.legacy.warm_reset) {
>>>> +	if (!APIC_INTEGRATED(boot_cpu_apic_version)) {
>>>> 		/*
>>>> 		 * Cleanup possible dangling ends...
>>>> 		 */
>>> We don't support SMP on 486 and haven't for a very long time. Is there
>>> any reason to retain that code at all?
>> Not that I'm aware off.
>  For the record: this code is for Pentium really, covering original P5=20
> systems, which lacked integrated APIC, as well as P54C systems that went=
=20
> beyond dual (e.g. ALR made quad-SMP P54C systems).  They all used externa=
l=20
> i82489DX APICs for SMP support.  Few were ever manufactured and getting=
=20
> across one let alone running Linux might be tough these days.  I never=20
> managed to get one for myself, which would have been helpful for=20
> maintaining this code.
>
>  Even though we supported them by spec I believe we never actually ran MP=
=20
> on any 486 SMP system (Alan Cox might be able to straighten me out on=20
> this); none that I know of implemented the MPS even though actual hardwar=
e=20
> might have used the APIC architecture.  Compaq had its competing solution=
=20
> for 486 and newer SMP, actually deployed, the name of which I long forgot=
. =20
> We never supported it due to the lack of documentation combined with the=
=20
> lack of enough incentive for someone to reverse-engineer it.

:)

I chose "486-ism" based on what the MP spec said about external vs
integrated Local APICs.=C2=A0 I can't claim to have any experience of those=
 days.

I guess given v2 of the patch, I guess this should become "Remove
external-LAPIC support from the AP boot path" ?

~Andrew

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/beefca46-ac7c-374b-e80a-4e7c3af2eb2b%40citrix.com.
