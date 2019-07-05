Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBRVX7XUAKGQEXGSRJZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A06607A5
	for <lists+jailhouse-dev@lfdr.de>; Fri,  5 Jul 2019 16:16:39 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id p3sf2235037ljp.8
        for <lists+jailhouse-dev@lfdr.de>; Fri, 05 Jul 2019 07:16:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562336198; cv=pass;
        d=google.com; s=arc-20160816;
        b=tfv3ULIfOTiUkNiLX3r62SK/ClPlCumjc0MASuZCW8Msgo3UU7HYdoJT5iqBi1Y8w6
         tgKaVvvlRiV756r8ZAtmcue8XCHyNnRQKNkBK/1K7D5h3Lq7y9NWhkPbl6N06kPd61vr
         Lwbi08B4hdiDK7mn8tVqOzibtRY6Vi+PseI3GAwRq1Els8bm5jpqUhxfF+yLR7n509M2
         gOrJXR12DNRU+rqLFNE4RzsuHQwpv/r8hapaEdB3nKl6B5XkNykci0eZtf3uwjwfW9yx
         N8jHBrlwtAfZdseXLfHOXf8UfpHqsz1yPdXqozs21NlzDfDG3SozyOqFLg8rP8AilKyI
         zvuQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=7Kj66oZsZepFwvzFQkIWgIGO5g8nph+b1loEa7Swxpc=;
        b=mtmOXdGlGBvPL9hO3RrZdxKZipSosXy3yMGyYKR64s2L0fcYtn5Kne8Om/UvxS2IPT
         ycObBjDo3gVBA6LF//rUYkaCiHe2NsDJbRIW83HkS25C5dRjtPU6uMvnUGTtKxfBiTqc
         ttBYYq1O87PNIGJmlghVR9LphOEfaAW2s62GOlUbdxdbZYljUN+M11y3JQsgYQJLDZJO
         Revso9FquYmLxbHepWiwBi2K8xpFRZIoJzo5lRSAi/8s58mnIZ3LJwDQOG5X1QIujlzu
         JEqCsP4RwByS/1I1Ja713tOaZsvKyWmLrIU11UAMFu8JvPqZ6ckUJk0wFmukCCXhqPmp
         0a4g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=A6444Mwp;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7Kj66oZsZepFwvzFQkIWgIGO5g8nph+b1loEa7Swxpc=;
        b=SfkPOqPVioc8Conor20jpJSy7s5/q4ZbN1wTpdGS1JQKtSoq7E4FelSubSod6P/Spl
         Uwngm8dPihTGIjaB2TqeybEpva32PbESCvwWp0XKreqsUmjA0OIJinj0uROoEW0PtExA
         2R4LJdn+xrcx4FiH06GG6S9NpQWVkwCX83tHT3DNAQJcpIJlCWQkeiHsoBIOCV9wMQ1D
         VXaxEW/mH5JOlJSAaB6eT8S0HC/7T6BRuekuGh2n5JTujBfA3QKMSnUxQhPWzuvvVqlY
         PV/yZ6LyuLaLu+auEJ8xKA3V8lJmWJxSfyVedBAftX6H3H41S05HgjHnONnlNK51GYw3
         ZYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7Kj66oZsZepFwvzFQkIWgIGO5g8nph+b1loEa7Swxpc=;
        b=rY5Fz0kGgrhu7BiKafOi1Y59iadciyDeBeeOD4Ek5E0LnKH126VaayTtpKCFDJ57Bb
         lM5r80QTACNiWdXR9QW1B4H1+4zRplF7ttwYqkLieBsNDYpzwxjlOmYPrKRTQA7OeBWq
         /huyqsQ5l5yuQtQXtHSoXxWy6UqLgYyZdO7dSt55eYRPJYrwPUrK7ivtYpRlly+CJreH
         zFlJqSKfUrvsZOmYSe6DIEaXFLLN3o4wbpPD+eq4cPdQOVvkjNoNWFsRV/35Sy89HPI2
         nXXG5GHQF4jA7yTNp1VIy+nihhPITIWxxi34lMEWxSBqotopd/rSVJnsRQ1bPEC7jYJS
         8r0Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUhkCpuMYHJAML1+VbC/du7i29iOnBs0HyzQwoskE4hSwPCSUQe
	02/P0ahanIy7xM8Bc3JP8Fs=
