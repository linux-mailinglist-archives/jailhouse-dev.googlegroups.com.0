Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQEF23XAKGQECAYQ4WY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 644B7104316
	for <lists+jailhouse-dev@lfdr.de>; Wed, 20 Nov 2019 19:15:29 +0100 (CET)
Received: by mail-lf1-x139.google.com with SMTP id f20sf36487lfh.7
        for <lists+jailhouse-dev@lfdr.de>; Wed, 20 Nov 2019 10:15:29 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1574273729; cv=pass;
        d=google.com; s=arc-20160816;
        b=aPia8KyysTfJmM1kZI/ySLpSmf3lc/GaVgIHsfmKaYckNJZaKj1/huUwEGvoDSOguZ
         db7Dibasn2P22d5CABRZnb/IgKsXJGsbB5spZcIYaIVZiNNcKJWll6G5I+XJr6lwBlZo
         CUzohaJIwcx5TTYa/mh556l9btpbWfWeOpC8VMDIxziHhlCuCdhII1F/UEoxF8MkFe3M
         1MkRZNUnwx/eyzqRVeB8BkVc6Kxfqv43q//UA2nRB6t4SNskiIUX2uy/HRJL4+f8MKuu
         Cxy2WhzZrnlABHp2bM/8QiGZvqw7HyZch+SXjQUA+nZds7D7n0F8kjOKCD2CQvOdNM+N
         3lmw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=7/dYzAwuEZn/ebGsKkIgeOok0WiGqF3YhfC8zgAjpXo=;
        b=c0Fg+uyW3/cEBL7qZYCd8hTwKE3yvNZtScwMJXLD94mP4rO54UCIC99An2Q9LPB/fh
         lyJsAwI5nzci55SS5e9vbBHt2d5uUgBz/d5mfI8PeZacZHedGsv3qSfhDLiKUv0nFe5X
         LzvvqZxmkX9ec27zcOLj1yZqXNmlXBBK9cNKjVmD8BG5r4RyA69bxuEleOpEBNwYPGJN
         1m8zIwLo5a/2JRtlVcN+AJ8P5mbdVMDPZCmbZwpqe2LEkxhvaKq7uagrb4RkFrpYdUu7
         OkK/apOlX4UZBEuqfvqo8onWsKCqgYhWA5Mv3cMNfholMsKOASzd+nCuBME19str90nv
         3hGA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7/dYzAwuEZn/ebGsKkIgeOok0WiGqF3YhfC8zgAjpXo=;
        b=I6gmSIgOB+Rp6k7R1NOaEeYIjG02ikkZar27AQj4MNk4NCUXJiHtwcorNRNbmFyEoF
         bxetGZ5wiAPg5uxNh1zXuQtOW/DRQ8Nqi8WJGEInzBdsge0Q1MX2HRbF6DLszLImNUuk
         t7ZqVe0b0dH4TOKWAc9CNF07RdVAnK9zerpHxeCtESUKBQPMxjiro9HRftRIMvxJos51
         FpSazwNX8mCnxdsFzZK5pz+iaVp4iaNni9OMZvB4od+giSAbE7TW8opUn2V1MpYF0VvZ
         rmTRbvo7bop2Ld1AE8Z6YWNKO3IaMj0cxYByuIYrn8B0l4H/AJqOwcvn16y9gU1Enjy+
         7kRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7/dYzAwuEZn/ebGsKkIgeOok0WiGqF3YhfC8zgAjpXo=;
        b=Foek2ezujv9bMwkBJasBpkaBca5D+oOGmTGrRD0PGaY7xpZTJMYyIuQC7NpahjRAGQ
         dKWGOFw2Iu+iy/uFKAOU2QewpcG2RBMnDQst8RiWhm+vhfCvFOPhPNJ/Ui7gGyaEIQ52
         FVuWgrpxv9W0GnUcry3/ojnmmNW+B+LeoltOpt6PWCucXTunHjC0gmsXxeWiwrfGh97O
         gU4Q1r+DsB1rH2Ysp5bGQt1Hm93nbnhb3WLtDAczU0Vr8wbEWTdr0WVOgRiMzpB1xUwH
         IP0FP85ugHe7r0al76dCn90vn9qdWn8QJjUFxu13iQgYNjggklnqcHsi2PfE97jRQGl1
         NCfw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUuXPjMbSdaRHqCto9wMWNyJgmfudwfxRUfckjOx9q0lON7qV85
	jkCMtfjBSZ+fNH4PKqEbe3s=
