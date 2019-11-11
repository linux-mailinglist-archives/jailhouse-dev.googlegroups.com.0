Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCUDU3XAKGQE7FFE77I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0B0F77F0
	for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Nov 2019 16:43:06 +0100 (CET)
Received: by mail-wr1-x437.google.com with SMTP id m17sf10106838wrn.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Nov 2019 07:43:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1573486986; cv=pass;
        d=google.com; s=arc-20160816;
        b=apEESqbJ2i39ZQpy2xl8nFYGzcQhR7P4zFpXdmrjLASn/fa/lBUdpWntP9aC8tF9+V
         XToIsgJo4U5CiHvvO+jUO9VjTYA8QxmeY3/U84uGqn8fQRYPCkkbIxlz7WyPyjlQDCED
         z5i0rdToXysWgVcMgoRQOFznbOiiUdXG0vHLxp0zuf444O2w32BP1SyKuFJfhHpnsO3F
         EscJ9/AimyWFOlpNJhH6nFXW9YCaw+gw7nTnf04SnwUwX8R8ShwE9A/Wp0av496KrN5+
         nujgLevG6aIEC/fFCWU1sBojfvLBU7HuoyulE27IZ4zL8BfdmBMyE9UVGmX7BVsq0hCB
         skEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=IWa4ZN/LtIT58eang8LjUflVfl4Dr+lidL40mU3oUp8=;
        b=RHjsG6PUvP1ZjC2MYtSIeBmzEOdjIC+rh6uJHG4OlDwhThnnOACBX0MJIQGPsexeZC
         A3/HpiWoEvwf6UevzK98MfMuW809O15ccq6M+kz0ZlWXSxUOFpkRuBvgVHpX6HXQz/6Q
         TDepgcGRZs6WTzTZ2oGoHgcvQGw5nnCRkQXveyxRp/Uv4jolgI50nTS0jPg4/j9RERSU
         XT0BrqjRWkLXo+K6dPXWB+oVWIOF4Ne/Zm3lo5qd/tXr4T5z6RUV1q/QjvJaV4aGeNAP
         7gwlOCSMFNOMsq7f/TxfGh8paiuRvmDgCzC6ujLeci5Cp4xA6tXQDLJmIRRP1/0mueiS
         Wsfw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=temperror (google.com: error in processing during lookup of jan.kiszka@siemens.com: DNS error) smtp.mailfrom=jan.kiszka@siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IWa4ZN/LtIT58eang8LjUflVfl4Dr+lidL40mU3oUp8=;
        b=m+euCjF6lklsuXF1KgQZNYq/fGqbtlt/skgbr8yhw0VpfCHbUspsyUEu8hQr6W7Ney
         KnVXXNKRTyKmlsq8HxyPFzZQ3bDTL0DIGidemhjmZaWyNHhokECJEw2iE7EZ6aO4la8+
         N48fqCqqBrdxrKhCVZe8gVvf3xdbwiURq73rE2HrwY0smFKKvAO+iyeXtSBIS5Gih097
         77l+MNHJVFh0Bz8iufQ7quCKz4uq5lXfWSndDL3ML4T+C4yJ6xcEz4GgcVUAUxrckPij
         Q0+XJG/0h+OBQX/s9k7CRz8NHiTiAsiX+9Ima+dVRkR+SPYOkholLJ3LWvTeZubOSMzM
         I1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IWa4ZN/LtIT58eang8LjUflVfl4Dr+lidL40mU3oUp8=;
        b=XJBQoGEOLDmFi8dxahxwMps5UxruSOWXWXUPE00ZXUcokKu/8ZFxYNCD0HaNkvrs5F
         A1cOyysjkb4mWzD3BdE8TwN8apVdN++3bCzCMyEWaPl8LWUOLOxaAIrHNZEC0CjNFYGP
         9JxpC077aKXTVKYlBtuH6JBYqOfLEK86G+0hzVybf6jswnPtk351+r2wsxRFNdpcJG/7
         hMOSdg5Yc7ELxLTQ9D0L+Y2pvH+v4HjdWiZ8n7lWcPVncVOFX2HU8n3sPuD5OOStmjwg
         CLRyidPBx60Ik5IhW4yRg9HEaSFWudO/1Vpw7MQ11NnfEW18/P+AeVRal45Q7YRjR+1a
         TAMw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVbjN8+E6MzfRzdaSCgkGQIzMlOPTkE5763txCP7qkQJbwUPTKK
	2XI6Zjsco3vIodrVNFibF7s=
X-Google-Smtp-Source: APXvYqyqYr5FS7IuEd9sEJisX0ePJFFH/GTJ/D2beLK+I8fFKlFx2iQsbjIjpmO+uXLL2RPaRe+V3A==
X-Received: by 2002:a5d:62cd:: with SMTP id o13mr22465890wrv.367.1573486986198;
        Mon, 11 Nov 2019 07:43:06 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:480b:: with SMTP id l11ls3077790wrq.2.gmail; Mon, 11 Nov
 2019 07:43:05 -0800 (PST)
