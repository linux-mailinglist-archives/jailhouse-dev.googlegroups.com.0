Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJNC5CBAMGQE3O6IP3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8FD34644D
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 17:02:46 +0100 (CET)
Received: by mail-lj1-x23e.google.com with SMTP id d15sf1628327ljl.17
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 09:02:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616515366; cv=pass;
        d=google.com; s=arc-20160816;
        b=F3m0HW3U4N7FlVyISVGF2j1Mo6O6rp+PzyTj9rbjn/Aj3w3cWaOnHKIRwV/P9k9DdF
         xqKZj2RiRKpCEzsmnAmhApPYP294laAOv08aSbscIseAXex9AaCDUVZQNBqiRsEd2BK1
         fV552a2RnGDLDR5px9NZLSvupifgyX9ACFn0HbDDo+tMIA3QiHa6ayx56XfN4eqFlc4u
         /UPUIfMLKunheQvpyPeIpvY9+sz3vfiYE7lN/N0j/aEUq6QjMSZshbIm7UEeZ40gYW3k
         dGbu+4rQOLsU6zfUKToo+40opMRL4Z4q10kMocI/TZuR/C+g3OnS2rjuripoTQ16E8ql
         sFjg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=rbzdL8ptCOcBBIM3AgSSI880JBarUI9yaxsn+zEO6I8=;
        b=zd9GugUGy2hpuhRAo8eXzCZUhQwz7epvC02NcoovB6C+xD/NrVn8AXIf9gVVbXm3If
         NCxCX1EzjcewhfEgkaEyFDDsXzbsy9RhoFuYEAMLYeqRv3BScfcuMSC+ydsJJGkd36Tx
         msPWEzNmM82ebqUDYjcmyvbaGxUlnv+WpuWuYsPaNkGs6REDi/bkCU4/UTelIHYUSlae
         OJ3Gzuw40LX11aIlmJcLrnXUNDypukR/DQFU+nWlsVNEusnoKOM6Q6Z/1bEAw6L7ywWa
         PFKH+sw/HAJ2zJyOplbQHS/5XapDjWD/cb8ywU4YspptasGLpslkbez7bbnlZdE1qvzX
         Qrhw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rbzdL8ptCOcBBIM3AgSSI880JBarUI9yaxsn+zEO6I8=;
        b=jjv2uhOPrCpOrlCUuEz2PpZG+2T+BpsofBZ5EqE+O8k9a1nH9SSN3UnXk7PuJDLIcj
         srqyg01QAnImg9BJXOIewQkn6aB5GTNn2gMfV9lgtSesZqDfPQyVGqyVMBn5SUAoWEXd
         kh19KAc1a9HA8ghvq7XDfHlFnHHZdw5BnDA1dRnZGuUGVJWKkgC3AGKXcqI6LdGh9R6F
         ZOhhTUMKWPMTI+T/HfwalS0ZTNYG0TiwaNDQh2ojdurFCtnaRiaLAcL7W4nplsZMUxNz
         xsrUshk87ujxbsG5lcjmwc9+/cYc6Eq2UALToswB7y8k3BEaTWJwyIHgCPiZGM7v3ZGp
         lmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=rbzdL8ptCOcBBIM3AgSSI880JBarUI9yaxsn+zEO6I8=;
        b=IgnwlRos0vjnDXA0K7L+/OeRjLzcbbfwOUC9bgVgG9NMeOcwUoemizJ4d31euNligZ
         IR66QpWfe0qNXuiO/uhsZ+0zPuSkEdKnb+Paz/wgFCK3ccyMJ7fGuVdNi38dVrF5mmMx
         Db7A6SVtaHsHc/sjOiLX3T9dlR0Livxa60H3nOVAuPM0oIIjgpv7cQao4d/3dki0wXDK
         BsTXU4d1Cvl3knShAZ8pJ4YOaCbV9HLIs99bk67PGkqvr+ABeMJ5cX+qBuOk9okoFhxR
         TskGlamwiMePy6QJJEhCt6NhWqpdHYJraDJ67cH1dvi9alvQ83nQikKhcZYSBNo7CKuO
         fx4w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533TJlPiKmox4KwwOnrN+4D6hBGOgKSMEOU6bE4A1U0uxQYEmH4Q
	5r81ya37q425crNSkCxbFzQ=
X-Google-Smtp-Source: ABdhPJw2xrcqqgG/7+zolwBM0HSzycCgUeaoF7xBKopuhEVISpDy4Yq2LYisSCAaRPenCuffMfauyA==
X-Received: by 2002:ac2:4245:: with SMTP id m5mr3078206lfl.168.1616515366257;
        Tue, 23 Mar 2021 09:02:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:e86:: with SMTP id 128ls5542316lfo.0.gmail; Tue, 23 Mar
 2021 09:02:45 -0700 (PDT)
