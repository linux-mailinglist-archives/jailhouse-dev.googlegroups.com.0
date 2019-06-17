Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBH7LTXUAKGQEXQHYVPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 003924804A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 13:12:31 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id u13sf1083264lfg.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 04:12:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560769951; cv=pass;
        d=google.com; s=arc-20160816;
        b=gcxwwNTpxHX7573gogZkP0AO3SKGYBBvMTunWPF8wpdZIKXU+BRCVZuwjOn9yOjcy/
         EVZcgxmRpXDBbn3BIfNTpno0jZK5XC1KJBa7QaC8GIXZWqwTRhhsqpsVWTY9VJxWyIAR
         Ui9mJVmkde/+ewCRMPz/p7Tz7E80VwyOWm3TiUugEqkK3fDc5NJx6wqnjGmuuBAEd6Xu
         DYXh9ZTG5neV+2r3VGbqZ1yfglN3TeBrVyYXT2VdeBW1HbgeeFQc6NbJWXgD8FaU53vf
         ODbYO55KhpSCEzPXYLF0F+ZBw+ekLiQO2c6e4m3xU7NndIkduP/yJsXZrP4MafOBC0eu
         SwDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=6RRsHd3yok378fCaQh4wupA4lja/i/XMDa+Ekawh5as=;
        b=S4Z56wyVupd86X2HalTgTP3gIk4Q6AffE+Dq4nqXVWliw/uc3jYkTPMYRXciQPMNsZ
         kqVF5hAGcwLWKDmvXrV2klKyuFGANTJmRLcggdFZfEMo991ld0vflMBRX8D/gIKIeD57
         mOrMS0DRiVEPxjEkYGg1xPccTJnsURgY0VNCVRN+UE2PW7y385xXv1hI8S1tynu4EH0m
         4S7gQG8/mSegor+Br5jnioHanNElzbhdLNi07Ib3ih5rk20f2+galZGj+ytB1OcvaEGV
         cI81V93V25U0vzgQkK7zQhiv0s1zHwkaMYS7YKfHY6gktClLEJywT9Q6ykOOfYzNlZx8
         RUnw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=drphDwru;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6RRsHd3yok378fCaQh4wupA4lja/i/XMDa+Ekawh5as=;
        b=hmTtDyidPIJ96yy4baWQyrA/RbkCKte4imvYTKxFHLS9+Ip8RTomnyeFZV4CO4Lwji
         TrubkF+y5cHnV5XjA+iB+m6SItNZRtF7t9anO2VwSD+JHrDW6ieX3visBQ5PH1nBJh2J
         HVxEOBfEzlT9uTDNvFJQogc39MBQzwdILF3pAh5m8lXpKnzpdh6jMEZ+OUXmvo5KEOF4
         mAADy+6wsMQOSzqVuFe5tibYLGN7zdPlqDh7WdYM3GQsDaN1n6hE5F6iL6WKG+9BnBHl
         Rz3wGLKRCjrbwQ5jVOb8e7thYpLKcCO7xKmzYuUYHiZIFpa14jjSp9kED+htilo0gd2z
         PHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6RRsHd3yok378fCaQh4wupA4lja/i/XMDa+Ekawh5as=;
        b=Y37z4OU6jFT3M/CZiL1yb+tgGsO9/xdg0O6obnUJlQVhOyMRXkrvYVljPujdK1xdmD
         wlmLfNL7K6Dx9Bl2Wqdbcngy4IPCgiAoeMauZ7MwkqJS/leHSM8ueBu6BqqDLpEWJX4z
         80WwD/8BMmWc/jp5/OHTzCuIXe5VoVll9D6OnNhu6RLE5msqew2fBY84yEw5jr71cy3w
         emC8Rkl5qa/kBXrJHiQzF8bMcjRJyKEymR/C1dTQXCGs/FpA1FjojLpeTCbspPdyA1Y/
         /ExzlX2HrdhnNJiiBIphJeybWXgUBLqdfF+E5I4wnHq7ykD6TU0iEfFyloOlY81WK9LN
         VX+A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXDcw4SorSpsY5+T0B9F3ZhbeXXmo3p/WUD4rhG35q//hRfow1g
	U1LPQd3d2Xnuor0y2eDumdM=
