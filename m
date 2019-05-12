Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB3MG4LTAKGQEJ44LGFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8161AE22
	for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 22:34:53 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id x9sf7456689wrw.20
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 13:34:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557693293; cv=pass;
        d=google.com; s=arc-20160816;
        b=FX8A9YZ2j9sRX/t5CGFUy+1D47spf7t2lE37V0GWL325MXRsWWuPxjm9iDPsY1WRZA
         ich3ghP/hxAxC30b070S9rF3OQ2dbdPHclTqvjPT5qSK/adxXl8maNvskJKSFC383MUW
         FBI3QxfuAMME8WVrGKVv9IfVvMEW2BZM2TOky47frXPUcBPL9i4v73BnxRZQwrCDwaNZ
         XKWAkiHDnYOWCZAgCREf28izDQfj9yG+Tivh39WL9nB6+vIdpbS52oztirS9ekWdoB6g
         ed1iM8K1a7hCQL29W7I+bnm8BOq6KWWlFhgbXhpjtRbLmQKi+3eBfzwxvrQiy18JNRcC
         I6pA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:autocrypt:openpgp:from:references:cc:to:sender
         :dkim-signature;
        bh=DnYmeCPf9hJn3Eg3Y+X41u/UmbRfTO4XYRwe1Sl4z/I=;
        b=mgnm+AK7zeczDYQB7Han8VZU9r9WQdVvmDpVgYvgzLJ8Ga4fN6tsZ8yTAhP3e8XXXO
         rs8c+jnZWu+OVGA/JEbjQhT3yAPZAbMP4Kzy2Yy20+2kiXREw+oXh6SMOyJn95r3i/LV
         RFsZIkMaVJbzpGFmgku9l/uJKPD7eQNYzLyV+t12mXL4oWJjemfPjJ65AoJgTD/6k7SZ
         glBtERE6k9bsEQ+6G/VEw5QhXi35nT2denWLfVy8LxLLJB1KHB3Skp3KdEuVl+Bhvsub
         THqSv3N+znkct3z9mPBYe99GOVxV+zLJhbkT9BGjxAhS4BOsO7otuaZvTOASyChvL4Tl
         79eg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=I89UYddR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:cc:references:from:openpgp:autocrypt:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=DnYmeCPf9hJn3Eg3Y+X41u/UmbRfTO4XYRwe1Sl4z/I=;
        b=Bv6zIgcUNcZxPYy2WLkAP8Q5qYxAMAeI5bynmOzFttpw9Y83NtXhMqjWAf0M1gu4Gp
         Lqy3GcdMYMI3dL3FoOn518lrFebtqXKh1q1XEsdQziyaBH9u00avc9NGUewkP1dmzJxZ
         BMAB6m+qa1IzM/D+vYABGbfastjScBsKlHe+mz/F/YwmT3e7JAV1/qEyRH5bRRvQF1+U
         S3BAWIqr/X/mCqlADuunT/RyGjowGBBKrBTby5ZEv0eL/1Y8HWow33EUtl39tc6Aa+zL
         xD0vQ4v0iOLDC38EkwyC9qRcxkzstEvds5jodLEoy0Y0+aymcL/MFDgAcxApPOe+Yi/s
         6sbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:cc:references:from:openpgp:autocrypt
         :subject:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DnYmeCPf9hJn3Eg3Y+X41u/UmbRfTO4XYRwe1Sl4z/I=;
        b=jNsG0gESzcMMMPlbmoRKzpWUzpJJZ/vYN9GatKmAV1u+mGsUp1t8OUq1S7qtwtH3Z2
         wh/kVUOp7utIkzzG5eDCwXQIez2TOTEzS5W9V1Ul2C17UUie6RO15hqOg4WbfmizbOYh
         IlldUcl43+w3yg10eh/WB/gcqYWTivtSHeZTyvImKk+u9cbuJdTgi+GHTVkvdf2THi+m
         j5wAKsZKa12HyQLZ7EInwOa71H/TxBRui/5dq/J7vKwsVL2gjI/sXGcAALMgsrH4Fnf/
         1LVZgAJfHT2KMgXzd+vPm0F5JiyXrDa4EOA9hoeqBFbVh3HpLCCTvpiogcA546feKiPD
         A+rA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXQ1hThsg/Ea104lu8bCl5t4JQ+H1LmA5oS4nprK8AcKDBn+um4
	XkPoKdhjksDeHyvcIz092sU=
X-Google-Smtp-Source: APXvYqzO+0Ykd3sS5LPOYBOTcdG6g4yOYseZGffeOgJrGsUcI6jJhG1yCjmvpiDS3pD/OqTEk+UavQ==
X-Received: by 2002:adf:dd52:: with SMTP id u18mr628065wrm.193.1557693293324;
        Sun, 12 May 2019 13:34:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:97ca:: with SMTP id t10ls2610646wrb.10.gmail; Sun, 12
 May 2019 13:34:52 -0700 (PDT)
