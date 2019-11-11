Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB24WU3XAKGQEBONLZWA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 4637AF78B1
	for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Nov 2019 17:25:16 +0100 (CET)
Received: by mail-wm1-x33a.google.com with SMTP id i23sf7130783wmb.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Nov 2019 08:25:16 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1573489516; cv=pass;
        d=google.com; s=arc-20160816;
        b=rHGCvKrPRLSVQeXROojONmyXh9RA1NQbq/6Hob33kstiZR5ZxGy0W6qNpJx1uFa0Y6
         p/QoHmL05HQv9xG6AMVsNbLgvFsxUUop+8e7iabAYyV+l11a8gpw0L1P7uv2z/PODJgO
         /BDOhEL45+GJFAe2LDi6VeneEjxXswkA9DAK8FArWIMVS4vZKUlE76BlU8ZCgTQ+LhmE
         SeCYYrVct004yKSwif+WGfZqwP/iM9IByvxl7uxnpfVLKzMXGLGqYLlQlkF9xwt41FT8
         vQJuyIWO0edBHuIEc+ZmvSqVuhahvpKiw8WH+44n/uFffEwac9lB/ydLlQGB3RYiWxeX
         KYfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=Mvd4G6GDcyde4wMDm8b8tRvrPK9nXfMFUY549FjzbGA=;
        b=rLiVgP2ELwCuAyGS4mKrKEBn+C7vHfNW/zasPnTBj8Ngqdg7I/Z04tTkglV4j0JK5Y
         thzk7bV9RNkIRj72v0hhrFM9DXWejsChNkugV0QrZ7VeJZjIpNV+n5fSfjGIiLIJmxKo
         seWypJY8La6xqDZ24jT11kVTGWHx3BcJZI0/z8ziJcqOa7HrTVU5Y6J6lvdSqpnPsLNJ
         +CikRdpV7O2UuvYc3o7h/QTK7RxqIFgBTo8uyo+eNmx4kzgOybdyUfIQlikCTIpQBMCu
         sQIKgrSUjD6/OdhReROG4rmhE9hGFmEe2ObULBs2n6leVp7BdrGdbt0YWnwM3HFzb58Z
         mx0A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=temperror (google.com: error in processing during lookup of jan.kiszka@siemens.com: DNS error) smtp.mailfrom=jan.kiszka@siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Mvd4G6GDcyde4wMDm8b8tRvrPK9nXfMFUY549FjzbGA=;
        b=r+HP9Mz7AbY26ne+sMqwTRooYKeLS7I1J8+VT9VBYeiSBqrIOEL5lcnyI9VFzvWD0Q
         XPuUvEhuhKNpD2rCPnre3CEk/hJ0q3vnjkebzbERfazS25CejTIamccsdaNEqSajjWu6
         FlgIPqScd6tf04B53ekqde96JuXYcKgo5CMBwC27okJQYQnarbnHAYduAqwZKyfdRMrA
         1IhybUorLyhIrhQdEimJpw0fxucP69fUA4mJKOu8vJ858j3e9HTpro6i088WpCZOCR01
         7eES5BRm7NeC4wKFAZsoHXsGHmyarzPjzAqJoiOTvbvp1borUwEFekYoKMKISfIAUMxC
         Uvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Mvd4G6GDcyde4wMDm8b8tRvrPK9nXfMFUY549FjzbGA=;
        b=KzYtJGVX5w5MCUI3gcFs/oJzUW6RLIqW9hGBYqKA3N9S0Y3NGxxM5mXWhM1g2bh+hb
         Aq/k5XlMdIEdNNJ2TLa44NvRmgodgLitCnFI5zYy+DC5gKDk31X8oP9DvRjYAl69BlEe
         UBFLkzTFkCkH7xaZUOmzCXAP1FkpK+wAwlawYcXauu6WayFoo1VsPiqYZiJHrQy/4GSz
         peUJ08oei0Z47Hai0lo6YmFbVBU1otvHJVdoX0cWjX/6VIy7hJvJjGgSwWb9oW0Vl91w
         4MYLP6KYcsDxxlg8EhYAgUvW3nnvpEkLzRnJr8CStN0oLvTQHpbgy5wnOFh/XqBw8YuG
         muoA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUz/kiPN9fy8DuKhLa0CV9NzD3gymDF1tb9fBNR4HsOlKXdFwm0
	4p/JlILzpD5YzBAsBcS3IzY=
X-Google-Smtp-Source: APXvYqyjEQEGr40cZTQ76jjLVtMwUwh4YTJBTqyqZ+XvIwIIQclaCZev/qgf4MU6+3hPRFaTavrWng==
X-Received: by 2002:a5d:448f:: with SMTP id j15mr20567023wrq.70.1573489515928;
        Mon, 11 Nov 2019 08:25:15 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:9d8b:: with SMTP id p11ls20019827wre.7.gmail; Mon, 11
 Nov 2019 08:25:15 -0800 (PST)
