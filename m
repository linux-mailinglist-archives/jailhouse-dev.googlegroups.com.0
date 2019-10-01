Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYUAZ3WAKGQEQF3EDHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id CF058C3A98
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Oct 2019 18:35:47 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id y12sf4257132ljc.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 01 Oct 2019 09:35:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569947747; cv=pass;
        d=google.com; s=arc-20160816;
        b=P1IMRr3u/PzbRN6DqG1AuSZAko8iR7zSZDeB4s7b4Vt3dqyuk0sYj1OuKW4DYGfjpf
         kLMf9zWUmmgIv8j0unK1wrJXdLQDDJYKUwxY31ZQouC3/sg6HAx/Heaw9Cl4MYXETIoj
         8Bvx1WXvscYFKF99tBDLIBpxjXXAcACuYYUhaTbF1mdRLB760tm6lyyOn6eU9i6d3tyn
         LFBi6nkcbmH+Z5bKP30XhgDA9CfgqfIYnPAV2uuVk8ZLI4FJRvAEGIlZ0lDfDkuKzrSm
         SWbW6UBwn/r8VAuULd7Z0+Lyh6YeQb5r3cyOhZgnhYa7rcMMzHnyC6OMlkkjegmOJOpb
         BYRQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=TYSEQ1hV08qui80LPZiUbMQRO6m7+CR3tD4VRGd9cS4=;
        b=EBwTouJ85ISSiPkIk9cd32Tw5/5Yg6U7fYukoywDwPjLcltmG8WmyJey9+x8jFTe/H
         s3GkVS98wbExiPtNucV4Sxb8TGJTrdPR0lbBM1foJaefWEvmYoUeeuaHk+5K/V+DSBNS
         D2f337JnlpW4TtW6OimeExW7ngSXeruSpiblvjJXjcD/nOTolpgO2fGQEXI8OGwr+VJG
         FjZOPFNMXWLGSSN6WhTFlZyU2zFUOoDkK6TJ9GyhcIHJddfIntta7lCDNwaMKtkVvXD4
         5OPUAMSnOSnJsK225QJZ3KtVCTv9nuBL1lfr+PJaYeffsnelyEAQtxNTRQswkEAT+j54
         F2bQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=TYSEQ1hV08qui80LPZiUbMQRO6m7+CR3tD4VRGd9cS4=;
        b=F23mfVbaMWlCQ+ZtNdaR59XlyYx84HRwNsqVtphGrWuaHkIsMafJ9VXLO10WcGRtXC
         dsB0Ieb/+7QSEIReOxbUNXrJi2h3CrYjYAf+yd4gbWHrSzJsIC8xw9EIvN6rMkj6q57m
         V9XEc7ZLZ3C/GSTiW+fJ/LqKIIlhF1zAK7KDVTQ6rNc1uM6ApF1FqVmfCpgukQE91qxk
         i9RqyPQjyuPCXxJRvveRqDQiI7Kwwn7dfxzsqTAgmSBP9X1sh3z6D4zrKzfSGPx6IN4g
         o17VQzC5bZBTBlC79Lc0U8Mt2+3V4bXi6pw/FUSRaHdPxQuQKEtzKMEP8XnlYbpdGhZs
         2ckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=TYSEQ1hV08qui80LPZiUbMQRO6m7+CR3tD4VRGd9cS4=;
        b=R3/M0HAolPHrh3RylD5WLt62dKAcrdKfz0MQNHvOsSkYpYUlcvwgqmiGejLiy9MuWw
         TN7whUH8JZyzFb+fJlUnm3h4N2JUPhsZuhimDI2YiS7kC9LCsq1EzmmcIJN+XgcdmNSY
         uWxbb52lFadEgIf/Oz4xfn2Tk+6M9ncRsCQJpYJpA4shC2IjEuWpc+6X4yOUhNnY5Uvy
         gilYNWpYdH/gOr+SxnyWY5hMQzkdRUG2T41/9Hee63wVIyc2PitlTIzAD5baY7b+YajX
         tzmrP2I2PnKsDTNj/PMnc7CR0s+x13TErpuYf44uIPj1spkXNf89A4NeCtlZrZWuBBZB
         5Dpw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWgehQ68J+FkCLJZ+gWbGL1v+J+mvTYQf6/Y+GWODvYhmiK+zcx
	nMxiWiUbcXofzTUkwXBQXgc=
X-Google-Smtp-Source: APXvYqx4XJvuRcdYLmD5jyXrzUyt4yy8oIbHRZD7MwK5NbDjFNj5vy+LJiW1AZYjJTOM8amz7seJ1w==
X-Received: by 2002:ac2:5633:: with SMTP id b19mr15415342lff.103.1569947747437;
        Tue, 01 Oct 2019 09:35:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9786:: with SMTP id y6ls2112576lji.3.gmail; Tue, 01 Oct
 2019 09:35:46 -0700 (PDT)
