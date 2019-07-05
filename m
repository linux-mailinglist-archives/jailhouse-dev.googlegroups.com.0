Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB57I73UAKGQEIFDZ26I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BE660C6C
	for <lists+jailhouse-dev@lfdr.de>; Fri,  5 Jul 2019 22:35:03 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id f24sf693978lfj.17
        for <lists+jailhouse-dev@lfdr.de>; Fri, 05 Jul 2019 13:35:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562358903; cv=pass;
        d=google.com; s=arc-20160816;
        b=R6aZehvwta2HnmSxIyjh82+9aoqEWC1JbQK2NQLDVQbS+/peIRjptjiEsrw/vIPXa0
         v9FbHgZSNMPLjdHRUQtPaj/1WNUCDpw3C78+HKQy8UZDYn10XC/2riJRL6MOvSGyU7Pu
         Y7uzDttw/r2qVqi0S+JQtizzRaTYD4uWjzF9B7QpOUlt7Fo79WyO23bNGZVRLI00ZaRC
         pELCH9JCYA0gVRVjCvYbQ6AFzpdNd8C+HKiLJWJWJm4MB0M/h569mKsDO73symG3gKKR
         OpdEY1JKnCeqY+IWzEb6Px9+RquHTDuEEXFuODPYlVRgIazlOZfRV0Qqto0I904p+NQJ
         KGmA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:openpgp:from:references:to:subject:sender
         :dkim-signature;
        bh=fb3jH8bPP+nWsm2yL0JSrrspUA4W2qEvP0JFmJjsi1c=;
        b=Cm9qsgOIBXCwqBu5lg6GUgR3vA3wYcDIGDG0wJG9gWQoRKVAO994f2pCcC3cZmrScW
         +J3NRBtO8Oc8VQ15wR5KqZE/bdbknJvYA43a5cu8TtIvn4zATImfuoIg3BiQzeIXuE6X
         5Q16WpUX1IqSRwtBeaKswV3/St/fvqbU3OV7a7LRhVCpe1q9/uD10saTtDIAoI7Mot5Z
         RrZP4pb1xMAw3yrnSHcaUtP/1whHBOxubtuKEaQMnEue0LfSHGfI/WwaURAbfXsv1B4C
         2MCNDDCBufelVkVdDS3VrjP/zMaW4DSTIqoxF1yzgA4GT/rG5okCm5/VnZhyBmIcTdwG
         ug0Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=ePv05KHm;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=fb3jH8bPP+nWsm2yL0JSrrspUA4W2qEvP0JFmJjsi1c=;
        b=Acnb4Wbx5Yt6grgzMSBFOWGszaXCItdzr8c/wvxqxntXr1PjHYsl3GXM3NHKQ6hkHV
         zQ+d0xvinbnT4OPfbCRdhAlaY1yND6n8TSUgrOUVZUDLOM7iFlWcjMZOwGXK9OID/ABv
         z1xIvPBEPWJtutPE7IgkORXfpuU2m0jp1c/UhcQ2UxMhTXFQMx4zCU5lpM3oRUborxBG
         XWurQQR9z1YwNdXx4V8EDiEPvpv3QC2xJEzlc6vp5gMwrcvzDxIXHu4471D0YD/DMGQ+
         ZcJn0R8dEhFfzyE+SPicfqckFKmftrOmGbc9lKybZ49XOOqT3i0bm+OocojAZFLr5Qal
         l+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fb3jH8bPP+nWsm2yL0JSrrspUA4W2qEvP0JFmJjsi1c=;
        b=KCmmZL38VqpbEUrY7Vt9SbMYpA1SxooQVyHzfF7EMWJ0/bduL7q6FTAB6T8hEyBTHv
         P48QIeed2aPdR46qxBTcDqYKylAZtI3M42c+Sz7EOUqDN5EbcuvI0YzomU3/ySPBJXAy
         HroYda9XNh9oICN+jaWgJD7yPinm1ME4OzhH1pm4x/YgUyrvJFG9PzLQbhPijis/egeS
         oujz+BVt5T8/2TvwmVBtY/b+Vp8gpaENPCQOVu9wuJegHpoEj85eWTrbrigninsWmuAv
         JXbOQDLsyKzIOme2n4Cq3tWka2b8AWuCdOgbacydMWNrbZXG4QYke7m0FYgw1WeC7aqu
         mVBA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWauMlawtJebGXgZ4dv5V+4AeRLqwhXVnNwXE3rq50yJyqgehRL
	c3Uy8fdjKAc3vqE8F7Ue5Ac=