X-Google-Smtp-Source: APXvYqy+AIPhqVKtddICdpSJXYltrjpggn4G3rHeKne9ykx75mwkY5O+4qpoZ30fF/EvLhL5CVRrQg==
X-Received: by 2002:a2e:547:: with SMTP id 68mr4003857ljf.150.1574273728990;
        Wed, 20 Nov 2019 10:15:28 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:790c:: with SMTP id u12ls13335lfc.4.gmail; Wed, 20 Nov
 2019 10:15:27 -0800 (PST)
X-Received: by 2002:ac2:5935:: with SMTP id v21mr4161680lfi.19.1574273727740;
        Wed, 20 Nov 2019 10:15:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574273727; cv=none;
        d=google.com; s=arc-20160816;
        b=s1OThz9h09EMfQnBkJmuzyTPUOkrjm7BRIYHsgo0WKzpv+zncPMRZJCtQG3TFJfhmn
         0tdbhdSm7zv+kYHJblrmuawu49SAyovNYzZ0auIYaOZ0OSAVCwD0XtL2N7QVDVOBFVzf
         eLlaa1dRfrB4GAHr0Kyxmksp8lUmSdzbN6MGhrHSADq5FjK2qHNSYcGvPwwgc36rVdk2
         0LSj/q2RNtoXcB7UnWqlWkvRdH7kqFU9Se/bGhRJJ1WN5rIro27+fLYxeUUwezaDIc4h
         4bN3GsnLlpr2qyL8cD8hP3mxfVUtoYW9324cI/sCWPkB38lwY9ZcuYUG4tzeBG2a+qfR
         sk0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=6qUL3f9j62kr9E7j3GGECGLP1SC/KHiWJTJVKuR0sXk=;
        b=K4oUL6XmpeL4XmjwT5cFX9vUhD+36WbIHKTU5zZ6bM7KF3AkXTfaBEWHVDdQYqNJBx
         S4b9EqDTcSN9FRf4MfurE0EAIpUSRPJTsetXqFyp6waMm+YukeSpV5Pn50PSn3X0pmf1
         YP+aMAnDtlK8HE7VBL81aAehieN/QZcOwK6P5/WkTeY0b07nxcS26XrbDRL5i0X19KQS
         FKvZjum2YTedahYIYWlsxCfrlmUl93/oHULMKg5wcrQQe33QVHv79aIzBGRgNWeoYI7D
         umEb0BcS3CtPUJXqaw56Kx1bUNGNU2sdaQirJJnuPIL7ds0+8t9LIoZm3HchceCra9c/
         UNpQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id k20si3968ljg.0.2019.11.20.10.15.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Nov 2019 10:15:27 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id xAKIFQ8o022684
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 20 Nov 2019 19:15:26 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id xAKIFMnn032384;
	Wed, 20 Nov 2019 19:15:23 +0100
Subject: Re: [RFC][PATCH 2/3] docs/specs: Add specification of ivshmem device
 revision 2
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
        liang yan <lyan@suse.com>, Jailhouse <jailhouse-dev@googlegroups.com>,
        Claudio Fontana <claudio.fontana@gmail.com>,
        qemu-devel <qemu-devel@nongnu.org>,
        Markus Armbruster <armbru@redhat.com>, Hannes Reinecke <hare@suse.de>,
        Stefan Hajnoczi <stefanha@redhat.com>
References: <cover.1573477032.git.jan.kiszka@siemens.com>
 <f5996d934d24775160bcedbf28ac975a95d91101.1573477032.git.jan.kiszka@siemens.com>
 <20191111084327-mutt-send-email-mst@kernel.org>
 <0b0475c1-2564-f433-46d8-ff1a06c13569@siemens.com>
 <20191111100607-mutt-send-email-mst@kernel.org>
 <20191111152743.GM814211@redhat.com>
 <20191111105850-mutt-send-email-mst@kernel.org>
 <ef21ed49-d315-4ee5-716b-096d8af1d79c@siemens.com>
 <20191112024400-mutt-send-email-mst@kernel.org>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <78228aba-6e30-806b-2d17-0d18238b84cc@siemens.com>
