Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBEE5U3XAKGQETNW7MRA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id B6230F78F0
	for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Nov 2019 17:38:40 +0100 (CET)
Received: by mail-ed1-x539.google.com with SMTP id f22sf10575292edj.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Nov 2019 08:38:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1573490320; cv=pass;
        d=google.com; s=arc-20160816;
        b=q5YvvRAgQps3J1IFYUHlbdWcGFVe4ftv3ZOz7X4XsEBzqxeclpU6rV80ROwXAuoT3H
         3Q1KfhYf644rXom1h7o9mxZXCOdc8T72KPKBDKNb0LqDeHbKZ0NShRhsVTyobL0CKD6W
         /a+Wyf/t8X7c/VJicjw22hVYaWKAGNXC2q8y/UUYa6lD5pilqFEqRDNtDlYKG5Lm4Mdf
         9GqwlqvvP+mk7RI/NK9jwHYF7977Gs16D+Pzy2c8RrdWmlvfg+4oYbljbEoaz4EJgPQr
         8ZPmOylyag51bm7ScLXl7YvWXJhBZuKk8CPbVJVx5qvzqol3iyw5JoLE9CXKUlVFebC8
         dRfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=UCuKH4gjoAdpn+5V+sd2KlrxWmMcOEFoyagj0E7P0sw=;
        b=deOAXhRvXVLZuvJU+0z3n5rm86xfJDpVfuvN80k/1gRqHHQUBpNR80hsXLlfh9ibVa
         hgZL8F9Kbsbf6wwYsObuopa5dX1UIW6YyJRz6lLawcavAH3ulSyTDprioMpnYkhJdA3o
         IBw6afZ+VJbkEG42I3ORegvYZ5CBFjQ8DIAZFAOBaG+otImQAAa+a+8JP8d1sbcUbFfq
         yqEPJTl+58oOKYqhKg8gtAlDDsyxU8EmHNMFnjAzSoFyVl1o9e30v4kdGSAOaPNVk83N
         Pr7nUY17hi8zuxjL2CcwL9BOw4jUwX4rVDkf2KKx+2CMWKwey18ZjvMJB7uBXGVYupj/
         x29A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=temperror (google.com: error in processing during lookup of jan.kiszka@siemens.com: DNS error) smtp.mailfrom=jan.kiszka@siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UCuKH4gjoAdpn+5V+sd2KlrxWmMcOEFoyagj0E7P0sw=;
        b=aCgA6ddvXzg3pnSPwP9BSR+bCxFVzJ05bSHUB7cPHD9EbBS2Ef9oz3SA21H0zXEaJe
         ZyRpdngZCPxztBV0hwW5LWm9KUuP8piitQRBCBt7iZDokYDLRetI7+9ls4VdxLL5/3Xe
         8OEyka7wtbBBDQ0H/0Uve5Pz523yLU7gwmMXAseck3A2c/Ij2edPwu2X9l4EYTxd9/aL
         lScfPGbvIQKE0gtrMMxcs49CVOsTj57IJqUujfOjmSgOewzg3GbtkCN2OCtkNCuG0u31
         SVuxMbEBZN4OINRottHQPU+nmbDMkDB2N2iPiz+pJb/vqXpa32zcAmXA/Ec1RkV2O1L8
         Oiog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UCuKH4gjoAdpn+5V+sd2KlrxWmMcOEFoyagj0E7P0sw=;
        b=GGOk9+Xr/xKqwCAgevLDEmE9J7bBbuqs++Dg9Lwj202jxbGuB5du2ySr2EEfxVSKPA
         5eCn2e8h4OS3ghnFGTHgD87+qp+dIr3LqsLry17+9r40H2Fu3Ri1Q4ni1el6mFVpbV2N
         tn9gUbEAX5DLgqLRqQwGdJA2TVAEfysxSJkOiPZhdwmc9jTzN21mhjaYmv4mXLnB6dzV
         88BgtXgmzLHRvKrh7gAKRG96zddyCX7pDafP0LMMI1p8ARkvOgMAgbSUuMzikf9T8i+p
         wUVhN7XUHrumnqEr+7af8lxcvTs24J4k2ET6n26sMYOIMGCJPknb8FLe8zqaKZhEvPq7
         NtxQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXm9P4XHPpo52dtufs4CE4joOOmWNnFjxfnu2LJnKx7XPmiVk3u
	HieIVyOv87rnEGaa4A1ktWo=
X-Google-Smtp-Source: APXvYqwHPRyJlSuDZVfW49fMz8HAtjoi1mZMSD8mewMwmEaMHRHjv7wjWl2eXFFwviZvh3jT4yjJiQ==
X-Received: by 2002:a17:906:8548:: with SMTP id h8mr23291205ejy.290.1573490320422;
        Mon, 11 Nov 2019 08:38:40 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:1956:: with SMTP id b22ls2308733eje.15.gmail; Mon,
 11 Nov 2019 08:38:39 -0800 (PST)