X-Google-Smtp-Source: APXvYqywwrOB+FrIQ0L3aWUdM4rd+7G+elprdWsIYJ0ewUdaV9ud6Rm4D/I2vHUxdnB3sPXDn3b3hQ==
X-Received: by 2002:a2e:94cb:: with SMTP id r11mr2227141ljh.212.1562336198727;
        Fri, 05 Jul 2019 07:16:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9643:: with SMTP id z3ls1094634ljh.7.gmail; Fri, 05 Jul
 2019 07:16:38 -0700 (PDT)
X-Received: by 2002:a2e:9192:: with SMTP id f18mr2356982ljg.52.1562336198150;
        Fri, 05 Jul 2019 07:16:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562336198; cv=none;
        d=google.com; s=arc-20160816;
        b=Ypu1gJQhekxiipytue05z5m3eIgHTsAhBRd6782NxTjNosxfOPiGRrx+FrlbpKEr4C
         8EpEVrU7s6N7AjErvl8vF4cIpoWS3Ht0sIZjEoYeZkT8iJuKpGBZ9dVrQzTey7m+ANLv
         562oi2bG6APdH7CiNZ54RbQjoL2gN013yFVnHJ6uUWUs54H2bNCkFZe6F1mDnhHArdPb
         yi5zfhz/rnYEHaxO5GaQRJltMgIxyMe3shtaSRv21UuO9WK5nifjIAzYkpt81NryFv21
         hQpSR9xcqRpBH0YxSCvjrubS6ocA23NQEWPhgtObxw8CiCoGMgPU+y40zkwr0juFWD/h
         25wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=oJJCuiCR4N2zYeh+jQbtHCKdojBPsfvOnmPXbtKJh1Q=;
        b=oGFXuKB7jVdKJIsuIq3e2v7ADCuPG7x/BNJ1TUYY2xCvTRC2QsExzlCjWp3hGaAmIg
         chsuGyq4gPjAh6EcNQEjXsoo89IwUMeCJSq0tcvIzUmdBaJr4xf2yTojL2w52P0Yp43t
         zDd1HjJ7Unf3u++0jrfAYkqz4zcwnJiWPrL5cLwOJi8cvU26Y4gamNXhap7s1u7STQrx
         85mE1utzhWAohSFD7AFJUfgWzqwuibr9fMmXxkK1ylcFP6gEbfshCqfY3DcvyzfcW2A/
         gNwHOfi8FIZ6Vjet37eLJuTI6cDjBHnhTSNcXB/fwIWx7TdEfQ2jCCyBkgzJjNuCBt/l
         23lA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=A6444Mwp;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id v29si487017lfq.2.2019.07.05.07.16.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2019 07:16:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45gH2s2M4Rzy9y;
	Fri,  5 Jul 2019 16:16:37 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 5 Jul 2019
 16:16:37 +0200
Subject: Re: AMD: non-root linux inmates
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
References: <c2839a0f-c1b5-9139-43d5-01139341981a@oth-regensburg.de>
 <814c68a3-d59b-75b6-ce96-411cb8e5f4a6@siemens.com>
 <c28ae172-5eb8-e9d7-b322-36d7016047dc@oth-regensburg.de>
 <445be499-99bc-a739-f6f7-49dc9d8f9b6a@siemens.com>
 <03de53c2-f063-2288-3ae0-c813b53642ac@oth-regensburg.de>
 <12bf6841-413e-58e3-e7ba-0c7a1557bb48@siemens.com>
 <08841e36-df70-50e8-8094-426d72fead52@oth-regensburg.de>
 <36fc6114-d1b6-da9f-f2b6-b76c1f33b7ed@siemens.com>
 <6de58d25-f1d9-b0ea-b0d8-631250e5ddeb@oth-regensburg.de>
 <baa5bc4f-74c4-c60e-0283-a8dcef07b8bf@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <f2ea45c4-1c22-77cc-a6dc-831aa1e27a3c@oth-regensburg.de>
Date: Fri, 5 Jul 2019 16:16:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <baa5bc4f-74c4-c60e-0283-a8dcef07b8bf@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=A6444Mwp;
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