X-Google-Smtp-Source: APXvYqyIqq37jcCG6JyIgnkrTzpP8YxdP6XXlODfh7pCjGC9nvfKfnmT65dXsZdQu/i/jLDCzku3vg==
X-Received: by 2002:a2e:2b57:: with SMTP id q84mr3158205lje.105.1562358903140;
        Fri, 05 Jul 2019 13:35:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5213:: with SMTP id a19ls662649lfl.8.gmail; Fri, 05 Jul
 2019 13:35:02 -0700 (PDT)
X-Received: by 2002:ac2:4d02:: with SMTP id r2mr1262484lfi.138.1562358902588;
        Fri, 05 Jul 2019 13:35:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562358902; cv=none;
        d=google.com; s=arc-20160816;
        b=xolnAEZz5WuIGQynLM++L+9qtPgzl4zzA0cEGAaSXUqrR6LyugtbOR8nN8PA5teqdR
         OgXGiZwwceRHjJ6u4vmrpDLdYZBRf09QcaCuxu4AwvXAQ0CEqVX2P1QGn8dZkyzSVeqC
         kTHUPmeSrKJ/xqxUUlofGeIjIdDwthckHHUs6WnIiWv4+rWCEZF0VGiDmhxsLhz2wPW/
         NQXWg9YX8UBRUl5NJOVmzUk4ibI46Ja3iHJnq4ALdOc3uDnl8FlzGiKl/dOG1UnZprjn
         7dQFR3TUJdY3Gjx/SWKIyA0uXHLTwZ60Eqrmwn7N/VdJzNpi1xOl+RP8CD406mNKzYK5
         xZGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :subject:dkim-signature;
        bh=t/dpOwBY0Ij/DvXGvLaemwNwmu0EoyW5As1EgNIVdtI=;
        b=vIk6nmIIWlyiLlP1dZAsuB/ehecrXL8ur9a7GVkpE0T+q06tZAleBnN9OTFEU/JnVx
         P8X2rdJUADbcRZFFylmGmjzeJd1fBXOT8QzQz4H3M/szi4EsU74MT0lFNjOrbvRFFxgW
         1Y6mVaf4NNQpKAMN+gQHXF/ajCaP0qcyfvMCfvVeVNrBQJcp+YBpaBPQig5lxNbfL2TH
         zpjGM+PbRydcwvsXKhcVIbRVuIjjTu9qgWlAv8pbSX22FuZJ2ifMT17gPY9C0UbotK1c
         2ncFV3o5LvjFe0ZMFzBb4SdY0UZINFEWZ/6R22qu9d9CfOriByA7ZBdF84/iZnYpOc5N
         0mdA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=ePv05KHm;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id h11si657669lja.0.2019.07.05.13.35.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2019 13:35:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45gRRT5yTTzy4D;
	Fri,  5 Jul 2019 22:35:01 +0200 (CEST)
Received: from [172.23.3.82] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 5 Jul 2019
 22:35:01 +0200
Subject: Re: Having trouble setting up a shared PCI device in root cell
To: Jan Kiszka <jan.kiszka@siemens.com>, Mario Mintel
	<mario.mintel@st.oth-regensburg.de>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
References: <525b5e1b82474f3eaaecf83b150aa9f7@st.oth-regensburg.de>
 <bb241636-ed0b-6803-4f34-492744389445@oth-regensburg.de>
 <6417df53-38ef-d810-4e2e-9593c84aeaf8@siemens.com>
 <6a5c3bbf-ea93-775a-edaa-1dda25b08d8f@oth-regensburg.de>
 <81c3353e-88f9-5908-ef76-bbc8f28c7613@siemens.com>
 <95e7f303-c5a1-5e52-f012-2df23dcceb19@oth-regensburg.de>
 <065b2f28-c115-41eb-5f3f-8f99fdcbeb91@siemens.com>
 <6ecf8f54-53f3-1c72-b9a6-ce9007982975@oth-regensburg.de>
 <9a4b887f-a641-cacf-763b-53dbd1c229a2@siemens.com>
 <dd55c1a5-8863-5f94-b339-bebc221dfc6f@oth-regensburg.de>
 <7adc75a2-c777-6f35-6652-99dd5212926b@siemens.com>
 <479fadb9-f346-0666-fed5-a1bed2b298c8@oth-regensburg.de>
 <aadf131b-b9be-abc1-73e4-99cc4c1e64c1@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <854dcfd2-81e1-8836-5b57-9a61b8d1d8ce@oth-regensburg.de>