X-Received: by 2002:a17:906:1354:: with SMTP id x20mr24100608ejb.131.1573490319756;
        Mon, 11 Nov 2019 08:38:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573490319; cv=none;
        d=google.com; s=arc-20160816;
        b=XKcaIKGFln9SwV9cOMgVTiBoK49q0s7ccKCt5WKmwIHS49fYiWsNYr6nprvFANHS2f
         fM8pxhKY3LrEgxqBZlbvZxaOTvF9yJA4/uZsKhdeQXayFkQK5zfVauKLTrG221D0r/dP
         3CG26TehVCQox6lqSLnlHJJqCTM1HkVzy2g+zQJ+RKw0+oYfFFpEuI7KM/acRCoMEPnK
         vo39QQKmNgKOg7JCqHk6ye3A9RmFlFklImFpmwZrJ0GHaZcCBwsB2jVB9lEotMeN1Jfp
         4JD8MSRnHml7ka4L6sMAtQFrE7y+5Cz66VtJzRHn4rfVCuGhU//moSKUzwLeQz2bRM0K
         5LQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=ywSN4HynHIRuhg4/+mkbxjTjYf1pyoWuM+/COecNjJs=;
        b=iwsB0DqdeWFfbERBgHGOtm1q4hFwdCe4NQO8WlV/dmnEuOPcEv1ZoCjXWlqXWVRt4m
         dMPEpUD8adKELVqGu6ekyIFJHDZV75QA/wMOV239R3Xh66FJiuQJKecI9vfGPlctTJrK
         4L0EHZno+ug9HSHSIXFiesjuatpnUNu5hKquOOC3JZ4rg+Pf7UUcNb0a5AoQNtQFMeEM
         5lvTPeuFYWUH25/PP5Kxc6MrX00CBOkGvoMl0ZQouD7fxS3xzMwCQweT7mEX9z2485JS
         axH7TJWt59Rj6ANIDyqzXFYgFKmblvOoXpwQ5prJjJgcU3GvkGb9ymd/Pai5R7g/rbNY
         JwwA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=temperror (google.com: error in processing during lookup of jan.kiszka@siemens.com: DNS error) smtp.mailfrom=jan.kiszka@siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id z18si1174839edd.5.2019.11.11.08.38.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Nov 2019 08:38:39 -0800 (PST)
Received-SPF: temperror (google.com: error in processing during lookup of jan.kiszka@siemens.com: DNS error) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id xABGcTIf024203
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Nov 2019 17:38:29 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id xABGcSa2030109;
	Mon, 11 Nov 2019 17:38:29 +0100
Subject: Re: [RFC][PATCH 2/3] docs/specs: Add specification of ivshmem device
 revision 2
To: "Michael S. Tsirkin" <mst@redhat.com>,
        =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: liang yan <lyan@suse.com>, Jailhouse <jailhouse-dev@googlegroups.com>,
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
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <ef21ed49-d315-4ee5-716b-096d8af1d79c@siemens.com>
Date: Mon, 11 Nov 2019 17:38:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191111105850-mutt-send-email-mst@kernel.org>
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

On 11.11.19 17:11, Michael S. Tsirkin wrote:
> On Mon, Nov 11, 2019 at 03:27:43PM +0000, Daniel P. Berrang=C3=A9 wrote:
>> On Mon, Nov 11, 2019 at 10:08:20AM -0500, Michael S. Tsirkin wrote:
>>> On Mon, Nov 11, 2019 at 02:59:07PM +0100, Jan Kiszka wrote:
>>>> On 11.11.19 14:45, Michael S. Tsirkin wrote:
>>>>> On Mon, Nov 11, 2019 at 01:57:11PM +0100, Jan Kiszka wrote:
>>>>>> +| Offset | Register               | Content                        =
                      |
>>>>>> +|-------:|:-----------------------|:-------------------------------=
----------------------|
>>>>>> +|    00h | Vendor ID              | 1AF4h                          =
                      |
>>>>>> +|    02h | Device ID              | 1110h                          =
                      |
>>>>>
>>>>> Given it's a virtio vendor ID, please reserve a device ID
>>>>> with the virtio TC.
>>>>
>>>> Yeah, QEMU's IVSHMEM was always using that. I'm happy to make this fin=
ally
>>>> official.
>>>>
>>>
>>> And I guess we will just mark it reserved or something right?
>>> Since at least IVSHMEM 1 isn't a virtio device.
>>> And will you be reusing same ID for IVSHMEM 2 or a new one?
>>
>> 1110h isn't under either of the virtio PCI device ID allowed ranges
>> according to the spec:
>>
>>    "Any PCI device with PCI Vendor ID 0x1AF4, and PCI Device
>>     ID 0x1000 through 0x107F inclusive is a virtio device.
>>     ...
>>     Additionally, devices MAY utilize a Transitional PCI Device
>>     ID range, 0x1000 to 0x103F depending on the device type. "
>>
>> So there's no need to reserve 0x1110h from the virtio spec POV.
>=20
> Well we do have:
>=20
> 	B.3
> 	What Device Number?
> 	Device numbers can be reserved by the OASIS committee: email virtio-dev@=
lists.oasis-open.org to secure
> 	a unique one.
> 	Meanwhile for experimental drivers, use 65535 and work backwards.
>=20
> So it seems it can  in theory conflict at least with experimental virtio =
devices.
>=20
> Really it's messy that people are reusing the virtio vendor ID for
> random stuff - getting a vendor ID is only hard for a hobbyist, any big
> company already has an ID - but if it is a hobbyist and they at least
> register then doesn't cause much harm.

Note that ivshmem came from a research environment. I do know if there=20
was a check for the IDs at the point the code was merged.

That said, I may get a device ID here as well, provided I can explain=20
that not a single "product" will own it, but rather an open specification.

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
jailhouse-dev/ef21ed49-d315-4ee5-716b-096d8af1d79c%40siemens.com.