On 7/5/19 4:04 PM, Jan Kiszka wrote:
> On 05.07.19 15:54, Ralf Ramsauer wrote:
>>
>>
>> On 7/5/19 2:36 PM, Jan Kiszka wrote:
>>> On 05.07.19 14:34, Ralf Ramsauer wrote:
>>>>
>>>>
>>>> On 7/5/19 8:55 AM, Jan Kiszka wrote:
>>>>> On 04.07.19 22:56, Ralf Ramsauer wrote:
>>>>>> On 7/4/19 5:24 PM, Jan Kiszka wrote:
>>>>>>> On 04.07.19 17:18, Ralf Ramsauer wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 7/4/19 4:39 PM, Jan Kiszka wrote:
>>>>>>>>> On 04.07.19 15:43, Ralf Ramsauer wrote:
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>> we have some trouble starting non-root Linux on an AMD box. I
>>>>>>>>>> already
>>>>>>>>>> tried to narrow things down, but it raised several questions.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> The main problem is, that non-root Linux tries to write to LVT0,
>>>>>>>>>> and
>>>>>>>>>> jailhouse crashes with:
>>>>>>>>>>
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FATAL: Setting invalid LVT =
delivery mode (reg 35, value
>>>>>>>>>> 00000700)
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Turns out, in comparison to Intel x86, we don't trap on APIC
>>>>>>>>>> reads, we
>>>>>>>>>> only intercept APIC write on AMD (cf. svm.c:338). I thought this
>>>>>>>>>> would
>>>>>>>>>> be the issue of this bug, as that's an obvious difference betwee=
n
>>>>>>>>>> Intel
>>>>>>>>>> and AMD: on VMX, we do trap xAPIC reads and writes. However, VMX
>>>>>>>>>> works
>>>>>>>>>> slightly different in these regards (side note: [1]).
>>>>>>>>>>
>>>>>>>>>> xAPIC reads on AMD systems don't trap the hypervisor, so I
>>>>>>>>>> intercepted
>>>>>>>>>> reads (by removing the present bit of the XAPIC_PAGE of the
>>>>>>>>>> guest), and
>>>>>>>>>> forwarded the traps to the apic dispatcher (adjusted VMEXIT_NPF)=
.
>>>>>>>>>>
>>>>>>>>>> I can confirm that we now trap reads as well as writes. But the
>>>>>>>>>> non-root
>>>>>>>>>> Linux still crashes with the same error.
>>>>>>>>>>
>>>>>>>>>> Digging a bit deeper, I found out that xAPIC reads are directly
>>>>>>>>>> forwarded to the hardware, if they were intercepted. So this
>>>>>>>>>> explains
>>>>>>>>>> why the bug still remains. This raised another question regardin=
g
>>>>>>>>>> xAPIC
>>>>>>>>>> handling on Intel:
>>>>>>>>>>
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 On AMD, we don't intercept =
xAPIC reads. On Intel, we do,
>>>>>>>>>> as we
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 follow the strategy mention=
ed in [1]=E2=80=A6 But why?
>>>>>>>>>
>>>>>>>>> It accelerates write dispatching at least. I never did the
>>>>>>>>> comparison
>>>>>>>>> if> using a different access scheme would be beneficial because
>>>>>>>>> xAPIC is
>>>>>>>>> practically dead on Intel.
>>>>>>>>
>>>>>>>> Hmm... The change and benchmark should be pretty easy. Once a
>>>>>>>> bunch of
>>>>>>>> other issues is solved, I'll maybe have a look at this.
>>>>>>>>
>>>>>>>
>>>>>>> As I said: you will optimize a legacy code path, not practically
>>>>>>> relevant. If that will simplify the code, though, I might still be
>>>>>>> interested :).
>>>>>>>
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Wouldn't it be more perform=
ant to just trap on xAPIC
>>>>>>>>>> writes on
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Intel? This could be done b=
y switching from APIC_ACCESS
>>>>>>>>>> interception
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to simple write-only trap &=
 emulate (page faults).
