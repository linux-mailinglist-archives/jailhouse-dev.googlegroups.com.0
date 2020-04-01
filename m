Return-Path: <jailhouse-dev+bncBAABBAGTSL2AKGQEWRN2VHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vs1-xe38.google.com (mail-vs1-xe38.google.com [IPv6:2607:f8b0:4864:20::e38])
	by mail.lfdr.de (Postfix) with ESMTPS id 4767119AE43
	for <lists+jailhouse-dev@lfdr.de>; Wed,  1 Apr 2020 16:47:30 +0200 (CEST)
Received: by mail-vs1-xe38.google.com with SMTP id x13sf819359vsp.19
        for <lists+jailhouse-dev@lfdr.de>; Wed, 01 Apr 2020 07:47:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585752449; cv=pass;
        d=google.com; s=arc-20160816;
        b=SbH5/Dz1pFvTxbDQRd/ZWppY3pUA7ZwyRGGRhDV9hpzv1C3YTPCSVP+wUMSxxv7fli
         kmjnr6sGtonNU4f8fC15DIHiQAgDpRSZIovb9HSmgcJCYDmeiNOse/N7ZYBxrTUjHA3q
         QET+NuDowVG4RlEjHLQyPU1IoN2YlWv+op+pMhm/cqfRYqOpiMyD+zMOQh4icZ2Aa9kG
         nu9bFw/qCK8h22xNMzsKT9n06WcVBHcTaOzls6/1saAGAdZoRqtVMa5J/TP2h40hnEnp
         VFbxuAKtc17nKpwpnOTaJeW/Lin1bWf+mzIZvc02RdKHyz5b0k8z+n9q4Wwh7Jod4+9H
         afVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:ironport-sdr:sender:dkim-signature;
        bh=Nozyg1D0sapA/iG7zkSNflxzhkBgo10w8c0ml/6PSi4=;
        b=dOpx4DAHNwGp/Tz8DJ3jNx31r9kYwcfZgCTziVaUUIThiYHh9aWR31u4fryhi/a040
         zHbAxINSK4ADWICNK2gqVPdaelrDhvlDgAhT3ISAmld9/sTfQFglouotrttxxs8PQK0O
         X6koXGqSSo/ZSMUHY8M/WgXISg0ncq7UsBGm3OE7ahPecTZZaisMRKiXvEPzcFNtuSjN
         K5LT8ZvuU3laTJ0pF6YazRhhqH19TrnoVQ+mUf/aIccvJZlglizWB/hTb+UpqfzV509c
         VDq81rJk1IY+A6nGYYBRbwD91NwK+2kFxr4HtJ+CSS/ddUHjQbog3SL56lNdEWiv5ft9
         YPVg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@citrix.com header.s=securemail header.b=RW9ffBDX;
       spf=pass (google.com: domain of andrew.cooper3@citrix.com designates 216.71.145.142 as permitted sender) smtp.mailfrom=Andrew.Cooper3@citrix.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=citrix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:ironport-sdr:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Nozyg1D0sapA/iG7zkSNflxzhkBgo10w8c0ml/6PSi4=;
        b=h9v84bjJcVHgP/mYxLIf1D9Ue2PCkiwLvn5vPKsHzmcp6ZzSectaMQl3+UUZCfeMdx
         C7YTMuUxpocw1JiEUW8HvSPWtomQ2/HHMJx27wDmAHYr+jtUoIBI15Gm5aY/zdz5og/5
         i9kdGHYLnu1/I4M/qfilbhl42qyaVZgjbPTNJWxS/Lwsm1cMcIazeC5uM8XznrqG+oUC
         CFH/WAh7LpDSqqgA/+qul57G3tzhxt/Hbl2DiIr0lPXHms3dIFfzF5xqjtkf63/52fHg
         tjQoLMuy38MPaY5R5A+MvqdoF8qgJDDjq7N2S4SvS63idJFdo9LL2cAZ0ZYuip6rRQGT
         uqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:ironport-sdr:subject:to:cc:references
         :from:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Nozyg1D0sapA/iG7zkSNflxzhkBgo10w8c0ml/6PSi4=;
        b=rRSdYXGq80RcEdcHteEO3y5K2oiiFuZO5VsFJr/1bPmkLW2DOlxAymgFXCQPJl+bIJ
         YSO/j3EHZ//vVrGlM9WlC1aOAeF8gtjzorVgjIG0Ne20Gt0wf/OO5iRoyxJN+my0fwQE
         l8RQPBdQgrqepNEZFUcVEwPwfGUDuHb0mFbjB/h5bD2MA9+QeLYicGq44hG3t/MgVpuN
         xZjZr8U/2WXVuKeY+0WXBaGYWT5MltqvsJmY5kfN0dLpJ3aCc+fKtrtkqFYo0F4nYAlF
         TxPY02rvTG+VXG4TPl5nh51HKmvTYvuPe/VPYcn20CVjQ21+LOjhjjPMW3+a8tQ9cFxU
         AZyA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0Pua92gsP96NKI20Ok74jjS+obR1R8l+0fpX0SrOTniNYfLCH8yjP
	3babPDvgWxAYwxePzX3+zOc=