X-Received: by 2002:adf:e40e:: with SMTP id g14mr1660128wrm.264.1573489515091;
        Mon, 11 Nov 2019 08:25:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573489515; cv=none;
        d=google.com; s=arc-20160816;
        b=xz41JSbgfKThidStl/QI3Be9ioZg1qAQTD+kPU8qTNBu40R7AFx6IZz3OQBWygRJWv
         UmgBzW3LN9pCFAaqG5hTp8eeI9QAAHP0dI8SSJCOwbX3YxpuDHBjFOSNB/XEB4KCQMpI
         Z1XNneeiga/OH3ROE92UN67qzltVbJJyQJo35dOoZapU4RXj+A//dJEYisppEboqTumK
         0MVOVSErpF70FWm1poqNQ+8dhBfCVRuGOd22klf27L9VwlTECgnjo7izgHigShcIqbhe
         5o0c48bhjOkwAgPnL90S59dI0wfItXo502ijFNVfJLNDjF/eXOPtKm7iMfLMqGwZbok7
         aDJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=7QnNzN+2SWWv9P1TSAfoH/l7G3xVWQgYIUDBw6H1XR4=;
        b=pTEbRPtUINaGgHFSkJIdQ4+gKQFUfTtJQ8f87YYV+ucfrKOe5zKtgJYdwsQvQ+7/dF
         mkwgODE+8u09H+Ww0PioWNds/IiPkvphkABvRAbzv8Vrf5Hv94+0o0JxmguXyugUe6zT
         eKxoLIxj4EISrmpVhCiSKAYZtSkvppy18d3MhI+Z8W5Ar6AQ9jAx5+cm+Xg8gD+kU/+Z
         JedZlXIJALsqq1iEOVNWYN7dIpxxmi6YMiAKwlqUTRm+RSCC6UN2tGNppVIMn51i2nIO
         Amjd/sNRBeIX5bY5/uRaHrSjngHlygMx6I/QQ4eNs1+AWCBVL5LeuHvD0vqnsPXPfv8A
         ypKw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=temperror (google.com: error in processing during lookup of jan.kiszka@siemens.com: DNS error) smtp.mailfrom=jan.kiszka@siemens.com
Received: from david.siemens.de ([192.35.17.14])
        by gmr-mx.google.com with ESMTPS id q73si1362243wme.1.2019.11.11.08.25.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Nov 2019 08:25:15 -0800 (PST)
Received-SPF: temperror (google.com: error in processing during lookup of jan.kiszka@siemens.com: DNS error) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id xABGP8Fw031243
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Nov 2019 17:25:08 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id xABGP8vd009037;
	Mon, 11 Nov 2019 17:25:08 +0100
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
 <129c527c-1e61-8c0c-3ca1-fe93e26c8bd2@siemens.com>
 <20191111111203-mutt-send-email-mst@kernel.org>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <402f66c9-2038-7fa9-ce02-850b20edf36b@siemens.com>
Date: Mon, 11 Nov 2019 17:25:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191111111203-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=temperror
 (google.com: error in processing during lookup of jan.kiszka@siemens.com: DNS
 error) smtp.mailfrom=jan.kiszka@siemens.com
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

On 11.11.19 17:14, Michael S. Tsirkin wrote:
> On Mon, Nov 11, 2019 at 04:42:52PM +0100, Jan Kiszka wrote:
>> On 11.11.19 16:27, Daniel P. Berrang=C3=A9 wrote:
>>> On Mon, Nov 11, 2019 at 10:08:20AM -0500, Michael S. Tsirkin wrote:
>>>> On Mon, Nov 11, 2019 at 02:59:07PM +0100, Jan Kiszka wrote:
>>>>> On 11.11.19 14:45, Michael S. Tsirkin wrote:
>>>>>> On Mon, Nov 11, 2019 at 01:57:11PM +0100, Jan Kiszka wrote:
>>>>>>> +| Offset | Register               | Content                       =
                       |
>>>>>>> +|-------:|:-----------------------|:------------------------------=
-----------------------|
>>>>>>> +|    00h | Vendor ID              | 1AF4h                         =
                       |
>>>>>>> +|    02h | Device ID              | 1110h                         =
                       |
>>>>>>
>>>>>> Given it's a virtio vendor ID, please reserve a device ID
>>>>>> with the virtio TC.
>>>>>
>>>>> Yeah, QEMU's IVSHMEM was always using that. I'm happy to make this fi=
nally
>>>>> official.
>>>>>
>>>>
>>>> And I guess we will just mark it reserved or something right?
>>>> Since at least IVSHMEM 1 isn't a virtio device.
>>>> And will you be reusing same ID for IVSHMEM 2 or a new one?
>>>
>>> 1110h isn't under either of the virtio PCI device ID allowed ranges
>>> according to the spec:
>>>
>>>     "Any PCI device with PCI Vendor ID 0x1AF4, and PCI Device
>>>      ID 0x1000 through 0x107F inclusive is a virtio device.
>>>      ...
>>>      Additionally, devices MAY utilize a Transitional PCI Device
>>>      ID range, 0x1000 to 0x103F depending on the device type. "
>>>
>>> So there's no need to reserve 0x1110h from the virtio spec POV.
>>
>> Indeed.
>>
>>>
>>> I have, however, ensured it is assigned to ivshmem from POV of
>>> Red Hat's own internal tracking of allocated device IDs, under
>>> its vendor ID.
>>>
>>> If ivshmem 2 is now a virtio device, then it is a good thing that
>>> it will get a new/different PCI device ID, to show that it is not
>>> compatible with the old device impl.
>>
>> At this stage, it is just a PCI device that may be used in combination w=
ith
>> virtio (stacked on top), but it is not designed like a normal virtio (PC=
I)
>> device. That's because it lacks many properties of regular virtio device=
s,
>> like queues.
>>
>> So, if such a device could be come part of the virtio spec, it would be
>> separate from the rest, and having an ID from the regular range would li=
kely
>> not be helpful in this regard.
>>
>> Jan
>=20
> I agree it needs a separate ID not from the regular range.
> It's a distinct transport.
> Maybe even a distinct vendor ID - we could easily get another one
> if needed.

That might be useful because I've seen the kernel's virtio-pci driver=20
grabbing ivshmem devices from time to time. OTOH, that could likely also=20
be improved in Linux, at least for future versions.

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
jailhouse-dev/402f66c9-2038-7fa9-ce02-850b20edf36b%40siemens.com.