>>>>>>>>>>
>>>>>>>>>> However, back to the initial issue. Looks like the difference
>>>>>>>>>> between
>>>>>>>>>> Intel and AMD boot is as follows.
>>>>>>>>>>
>>>>>>>>>> AMD:
>>>>>>>>>> [=C2=A0=C2=A0=C2=A0 0.325578] Switched APIC routing to physical =
flat.
>>>>>>>>>> [=C2=A0=C2=A0=C2=A0 0.366464] enabled ExtINT on CPU#0
>>>>>>>>>>
>>>>>>>>>> Intel:
>>>>>>>>>> [=C2=A0=C2=A0=C2=A0 0.099486] Switched APIC routing to physical =
flat.
>>>>>>>>>> [=C2=A0=C2=A0=C2=A0 0.113000] masked ExtINT on CPU#0
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> This is why the above-mentioned Jailhouse crash occurs. I
>>>>>>>>>> tried to
>>>>>>>>>> find
>>>>>>>>>> out why Linux takes this decision on AMD. Our victim is in
>>>>>>>>>> apic.c:1587.
>>>>>>>>>>
>>>>>>>>>> On Intel, apic_read(LVT0) & APIC_LVT_MASKED results in 65536, on
>>>>>>>>>> AMD it
>>>>>>>>>> is 0. This is why we take a different path.
>>>>>>>>>>
>>>>>>>>>> Now the question is simple -- why? :-)
>>>>>>>>>>
>>>>>>>>>> Are we just lacking ExtINT delivery mode in Jailhouse, or is
>>>>>>>>>> anything
>>>>>>>>>> else odd?
>>>>>>>>>
>>>>>>>>> Yes, the ExtINT makes no sense for secondary cells, and it should
>>>>>>>>> also
>>>>>>>>> not be needed for primary ones. Let's dig deeper:
>>>>>>>>>
>>>>>>>>> value =3D apic_read(APIC_LVT0) & APIC_LVT_MASKED;
>>>>>>>>> if (!cpu && (pic_mode || !value || skip_ioapic_setup)) {
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0value =3D APIC_DM=
_EXTINT;
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0apic_printk(APIC_=
VERBOSE, "enabled ExtINT on CPU#%d\n",
>>>>>>>>> cpu);
>>>>>>>>>
>>>>>>>>> What are the values here, and which are different?
>>>>>>>>
>>>>>>>> As already mentioned above, only value differs:
>>>>>>>>
>>>>>>>>>> On Intel, apic_read(LVT0) & APIC_LVT_MASKED results in 65536, on
>>>>>>>>>> AMD
>>>>>>>>>> it is 0. This is why we take a different path.
>>>>>>>>
>>>>>>>> cpu, pic_mode and skip_ioapic_setup is 0 on both machines.
>>>>>>>
>>>>>>> Ah, ok. Then you need to find the evil guy unmasking LVT0 before
>>>>>>> that.
>>>>>>> Can't be Jailhouse: we hand it over masked.
>>>>>>
>>>>>> Yes, I checked this. Actually we do. But...
>>>>>>
>>>>>> When the cell is created after jailhouse is enabled, apic_clear()
>>>>>> will
>>>>>> be called when the SIPI is received. There, I added some
>>>>>> instrumentation. At that moment, LVT0 holds (and keeps) 0x10000.
>>>>>>
>>>>>> In addition to that, I instrumented the linux-loader. There, I read
>>>>>> back
>>>>>> LVT0. Very early, before we hand over to Linux. No one else touches
>>>>>> LVT0
>>>>>> in the meanwhile. I would see any other guest access as interception=
s
>>>>>> are instrumented (both, read and write).
>>>>>>
>>>>>> So in the linux-loader, the read back causes a vmexit, and I read
>>>>>> back
>>>>>> 0x0.=C2=A0 That's really strange, there is - afaict - no other acces=
s
>>>>>> in the
>>>>>> meanwhile.
>>>>>>
>>>>>> I don't know what's going on there. I don't see any other
>>>>>> modifications
>>>>>> of LVT registers in code paths other than apic_clear().
>>>>>
>>>>> Maybe you can lift the setup into KVM and check if you can reproduce
>>>>> there as well. That will allow to track down the other access that
>>>>> does
>>>>> the enabling. It shouldn't be possible that the hardware does that on
>>>>> its own.
>>>>
>>>> Tried to run Jailhouse on QEMU on a AMD machine with nested KVM.
>>>>
>>>> I currently see no way to test this on qemu, as Jailhouse seems to be
>>>> pretty unstable. We horribly crash in many situations on kvm:
>>>>
>>>> =C2=A0=C2=A0 - High chance of freezes when enabling jailhouse
>>>> =C2=A0=C2=A0 - I loose devices if I don't reroute interrupts to CPU0 b=
efore I
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 create cells
>>>> =C2=A0=C2=A0 - cell destroy doesn't work. We freeze and after a while:
>>>> "Ignoring NMI
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 IPI to CPU 1"
>>>> =C2=A0=C2=A0 - Starting causes exceptions inside jailhouse
>>>>
>>>> So Jailhouse definitely runs more stable on bare-metal than on
>>>> qemu/SVM.
>>>> I need to find another way to debug this.
>>>
>>> OK...
>>>
>>> Next strategy: Frequent read-back and validation of the APIC state. Tha=
t
>>> may help to narrow down the point where the bit flips. Make sure you
>>> read on the right CPU, tough.
>>
>> Finally=E2=80=A6
>>
>> I found the evil guy. It's inside apic_clear. The last call to the xapic=
:
>>
>> apic.c @ apic_clear
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Finally, reset the T=
PR again and disable the APIC */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 apic_ops.write(APIC_REG=
_TPR, 0);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 apic_ops.write(APIC_REG=
_SVR, 0xff);
>>
>> Disabling the xAPIC via APIC_REG_SVR will reset LVT0 and others to zero.
>=20
> What?!?

Yep.

That's my instrumentation:

diff --git a/hypervisor/arch/x86/apic.c b/hypervisor/arch/x86/apic.c
index 7f51b062..d88ee237 100644
--- a/hypervisor/arch/x86/apic.c
+++ b/hypervisor/arch/x86/apic.c
@@ -340,7 +340,12 @@ void apic_clear(void)

        /* Finally, reset the TPR again and disable the APIC */
        apic_ops.write(APIC_REG_TPR, 0);
-       apic_ops.write(APIC_REG_SVR, 0xff);
+
+       printk("Before disabling: %x\n", apic_ops.read(APIC_REG_LVT0));
+       apic_ops.write(APIC_REG_SVR, 0xff);
+       printk("After disabling: %x\n", apic_ops.read(APIC_REG_LVT0));
+       apic_ops.write(APIC_REG_SVR, APIC_SVR_ENABLE_APIC | 0xff);
+       printk("After reenabling: %x\n", apic_ops.read(APIC_REG_LVT0));
 }

 static bool apic_valid_ipi_mode(u32 lo_val)