X-Received: by 2002:ac2:4d95:: with SMTP id g21mr3134829lfe.29.1616515365190;
        Tue, 23 Mar 2021 09:02:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616515365; cv=none;
        d=google.com; s=arc-20160816;
        b=O8eOYL1R3q7BhgPBDwCsNK4whIzJN1RLiB0T095EnfZ88JNHVHsZAw1aJlr4SWuoRB
         xLZFn7o9nWZViz6BGLOpaacA63TZ8OvLotVzlG5sxqRH0fFm1oGX2rZ/L7d5Su34TGtA
         Fv7tPoF6/sdGxzZhqYMq/eQW5WI6OvMMpVWRD8pyS59Pc/tDUDpAEFQggEE93yete5vb
         vzgBr4p7ab0PrUa5kE2ifSV3lpNR5BRwBhYj+x6BGXOyyqzvaPw8HCfOc3R25o9FQY8J
         G+YWD3JZ0X2f7VZomgT8JMuTTnQzbWF4OAkE8yUapqvCY4Om4Gj9t4zjQyvg3g5k1mPY
         NIsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=fsLXfvMmoV1iWOTytjen729jAtqIiyA9FVlE5SS4JDE=;
        b=PPf/xhZ8WTqTXsCenyoMPdN3pdDrWco+buLRrXQ7DgIToga7XfC6PXRfURxFfU1CXY
         oU02ApYS5EhPME9uZruMCIC82BvjsXFV/t1N92yjCIIf7/30YfL3ewdzCgkapYI3PBCu
         i1hajTC9vAWw51PTD8KSW1Z05RX2u2/qYJ6lA090BgLdtypslCwyYs9pwFFvLks1kflV
         wq8HpJ4kBnbKNVZK4Rw45L84+mHec9/mDDFVy6ubz6zdDHkkxAEuDy9jEnlYXKO9jywR
         m8bD+mUahzrAXfspgjAgqQDDO8GLUwpg+PcDW5dTUZYzTi70VZW2rpNSuRvzaNJ4cGwS
         6g0Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id i30si820136lfj.6.2021.03.23.09.02.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 09:02:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12NG2iCT020957
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Mar 2021 17:02:44 +0100
Received: from [167.87.18.33] ([167.87.18.33])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12NFvhX9009241;
	Tue, 23 Mar 2021 16:57:43 +0100
Subject: Re: Arm zero exits and zynqmp ATF SDEI-enabling patch upstreaming
To: Angelo Ruocco <angelo.ruocco.90@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>,
        Marco Solieri <marco.solieri@unimore.it>
References: <CADiTV-03GyURVJ2De-Fe5reAcvveWQq7JxAUTh2kES2DSbwcWA@mail.gmail.com>
 <23971adf-097b-073d-b31a-9de1a333fbbf@siemens.com>
 <CADiTV-1tnpfVYjnmvuvG7Tz6q-+dMZ3PdKxjqBonyFatWh3irA@mail.gmail.com>
 <f88cc779-00a7-dbc5-19b7-c4ba9921d5a6@siemens.com>
 <CADiTV-1AsxjptpR4q4rbEhZnkpOjJiAxo_omnNX_QHZZRnyakw@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <90b4e3c5-4841-0699-7601-f455e569c84b@siemens.com>
Date: Tue, 23 Mar 2021 16:57:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CADiTV-1AsxjptpR4q4rbEhZnkpOjJiAxo_omnNX_QHZZRnyakw@mail.gmail.com>
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

On 23.03.21 16:36, Angelo Ruocco wrote:
> On 23/03/2021, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>> On 23.03.21 12:33, Angelo Ruocco wrote:
>>> On 23/03/2021, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>> On 23.03.21 11:17, Angelo Ruocco wrote:
>>>>> Hi Jan, all,
>>>>>
>>>>> I have seen that arm-zero-exits has been merged into next.
>>>>>
>>>>> My understanding is that right now the only officially supported
>>>>> boards, meaning supporting both jailhouse and SDEI, are NXP's ones,
>>>>> with only a experimental patch for the xilinx zynqmp firmware to
>>>>> enable SDEI.
>>>>>
>>>>> Regarding that patch, I have looked at it, tested it and added the
>>>>> missing non-secure-boundary check.
>>>>>
>>>>> Are you thinking of submitting it upstream? If so, how do you want to
>>>>> proceed?
>>>>
>>>> If you have everything ready with the patch, I would not mind if you
>>>> pushed that upstream. Just CC me.
>>>
>>> The only thing missing is a proper commit message, I could also write
>>> that, but I don't really know whether it's appropriate for me to
>>> submit a patch of which I don't have the authorship. What do you
>>> think?
>>
>> But you added something to it as you wrote above, no?
> 
> Yes, but that's hardly worth adding my signature to the patch, not to
> mention authorship.
> 
>> Otherwise, share what you have, and I will kick off the gerrit mess.
> 
> That is ok by me. How do you want me to send the patch? Here in the
> mailing list?
> 

Yes, just drop it here, attached or inline.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/90b4e3c5-4841-0699-7601-f455e569c84b%40siemens.com.