X-Google-Smtp-Source: APiQypIyPAeL+BzYb1mi11sMh5o5zAVVtGysl///zi/dCqsu5o74nyn0bw8QX9a5+FnDscDpd2PWcw==
X-Received: by 2002:a1f:c188:: with SMTP id r130mr15688946vkf.94.1585752448937;
        Wed, 01 Apr 2020 07:47:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:b8:: with SMTP id 53ls1830502uaj.10.gmail; Wed, 01 Apr
 2020 07:47:28 -0700 (PDT)
X-Received: by 2002:ab0:648b:: with SMTP id p11mr16618609uam.35.1585752448226;
        Wed, 01 Apr 2020 07:47:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585752448; cv=none;
        d=google.com; s=arc-20160816;
        b=bbf3juwXztXAEzwRrEwK0W9uWSgqaMWEfEjLu0N/p71Ubg7CiHTj4I9XpQlhyWTpMW
         GVKzMWtQuZ8NxnCcOBESdzOvJAF4AIzPpgVNe2H4BXBZ9EYZ9OsCDJOF7RY51VqmxvOD
         y69nann9bVv8+5duPaWQbtjdNdpqwoKCKmIuAMGccjIi2tYd7kPSds73gMwG8b8VYdha
         wwWwtYFKWOVMFgcm+/vqsUv1Y7ny5vwyh0uWpZx3byyLcs8myrQiKdz+gFb1i1TuHdfE
         j3sSonfC5uqTmsp55NtjHaGbSsL9/+l60eN7OcoVuWob5lAR3vVKYd7YM/t2C9UVXxr6
         MU0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :ironport-sdr:dkim-signature;
        bh=YAv4oCRl85mwww0BiGKnhX42SDUvANtA8zznA2dTMOU=;
        b=b+qqxR9PPRviPISi2K0ZnnNc8Dxw0ODEMB9aJQNb8MDSQpCwSIc2jWfd3R2oy7K68u
         7lUH/PV1ibMeXPXIoGA9rxVoFZiMCQoWyhltr8UrgLLkkkrv5wGmV2CKTdFgUeKC0wV/
         XEbjDCkd7kOkkMudYybuBtLHA1qWfKoIaQ7h15ADwK0XLeIdOnn03h8afkFMz8eQzlJo
         VWrisTWajLPaih62gAEu7ycIp7ud3tgYYVWR2kHWo57mRL2ctAR5qbDy8BuzNpFMvMk2
         d/kXIxRVmn1FR/q6seHI08Bu7zNxLkwxkJPz4AcB/zoW/T7Rxx301aZB4akS8EdNGEjF
         LCNQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@citrix.com header.s=securemail header.b=RW9ffBDX;
       spf=pass (google.com: domain of andrew.cooper3@citrix.com designates 216.71.145.142 as permitted sender) smtp.mailfrom=Andrew.Cooper3@citrix.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=citrix.com
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com. [216.71.145.142])
        by gmr-mx.google.com with ESMTPS id u6si111861uae.0.2020.04.01.07.47.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Apr 2020 07:47:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrew.cooper3@citrix.com designates 216.71.145.142 as permitted sender) client-ip=216.71.145.142;
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
  authenticity information available from domain of
  andrew.cooper3@citrix.com) identity=pra;
  client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
  envelope-from="Andrew.Cooper3@citrix.com";
  x-sender="andrew.cooper3@citrix.com";
  x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
  Andrew.Cooper3@citrix.com designates 162.221.158.21 as
  permitted sender) identity=mailfrom;
  client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
  envelope-from="Andrew.Cooper3@citrix.com";
  x-sender="Andrew.Cooper3@citrix.com";
  x-conformance=sidf_compatible; x-record-type="v=spf1";
  x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
  ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
  ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
  ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
  ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@mail.citrix.com) identity=helo;
  client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
  envelope-from="Andrew.Cooper3@citrix.com";
  x-sender="postmaster@mail.citrix.com";
  x-conformance=sidf_compatible
IronPort-SDR: qGuEcadWZ4+4r3BUt94OBTAasnNsLwdE4ZHx/AdIbJyLqMuLH+k06nUg5eDKzlLozHdJs8V/B6
 NhoJsLL3aE0qTxCtaqPg9EW0yOYinYK15G/AQZ/pLVsuUPjOxyxfFGCT0ObbGMTyMokioZuIG6
 sCpiui3I/uZti4luZwmvlEJ+oIRXKbca5CbzK4W+i0FYQ5Ym4OQWFCq3ReLkO11Lt+Rd8DJf6w
 jrg/nn6Q2k0eRfw3vcLE9ciMnafSeR4pohtlUj3XnkL0cyDhaVay6VMGzQwjGg7RwBz7KgkWiQ
 4AU=