X-Received: by 2002:a5d:6350:: with SMTP id b16mr6425438wrw.357.1573486985540;
        Mon, 11 Nov 2019 07:43:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573486985; cv=none;
        d=google.com; s=arc-20160816;
        b=DFGJGlsYusdRcDr6W3E0kqOu03UvWEbq/TmrUpa1kAb7FQT53X5LYm9REaMNWFbvUR
         5mcWSkzrDf9y9y+T9AYT5xBvPZNYTnmG5pf0vbTAZCotoTHPach8YqQtCZ+Lu4LGgC9Q
         8ad6hYvhhHomi56H8XbvZE69Ps9LOpGUW1K3Xg+U8rjv1tkeqxkaQ4c5qVI5i/4A/E3r
         zi6C9qfs0coDG/Y+LSZBXN1Zb7WmTJ8my0326ulLX8esyg1+zcmc/l6HwkIEXh8JK1+v
         KzAsCHs7NoQxcqm5xZA0dqJVjHRPTowM57f9DBzShFnCWMhqxBk+49984Ql2rQmkk9fw
         rfTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=9bqjA8Si+l8tFgJSiHRCWrVKQvJjNvMKHp/FACNFYbw=;
        b=KdHAT5n/elRMmiRo6OQtgUsmQOmNrxxwhN3rPg3kjt7OeMURX72JmcfetbGQ698FN7
         RSMmpryQ+lkZ0cMk2REHOw3Rg+41mpiWYg3d2wXnqlljLsZe15suQhUyd/mz4EI2k9Hy
         lpJRgh7t+KmDH2mpkMYOaALoo2Ll+NYIxXrf+zl3XshVV4RjLfBYBmyxmKCRXoNChLWt
         MFhQwh0dsLoDzqQTmUpV+1zuHEmuAbTBIB6jIhiHwZkLshtd9qUSPrnkVylTRb2wjH6/
         8IPul4qFPWqgcZWBK3BAW6gWfKPA3vPK60F0DppejpLvI6MO7V5KHa8z15cZksszEBIj
         jr9g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=temperror (google.com: error in processing during lookup of jan.kiszka@siemens.com: DNS error) smtp.mailfrom=jan.kiszka@siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id x2si949436wrv.1.2019.11.11.07.43.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Nov 2019 07:43:05 -0800 (PST)
Received-SPF: temperror (google.com: error in processing during lookup of jan.kiszka@siemens.com: DNS error) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id xABFgraZ018869
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Nov 2019 16:42:53 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id xABFgqFU001458;
	Mon, 11 Nov 2019 16:42:52 +0100
Subject: Re: [RFC][PATCH 2/3] docs/specs: Add specification of ivshmem device
 revision 2
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>
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
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <129c527c-1e61-8c0c-3ca1-fe93e26c8bd2@siemens.com>
Date: Mon, 11 Nov 2019 16:42:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191111152743.GM814211@redhat.com>
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

On 11.11.19 16:27, Daniel P. Berrang=C3=A9 wrote:
> On Mon, Nov 11, 2019 at 10:08:20AM -0500, Michael S. Tsirkin wrote:
>> On Mon, Nov 11, 2019 at 02:59:07PM +0100, Jan Kiszka wrote:
>>> On 11.11.19 14:45, Michael S. Tsirkin wrote:
>>>> On Mon, Nov 11, 2019 at 01:57:11PM +0100, Jan Kiszka wrote:
>>>>> +| Offset | Register               | Content                         =
                     |
>>>>> +|-------:|:-----------------------|:--------------------------------=
---------------------|
>>>>> +|    00h | Vendor ID              | 1AF4h                           =
                     |
>>>>> +|    02h | Device ID              | 1110h                           =
                     |
>>>>
>>>> Given it's a virtio vendor ID, please reserve a device ID
>>>> with the virtio TC.
>>>
>>> Yeah, QEMU's IVSHMEM was always using that. I'm happy to make this fina=
lly
>>> official.
>>>
>>
>> And I guess we will just mark it reserved or something right?
>> Since at least IVSHMEM 1 isn't a virtio device.
>> And will you be reusing same ID for IVSHMEM 2 or a new one?
>=20
> 1110h isn't under either of the virtio PCI device ID allowed ranges
> according to the spec:
>=20
>    "Any PCI device with PCI Vendor ID 0x1AF4, and PCI Device
>     ID 0x1000 through 0x107F inclusive is a virtio device.
>     ...
>     Additionally, devices MAY utilize a Transitional PCI Device
>     ID range, 0x1000 to 0x103F depending on the device type. "
>=20
> So there's no need to reserve 0x1110h from the virtio spec POV.

Indeed.

>=20
> I have, however, ensured it is assigned to ivshmem from POV of
> Red Hat's own internal tracking of allocated device IDs, under
> its vendor ID.
>=20
> If ivshmem 2 is now a virtio device, then it is a good thing that
> it will get a new/different PCI device ID, to show that it is not
> compatible with the old device impl.

At this stage, it is just a PCI device that may be used in combination=20
with virtio (stacked on top), but it is not designed like a normal=20
virtio (PCI) device. That's because it lacks many properties of regular=20
virtio devices, like queues.

So, if such a device could be come part of the virtio spec, it would be=20
separate from the rest, and having an ID from the regular range would=20
likely not be helpful in this regard.

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
jailhouse-dev/129c527c-1e61-8c0c-3ca1-fe93e26c8bd2%40siemens.com.