Date: Fri, 5 Jul 2019 22:34:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <aadf131b-b9be-abc1-73e4-99cc4c1e64c1@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=ePv05KHm;
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

On 7/5/19 10:00 PM, Jan Kiszka wrote:
> On 05.07.19 21:49, Ralf Ramsauer wrote:
>> Hi,
>>
>> On 7/1/19 6:46 PM, Jan Kiszka wrote:
>>>> Got it running. The issue was that the config generator fully mapped a=
ll
>>>> PCI Bus regions:
>>>>
>>>> /* MemRegion: 380000000000-380fffffffff : PCI Bus 0000:00 */
>>>> {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .phys_start =3D 0x380=
000000000,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .virt_start =3D 0x380=
000000000,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .size =3D 0x100000000=
0,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .flags =3D JAILHOUSE_=
MEM_READ | JAILHOUSE_MEM_WRITE,
>>>> },
>>>> [...]
>>>>
>>>> So access wasn't intercepted at all as those pages were fully mapped.
>>>> After commenting out all of those regions everything works as expected
>>>> (well, not tested against another endpoint, but at least ivshmem-net
>>>> successfully probes).
>>>>
>>>> The config generator created those regions. Happens on master, next an=
d
>>>> older versions. I guess this happens as those regions don't have any
>>>> siblings -- they should probably be filtered out. Find the iomem
>>>> attached.
>>>>
>>>> BTW: This behavior can be reconstructed by running the config generato=
r
>>>> on the qemu virtual target for x86.
>>>
>>> Ugh. Needs fixing...
>>>
>>> Seems the longer I wait with the release, the more pieces are falling
>>> off (currently fighting against broken dt overlays, thus virtual PCI, o=
n
>>> ARM with latest kernels, including stable ones).
>>>
>>> Jan
>>
>> We still have some issues adding ivshmem-net to the root and non-root
>> Linux cell. Devices successfully probe on both endpoints, the hypervisor
>> reports that the connection is established. Nevertheless, I can't
>> send/receive packets.
>>
>> Looks like the device doesn't come really up, but ifconfig reports the
>> device would be up (on both sides). If I send packets over the
>> interface, I don't get a call on any function of ivshmem-net.
>>
>> After initialisation, ivshmem_net_run immediately returns, as
>> 'in->lstate < IVSHMEM_NET_STATE_READY' is true: in->lstate stucks in
>> INIT state.
>>
>> I suspect this is probably caused by a configuration mistake, but I
>> don't see anything suspicious in the configuration. Please find the
>> sysconfig, and the inmate config attached. (dactales is just the name of
>> our linux non-root inmate).
>>
>> Am I missing anything there?
>=20
> Do you get interrupts? A typical source for trouble is broken interrupt l=
ink.
> And that can be caused by IOMMU mismatch: you put the virtual ivshmem dev=
ice on
> iommu 0, but root Linux thinks it should be elsewhere.

Thanks, that fixed it. Didn't consider the iommu. Must be 3.

>=20
>>
>> BTW: When are packets being sent over the interface? Do I need a remote
>> endpoint, or are packets also sent without having a peer?
>=20
> If both peers are present and ready, the link is reported up on both side=
s.
> Before that, there are no packages sent.
>=20
>>
>> The reason why I ask: I'm not entirely sure, if I'm able to send/receive
>> interrupts in the non-root world.
>>
>> There, ivshmem-net registers int 24:
>>  24:          0   PCI-MSI 16384-edge      ivshmem-net[0000:00:01.0]
>=20
> No interrupts, bad sign.
>=20
>>
>> Does the non-root cell the corresponding irqchip?
>=20
> ?

Seems like I didn't finish the sentence. "Does the non-root cell need
the irqchip for pin 24". But you already answered the question below.

Thanks
  Ralf

>=20
>>
>> IOAPIC[0]: apic_id 8, version 32, address 0xfec00000, GSI 0-23
>> IOAPIC[1]: apic_id 9, version 32, address 0xfec01000, GSI 24-31
>>
>> Currently, non-root only sees IOAPIC[0], and afaict, the jailhouse
>> paravirt driver only registers ioapic[0].
>=20
> The ivshmem devices use MSI-X when the platform provides it. That is alwa=
ys the
> case on x86. So, no IOAPIC here.
>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/854dcfd2-81e1-8836-5b57-9a61b8d1d8ce%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