X-Received: by 2002:adf:e691:: with SMTP id r17mr12064013wrm.50.1557693292675;
        Sun, 12 May 2019 13:34:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557693292; cv=none;
        d=google.com; s=arc-20160816;
        b=kzgFMO6FjqHBUzkYLP5E/IjtPFGPQFoqkYUbkgj6MEKPOUHrTvH5v2jcMPyZwpWe5n
         0yQ9sdaz97XtnGcJNIcXr412Ywy5nxDiPgwunk8AfULPDhyPSTr+PpuBzJdSLHvmVa1L
         GVXi69fu1I3AJHROUMNCji/866NBkF5jbRgjVUkXImeQMPO1iH1sGnUbefoLkYg0jFOG
         X0zBJwP8xXYg/5qln3Ueq1NZtyWPRogK/XzamtjYrBoNTABaFBh5KMRnMmSu2CjYQIQP
         +MOUAZi0lX0zUZ9GagPIjbcSQ1hXo9qtTshvtlgE7nTlGeedBbFNa2Zs4jWCe02Fs6+g
         P7BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:autocrypt:openpgp:from
         :references:cc:to:dkim-signature;
        bh=vJ0duNzCXq9eUXc1H4AJihPR8mcAhnwVw8O5WUQIoz4=;
        b=hyBuM9FgiCzobdsH4uDkyKfJsL0Ae443U6DuR92DBtEIq5VQNbB3frf4L5r+4zXm/2
         zGjYavQyDF9dIXoGYIHoHBlbX84dRWB6LVLPj10OlaMhn5DbFaSrhFN6PmCX7KOjfegm
         ax/YJNIb7cEkWm0UWFnhQAr+DNRGNvsqA32hyTDRzTVefKu75V+r+7iNxn9AE/G30LIU
         yxxGZ0+LKV+KdPrwb+j37KrbiZ1TyjCWK/VfHp0qA5NkM+o++WdMB7xRAuSt6W3JTATm
         K9nFgGWzooecs2cXYg5qa/G3Vdpltu47oqKdEXDn7hOI7mwGzloCpt2s4FtboVEwJVOJ
         Uedw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=I89UYddR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id y139si169089wmd.0.2019.05.12.13.34.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 13:34:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 452G0D1c5vzy9y;
	Sun, 12 May 2019 22:34:52 +0200 (CEST)
Received: from [172.23.4.153] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sun, 12 May
 2019 22:34:51 +0200
To: Jan Kiszka <jan.kiszka@web.de>, Andrej Utz
	<andrej.utz@st.oth-regensburg.de>, <jailhouse-dev@googlegroups.com>
CC: Valentine Sinitsyn <valentine.sinitsyn@gmail.com>
References: <e5d2b706-ca42-9d07-3093-eb9ec547bf1c@st.oth-regensburg.de>
 <835ecb8b-3e0a-b90f-69d9-c240801d3b35@web.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Subject: Re: Running apic-demo trapfree without x2APIC
Message-ID: <c2c39459-478f-8adf-1b13-95af918c5c52@oth-regensburg.de>
Date: Sun, 12 May 2019 22:34:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <835ecb8b-3e0a-b90f-69d9-c240801d3b35@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=I89UYddR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

On 5/12/19 9:32 AM, Jan Kiszka wrote:
> On 09.05.19 17:19, Andrej Utz wrote:
>> Hello everyone,
>>
>> while working on Jailhouse to run on AMD Ryzen without obstacles, we
>> observed
>> high jitter (>1000 =C2=B5s; 40 MSR_OTHER traps/sec) with the apic-demo. =
Our
>> target
>> comes with an AMD AVIC and does not implement x2APIC or tsc_deadline.
>=20
> 1 ms jitter sounds like power management. This can't be explained by a
> hand full
> of vmexits.

Ack. We don't see such high latencies with jitterdebugger/cyclictest
running in the root cell.

Nevertheless, even if PM is involved, 1ms sounds a bit high. We didn't
debug this deeper yet, but maybe there are some other odd things: The
first timer interrupt fires with an 'okayish' latency, then it starts
dropping.

>=20
>>
>> The timer implementation in the inmate library will use x2APIC access
>> methods
>> which will be translated by JH into native xAPIC access.
>>
>> If we switch to native xAPIC access in apic-demo, would it still need
>> hypervisor
>> interception?
>=20
> Yes, because xAPIC is MMIO access that needs to be intercepted
> completely in
> order to filter out the sensitive accesses.

... And it's also not MSR access: I switched from x2apic mode in inmates
to MMIO-based xapic access, didn't help. (besides shifting exit types
from MSR to MMIO).

BTW, Jailhouse always emulates x2apic for inmates, even there is no real
platform support (as in our AMD case). What's the reason behind this?

I guess it's simplicity, right? We would need to trap if we use xapic
mode, and so we do with x2apic if it's not present. On the other hand,
if it is backed by real hardware, we could save some traps on MSR-based
x2apic accesses.

>=20
>>
>> Also how far is AVIC from being usable?
>=20
> IIRC, it was implemented but didn't work as expected in all cases.
> That's why
> it's still off.
>=20
> I do not remember, though, what exists it can avoid. With AVIC on, some
> of the
> xAPIC accesses should be handled directly by SVM. But one question is if
> APIC
> timer interrupts could be generated natively - I would guess not.

Raises the question if there exist native AVIC timers that can be used
without moderation. But that would require software support.

Thanks
  Ralf

>=20
> Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c2c39459-478f-8adf-1b13-95af918c5c52%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