X-SBRS: 2.7
X-MesageID: 15226252
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,332,1580792400"; 
   d="scan'208";a="15226252"
Subject: Re: [PATCH v2] x86/smpboot: Remove 486-isms from the modern AP boot
 path
To: Brian Gerst <brgerst@gmail.com>
CC: LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter
 Anvin" <hpa@zytor.com>, the arch/x86 maintainers <x86@kernel.org>, Jan Kiszka
	<jan.kiszka@siemens.com>, James Morris <jmorris@namei.org>, David Howells
	<dhowells@redhat.com>, Matthew Garrett <mjg59@google.com>, Josh Boyer
	<jwboyer@redhat.com>, Steve Wahl <steve.wahl@hpe.com>, Mike Travis
	<mike.travis@hpe.com>, Dimitri Sivanich <dimitri.sivanich@hpe.com>, "Arnd
 Bergmann" <arnd@arndb.de>, "Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Giovanni Gherdovich <ggherdovich@suse.cz>, "Rafael J. Wysocki"
	<rafael.j.wysocki@intel.com>, Len Brown <len.brown@intel.com>, Kees Cook
	<keescook@chromium.org>, Martin Molnar <martin.molnar.programming@gmail.com>,
	Pingfan Liu <kernelfans@gmail.com>, <jailhouse-dev@googlegroups.com>
References: <20200325101431.12341-1-andrew.cooper3@citrix.com>
 <20200331175810.30204-1-andrew.cooper3@citrix.com>
 <CAMzpN2i6Nf0VDZ82mXyFixN879FC4eZfqe-LzWGkvygcz1gH_Q@mail.gmail.com>
 <c46bcb6d-4256-2d65-9cd9-33e010846de4@citrix.com>
 <CAMzpN2gdkmYYbQatFk66QMpiuZSfnUQUVtJ30VYF7nsX_+XVgA@mail.gmail.com>
 <bdf7995d-2d50-9bb9-8066-6c4ccfaa5b52@citrix.com>
 <CAMzpN2g0LS5anGc7CXco4pgBHhGzc8hw+shMOg8WEWGsx+BHpg@mail.gmail.com>
 <b1aa5cdf-b446-17b0-6d31-fa8947f67592@citrix.com>
 <CAMzpN2h5u3gbRFfew-BSUH_=E509QirQaopiTBrVQc6Oq2AcvA@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b15b8cf2-a579-10ec-06b1-fb674295c993@citrix.com>
Date: Wed, 1 Apr 2020 15:47:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAMzpN2h5u3gbRFfew-BSUH_=E509QirQaopiTBrVQc6Oq2AcvA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-Original-Sender: andrew.cooper3@citrix.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@citrix.com header.s=securemail header.b=RW9ffBDX;       spf=pass
 (google.com: domain of andrew.cooper3@citrix.com designates 216.71.145.142 as
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

On 01/04/2020 15:38, Brian Gerst wrote:
>>>>>>> You removed x86_platform.legacy.warm_reset in the original patch, but
>>>>>>> that is missing in V2.
>>>>>> Second hunk?  Or are you referring to something different?
>>>>> Removing the warm_reset field from struct x86_legacy_features.
>>>> Ok, but that is still present as the 2nd hunk of the patch.
>>> My apologies, Gmail was hiding that section of the patch because it
>>> was a reply to the original patch.  For future reference, add the
>>> version number to the title when resubmitting a patch (ie. [PATCH
>>> v2]).
>> Erm... is Gmail hiding that too?
>>
>> Lore thinks it is there:
>> https://lore.kernel.org/lkml/CAMzpN2g0LS5anGc7CXco4pgBHhGzc8hw+shMOg8WEWGsx+BHpg@mail.gmail.com/
> Ugh, yes.  I thought it was the title that Gmail threaded on, but it
> must be the In-Reply-To: header.  Sorry for the confusion.
>
> That said, I think the v1 patch is probably the better way to go (but
> adjusting the comments to include early Pentium-era systems without
> integrated APICs).

Yes - I'm afraid I'm showing my age here, being the same vintage as the 486.

I'll happily rephrase as suggested.

> Then the decision to drop support for external
> APICs could be a separate patch.

I have no vested interest.

This was a fix from Xen that I tried to upstream (if you can really call
it that, seeing as the common point in history was the Linux 2.4 days),
given the rather rude UEFI behaviour.

Ultimately, this will be down to the maintainers for which approach to take.

~Andrew

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b15b8cf2-a579-10ec-06b1-fb674295c993%40citrix.com.