X-Received: by 2002:a2e:3808:: with SMTP id f8mr16361304lja.7.1569947746285;
        Tue, 01 Oct 2019 09:35:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569947746; cv=none;
        d=google.com; s=arc-20160816;
        b=PlZalFoxFZ0uo7VW5N9c1/nk3oH4G4lDrrSh0qrazz8GrqqvPtxxBcEM0udl9c9MAg
         MwYdoO82SiNxFkE2vlDfKDGFUywQKlMF7Nr6ZckzXozi0Ub5C23JwrLVhP5zsbLhQGn4
         L3IVpvqbs86ISc2lQw7BN6kfTB4UFoT9D3wY9uFB3Qm6Q5Oclh9JPlxzLO/e0UgIMZRC
         S/ZtuWmfyCw+m28/uszglnxXSJr8KcbtqPOEFd+nohjMtnHl1568ZcXjCyRNPiQKYIfD
         aBM8WekXUMHKHl6g2EMSt8kLC40cp+XxaafKJAfMHbJxRdst4P7F+EdTT5dZH4GhE/mN
         oh4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=InksuQTMuFuy9Fleahp7miKoEZoqSErSAFhgWWqZXOk=;
        b=oX+DkH8cvOwoBB3ROBeuIgS4xaikAEjfYVLCDiM72rbWg8J4PYCkP/udpOAKhEuhX5
         M06C4ZO1nBUnYi/DEZpR+w8zX4xzLE3ZPLcwst8ZHIfCNI+El/6XzI7V3GEmWgp+cmcx
         iXRWFZwXMT/sTZpfKEceiG4AZsBjmL6y9jdawGUkfWMwky/Q8wl6GmY1730p0qfghbMW
         KXXEAM6AWrA3SEN6wKW8kaAFjCmzJlGQr38bIEqkE0w3K99FJ5zVuxc86vG1EgPVXNP+
         vdYREfpeOT2qyLncqjGcLzGVmhckPLL0JE2g7QOpI5Dx4goIY87pBI/oCcj+ZfATumCN
         hCXg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id c8si1158407lfm.4.2019.10.01.09.35.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 09:35:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x91GZji3030581
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Oct 2019 18:35:45 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x91GZjbS025735;
	Tue, 1 Oct 2019 18:35:45 +0200
Subject: Re: [PATCH] configs: Fix qemu-x86 /wrt VGA access window
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <180104b9-95a8-3c54-211b-65d18da70d49@siemens.com>
 <9b69ab87-55e4-99ef-7138-6e0d2a2d35f0@oth-regensburg.de>
 <2b2842a9-bda0-3fc5-e390-d05e1730b591@siemens.com>
 <9077da45-416c-e814-6cac-2ad331806ae7@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <51aa4de8-0f46-3fb9-5559-945445ef81e6@siemens.com>
Date: Tue, 1 Oct 2019 18:35:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9077da45-416c-e814-6cac-2ad331806ae7@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 01.10.19 18:18, Ralf Ramsauer wrote:
>=20
>=20
> On 10/1/19 5:28 PM, Jan Kiszka wrote:
>> On 01.10.19 17:09, Ralf Ramsauer wrote:
>>>
>>> On 9/19/19 4:11 PM, Jan Kiszka wrote:
>>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>>
>>>> Copy&paste mistake, other target were correctly set to a size of 0x30.
>>>>
>>>> Fixes: 654594bc0be7 ("x86: pio: use a whitelist instead of a
>>>> permission bitmap")
>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>> ---
>>>>  =C2=A0 configs/x86/qemu-x86.c | 2 +-
>>>>  =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
>>>> index f9877a21..03768f12 100644
>>>> --- a/configs/x86/qemu-x86.c
>>>> +++ b/configs/x86/qemu-x86.c
>>>> @@ -205,7 +205,7 @@ struct {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PIO_RANGE(0x70=
, 0x2), /* rtc */
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PIO_RANGE(0x1c=
e, 0x3), /* vbe */
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PIO_RANGE(0x2f=
8, 0x8), /* serial2 */
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PIO_RANGE(0x3b0, 0x8), /* =
VGA */
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PIO_RANGE(0x3b0, 0x30), /*=
 VGA */
>>>
>>> /proc/ioports of Qemu 4.1.0 reports that vga is from 0x3c0-0x3df. Is
>>> that correct or do we really need 3b0-3df?
>>>
>>
>> The "hardware" provides this:
>>
>> (qemu) info mtree
>> ...
>> address-space: I/O
>>  =C2=A0 0000000000000000-000000000000ffff (prio 0, i/o): io
>>  =C2=A0=C2=A0=C2=A0 ...
>>  =C2=A0=C2=A0=C2=A0 00000000000003b4-00000000000003b5 (prio 0, i/o): vga
>>  =C2=A0=C2=A0=C2=A0 00000000000003ba-00000000000003ba (prio 0, i/o): vga
>>  =C2=A0=C2=A0=C2=A0 00000000000003c0-00000000000003cf (prio 0, i/o): vga
>>  =C2=A0=C2=A0=C2=A0 00000000000003d4-00000000000003d5 (prio 0, i/o): vga
>>  =C2=A0=C2=A0=C2=A0 00000000000003da-00000000000003da (prio 0, i/o): vga
>>
>> The 0x3bx range is for text console IIRC. So, yes, we can further refine
>> but should not exclude that part.
>=20
> The actual reason why I ask is the PIO parser. If we should either rely
> on /proc/ioports, or statically permit the window 0x3b0-0x3df.
>=20
> And if we rely on /proc/ioports, then 0x3c0-0x3df should actually be
> enough. Just tested in qemu: no crashes so far (w/o X).

Well, I do have X here, and I can test that later. It may also depend on if=
 you=20
are using framebuffer for the console or not.

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
jailhouse-dev/51aa4de8-0f46-3fb9-5559-945445ef81e6%40siemens.com.