X-Google-Smtp-Source: APXvYqzG+wSb6g+4jmOQlCtG5RWTfBeyoZkxjmHyK0NAUNKb+uqFsHd9DpOoKa3Y3qgcBZDAPnWVSw==
X-Received: by 2002:a2e:81d8:: with SMTP id s24mr7876664ljg.37.1560769951580;
        Mon, 17 Jun 2019 04:12:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:53a8:: with SMTP id j8ls1377237lfh.11.gmail; Mon, 17 Jun
 2019 04:12:31 -0700 (PDT)
X-Received: by 2002:a19:ca0e:: with SMTP id a14mr30005996lfg.19.1560769951085;
        Mon, 17 Jun 2019 04:12:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560769951; cv=none;
        d=google.com; s=arc-20160816;
        b=G8eXP8iR5QtL3mOlj9cdmUVueytMdPvNucH6kFxiQ0hXkaQo4w0LrPGkGScU0TrPmt
         zS53nq/rkIl17sPBAJEXXxB8IzbqoGtksgezslvK8q7iTfHeOZvuKc6jCv3HPjMBqUbQ
         Ta2tvVEowhdE48p3MTRWQK9708+9YdiSPmEn1/2jmXIC5q5G/pljhsTW196wgGIyzwYD
         MMQQuvd4GEH6/RtMo/YQF7Zu1WcOjWNUmhiwbxb8Cay5zLa9HCmz16aeJMaK2k+Q+c6+
         wHwYLqd+s9GUTmhFMU7GMmH6f1yw7H8PIv3+N53tpZj4Qud1miIvXqxaQdh/pVP8kPT0
         F9jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=Qxj/5MOE5HJZwkemlMCuM3nUCrFH5k0Zgp9wJ6yUMxs=;
        b=iglEIliJYyyQcfXpXy10zuVf+Dlb7xKS8hxQTvTd5hEdOwvR3w2gOCYrIyWPpy0awg
         yYExT/9I6BVbGS3MspGldIF/fpu+NocsiLtOPf5E/Ga+6LiNuOYq1FqqLcmUeicnnCp3
         pgArLBAoTHCD7BgJoi5GT+wSpLzxWRcs0NCQWsR11/vOCV2B9drGMYR2h1dtvMUQw6mk
         JK8NghPtk89nPW5E/jL2d2LN1sIO+LagBwYLVUdtrQ8ut/YGBeQhyCVCc+ZxtWyWMob5
         yzd1vnMGVrpkJVQearE3psnZYL+/8luYTvtASvhHFUFVgqi2O0sZPwauL7vAp+C8peHm
         Uzeg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=drphDwru;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id h11si723561lja.0.2019.06.17.04.12.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 04:12:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [139.25.68.37] ([95.157.54.22]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MSJGB-1i4VjK3OTT-00TSfu; Mon, 17
 Jun 2019 13:12:29 +0200
Subject: Re: [PATCH] x86: amd: fix comment in MSR bitmap
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com,
 Valentine Sinitsyn <valentine.sinitsyn@gmail.com>
References: <20190510131037.18590-1-ralf.ramsauer@oth-regensburg.de>
 <536d98a0-cb55-1726-3ff3-d7de6d5cea46@web.de>
 <a619821a-ff26-d13e-ab57-2511b839ab00@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <9e726c1a-3870-5112-24d5-3ffd59af1f4b@web.de>
Date: Mon, 17 Jun 2019 13:12:26 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <a619821a-ff26-d13e-ab57-2511b839ab00@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YSA3JyicxoSBbZGBURnGeNicW+0E0yu029ZfLpD4kiMQTq2mGKW
 RrlbErBAHZBysEMMa5z5KLpjOjWf2XH7e/2W5hbLDdNlcweArlAWjwFTP874PqMqVxJgxzv
 l5SJj2DVjCHY8yCWMs8FnusYzc23MTPzH/sakNph8fgl/j2v4NCg/zUM1uvywLHO6fhHGka
 PbRpua7YsZ7QH/05MhbrQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VDlOFEqT7qw=:Vbo8O9EcCbszUOInrbFK+f
 jXGGiWKebtsL4On+7mhwTrOEDXnc+FffEaOVJSr8y7ZivVsOvo9DFIDsF/7/mz676rmpSTPwq
 tkDuoEACNlrx/c4l2aTOWVDuPI6vh/mmEzdXGa2/Ju6CHag33UreYGuCuwe7ORLOVz2n+Fygp
 gdHEezC1RpMl6a+tfJkWYghoCgOJCjwEBIWfNYyae01IL1p99oNwS5fGN6KLBsTtpUTmsVI0y
 VyQF3TBhJyYGZp9bmpO7z+NWXJgSGD+FHXQbTRsUPFKmHTP3v7csuBkrnsKgofWS6/0wReRRc
 zet1aGRrJ4gPbDLKNWGGBXoC/8aEKWtlI3A1dhG7agRlkNptDn9uheAsA68rdB/pf2vF0hYay
 r4Sxdp5mTTKz59LjTmaQ3ITIlmSjmGzxehcZdlM6puWjiXUNymejgUqLpYaYhlDKvBOQUbW98
 9wloEuYwjQiBIAblGScUa4jE7kjmXR90Jhk0NW8Uen2H1KpeN4osduhW8Dbh9Y/3WzPb+hjT1
 16AK6WBTwstu2KMTTj9rxsMQ4PDUGCRMlYc2DG6unKVJBj4eywvG84hLFMCojHsvbUDwpGwgr
 wOJvhkacpuNYzGSTPQFTF9caI7ZO6EToOYuZJE3ShnXU0ZLSgbvqxlu+NG9Xbb44dWMQiQWbu
 TLe0k4cHdCIjD7y3+eFxGcux1RDama3fCwDx/NJ1k3luJoCa3k/9kRk3ilu3SHrdXv+y04n//
 0AM6CYE7ySNYB0Qm88yHwm4Mt8t5bG0iBKA2xzGbceA9PRlGoIyh+fVBEgGnPeNZYlsRYrNNV
 V3jEecFDPsjHYCID1cUpovXWeByhaqCwPp93G7uKSeJHF9kNidhSLoCBeG1HxMu8ytOLan+ZL
 gUsiQVaPBVnnOUBPDUwA082QxeIAJrWb5UA6n3ND/u2bZM0FjsidZ0rgWp3hAFOiiD9L0/Iqv
 eP4v497fFK3d65b5uTo+V5kwP45eJ0JNJSbkkYcOZYS9YJKLl2HvN
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=drphDwru;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 17.06.19 13:05, Ralf Ramsauer wrote:
> Hi,
>
> On 5/12/19 9:44 AM, Jan Kiszka wrote:
>> On 10.05.19 15:10, Ralf Ramsauer wrote:
>>> Writes to MSR 0x803 are intercepted, and not reads (as the comment
>>> stated).
>>>
>>> The correctness of the rest of the list was checked with a short helper
>>> tool.
>>>
>>> There's also a read-intercepted area that can be zipped.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>> ---
>>>  =C2=A0 hypervisor/arch/x86/svm.c | 9 ++-------
>>>  =C2=A0 1 file changed, 2 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/hypervisor/arch/x86/svm.c b/hypervisor/arch/x86/svm.c
>>> index 9c3e971b..60d236be 100644
>>> --- a/hypervisor/arch/x86/svm.c
>>> +++ b/hypervisor/arch/x86/svm.c
>>> @@ -64,16 +64,11 @@ static u8 __attribute__((aligned(PAGE_SIZE)))
>>> msrpm[][0x2000/4] =3D {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x2fc/4=
 ...=C2=A0 0x2ff/4 ] =3D 0x80, /* 0x2ff (w) */
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x300/4=
 ...=C2=A0 0x7ff/4 ] =3D 0,
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* x2APIC MSRs =
- emulated if not present */
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x800/4 ...=C2=A0 0=
x803/4 ] =3D 0x90, /* 0x802 (r), 0x803 (r) */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x800/4 ...=C2=A0 0=
x803/4 ] =3D 0x90, /* 0x802 (r), 0x803 (w) */
>>
>> Then we rather have a bug here: 0x802 and 0x803 are both read-only
>> registers. We
>> actually want to intercept 0x803 reads, in order to map them on xAPIC
>> reads. And
>> writes just simple be allowed as they will cause #GP then.
>
> Doesn't make any difference. All things still behave as before.
>
> In addition to s/0x90/0x50/, I instrumented all x2apic msr read/write
> handlers. Turns out that we never hit the erroneous 0x803 case: Linux
> won't use MSR access, as it (of course) doesn't see an x2apic. AMDs
> don't have x2apics. So the bug never appeared in the root-cell.
>
> Only non-root inmates use the emulated x2apic interface. But demo
> inmates never issue 0x803.
>
> Nevertheless, the bitmap should of course be fixed.

Thanks! Then please send an updated patch.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9e726c1a-3870-5112-24d5-3ffd59af1f4b%40web.de.
For more options, visit https://groups.google.com/d/optout.