And here is jailhouse output:

Created cell "linux-x86-demo"
Page pool usage after cell creation: mem 280/979, remap 16519/131072
Cell "linux-x86-demo" can be loaded
CPU 3 received SIPI, vector 100
Started cell "linux-x86-demo"
Before disabling: 10000
After disabling: 0
After reenabling: 0
[...]


>=20
> "The ASE bit when set to 0 disables the local APIC temporarily. When the
> local APIC is disabled, SMI, NMI, INIT, Startup, Remote Read, and LINT
> interrupts may be accepted; pending interrupts in the ISR and IRR are
> held, but further fixed, lowest-priority, and ExtInt interrupts are not
> accepted. All LVT entry mask bits are set and cannot be cleared."
>=20
> If that is not true for your hardware, it does not conform to its own spe=
c.

What can I say, it's not the first time that hardware doesn't conform to
specs.

>=20
>> Seems we must not disable the xAPIC and hand it over enabled, because
>> then guest will read erroneous initial values.
>>
>> Commenting out the last line solves the issue. We can now even boot on
>> multiple CPUs - everything seems to be fine so far.
>>
>> At least on our machine,
>> =C2=A0=C2=A0 - disabling the xAPIC clears LVT* registers
>> =C2=A0=C2=A0 - any write to LVT* will be ignored as long as SVR is disab=
led
>> =C2=A0=C2=A0 - If SVR is re-enabled, LVT* will still hold 0, whatever wa=
s written
>> =C2=A0=C2=A0=C2=A0=C2=A0 to it before it was disabled
>=20
> What a mess. The problem is we try to emulate the specified reset state
> of the APIC here. And this is SVT =3D 0xff, LVT =3D masked.

A quickfix on my side is to hand over the xAPIC enabled.

A proper fix requires to be sensitive on reads on registers while the
apic is disabled. Horrible...

  Ralf

>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f2ea45c4-1c22-77cc-a6dc-831aa1e27a3c%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