Date: Wed, 20 Nov 2019 19:15:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191112024400-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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

On 12.11.19 09:04, Michael S. Tsirkin wrote:
> On Mon, Nov 11, 2019 at 05:38:29PM +0100, Jan Kiszka wrote:
>> On 11.11.19 17:11, Michael S. Tsirkin wrote:
>>> On Mon, Nov 11, 2019 at 03:27:43PM +0000, Daniel P. Berrang=C3=A9 wrote=
:
>>>> On Mon, Nov 11, 2019 at 10:08:20AM -0500, Michael S. Tsirkin wrote:
>>>>> On Mon, Nov 11, 2019 at 02:59:07PM +0100, Jan Kiszka wrote:
>>>>>> On 11.11.19 14:45, Michael S. Tsirkin wrote:
>>>>>>> On Mon, Nov 11, 2019 at 01:57:11PM +0100, Jan Kiszka wrote:
>>>>>>>> +| Offset | Register               | Content                      =
                        |
>>>>>>>> +|-------:|:-----------------------|:-----------------------------=
------------------------|
>>>>>>>> +|    00h | Vendor ID              | 1AF4h                        =
                        |
>>>>>>>> +|    02h | Device ID              | 1110h                        =
                        |
>>>>>>>
>>>>>>> Given it's a virtio vendor ID, please reserve a device ID
>>>>>>> with the virtio TC.
>>>>>>
>>>>>> Yeah, QEMU's IVSHMEM was always using that. I'm happy to make this f=
inally
>>>>>> official.
>>>>>>
>>>>>
>>>>> And I guess we will just mark it reserved or something right?
>>>>> Since at least IVSHMEM 1 isn't a virtio device.
>>>>> And will you be reusing same ID for IVSHMEM 2 or a new one?
>>>>
>>>> 1110h isn't under either of the virtio PCI device ID allowed ranges
>>>> according to the spec:
>>>>
>>>>     "Any PCI device with PCI Vendor ID 0x1AF4, and PCI Device
>>>>      ID 0x1000 through 0x107F inclusive is a virtio device.
>>>>      ...
>>>>      Additionally, devices MAY utilize a Transitional PCI Device
>>>>      ID range, 0x1000 to 0x103F depending on the device type. "
>>>>
>>>> So there's no need to reserve 0x1110h from the virtio spec POV.
>>>
>>> Well we do have:
>>>
>>> 	B.3
>>> 	What Device Number?
>>> 	Device numbers can be reserved by the OASIS committee: email virtio-de=
v@lists.oasis-open.org to secure
>>> 	a unique one.
>>> 	Meanwhile for experimental drivers, use 65535 and work backwards.
>>>
>>> So it seems it can  in theory conflict at least with experimental virti=
o devices.
>>>
>>> Really it's messy that people are reusing the virtio vendor ID for
>>> random stuff - getting a vendor ID is only hard for a hobbyist, any big
>>> company already has an ID - but if it is a hobbyist and they at least
>>> register then doesn't cause much harm.
>>
>> Note that ivshmem came from a research environment. I do know if there w=
as a
>> check for the IDs at the point the code was merged.
>>
>> That said, I may get a device ID here as well, provided I can explain th=
at
>> not a single "product" will own it, but rather an open specification.
>>
>> Jan
>=20
> OK, up to you - if you decide you want an ID reserved, pls let us know.
>=20

Turned out to be much simpler than expect:

I reserved device ID 4106h under the vendor ID 110Ah (Siemens AG) for=20
the purpose of specifying a shared memory device via the VIRTIO TC. Will=20
update this "detail" in the next revision of the patches, also resetting=20
the device revision ID to 0 as no longer need to tell us apart from the=20
current implementation this way.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/78228aba-6e30-806b-2d17-0d18238b84cc%40siemens.com.
