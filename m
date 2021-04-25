Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBD4JSWCAMGQEYUNEEMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id AC23836A6A9
	for <lists+jailhouse-dev@lfdr.de>; Sun, 25 Apr 2021 12:29:35 +0200 (CEST)
Received: by mail-ed1-x538.google.com with SMTP id n2-20020a0564025142b02903875396c18bsf2023399edd.14
        for <lists+jailhouse-dev@lfdr.de>; Sun, 25 Apr 2021 03:29:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1619346575; cv=pass;
        d=google.com; s=arc-20160816;
        b=DRCCCb+8atW6XO/qWXWKinj3WvkWJAEUcVg2t7I8mtkzw01Blb3uVkO3z6LIvnY/6D
         YSRh0DFEHwOLUCXbEhz12in6MmkGG1iN0Gilr0pSpxEmNB9sCIqgA2vpDae8xILO1dwX
         6K8cjJcor36xLg4idEtd6uEmPyvIA+8ABs6RPXI1UEpv+jzolRS/Tbr5xdaJuKYkGjjJ
         Wx4/WzsYDvKkIQKps8UpQtEKqtOqd9+YMS5ImFGQNp/pTFPUKpiky7OZ6klC9oF0N2gr
         rk9a6TINV8dMKZKTFD6Z8Dj/B1MxfnowJFKlK1fKQfh+dGSsPunJjVAAmfVkXj8wtllT
         67bw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=hNYO7SGQzzYjiWJriU8KqERBfGxdTxiom6oQYuYkvSs=;
        b=N1yjS7CaBvhoRqLAMQNOnXG6jQj93fur2Cbt1dz7Cg/Kso0RCP0YzaVluGm3s+AuFh
         kxfrFtJ2S9FrGYuuRh04s08sHQ11hYcTFJtShX8/Hs6GgmQnIF1oD3vRj8ejaxIHnBb3
         fwUOQsWa+A3v5mtlfWuT8sPi9sWPEpnsOGdoaGDgM+XVRcbst15hidm4Vj1VB9vo3nWt
         dJmPILpX3Qw51k+Vqx9JlmLl3rjvrUWoi4cjy3l1ygaS2WchZIXoNgvT+UbUlufh6tlP
         KGtdut2oSiz88Cqa0qITa9YYWge5B2aWkY2VI80u3k/VJt4WKgu4mi6d035BVMYQQvme
         AV2g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=AiG30ewq;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hNYO7SGQzzYjiWJriU8KqERBfGxdTxiom6oQYuYkvSs=;
        b=mSGwZhmPEeGZX1d+jJv36q6h751V4muio+XUaRlagn+DN5RpNz6fDeArKkUC5JPRQ9
         zaussK4tocgw6cf15Zd/unVc7oSj427+Z+Fc2JMnLm9PWNoaLz2uIK2bZDyDubzTPQCE
         NumPK8982ZGmlxMVv7w4lc3GJ5xZKwFYXw8Tzb/Q1ZvY1extiXqyOHrdr5JpTzAmKlA8
         PHwfaYVy5Evfly8h172ZSkxXAQ8EqXc+nh9MfHxQcFcwaDaGtHEu3HTrYXAEVlmI6s+p
         85iAIcZZ7WiZIHtiL/JJDF8UBS8A1FjpuiDISN4mdY+pHJ2MfwaRggLZTtV4QlgztY9h
         SHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hNYO7SGQzzYjiWJriU8KqERBfGxdTxiom6oQYuYkvSs=;
        b=i95moV4vTQ1xCyvcFsxD2E3bFyngfnQ7rVtwHL9uybKhhbzshRv5y1RYX7yEzqHtUR
         sHXPaP+UmSwiT4PMkPILGmbqtl1qoXZ087bA036YinLIjiZamPaLmv/wseFUoANRN78d
         k9MBzxJxgYSFtSh2taAiKdRoUomysf78aQh5BNNYmTIJ/fqVf51NAEmmwIOvv/abozO9
         nLw1sB3h9t898F11r9+/iYkcMZW1K97rOz6OIhTMiKwaLPLNkmqpWne+QpMY49ytVPnh
         f4r5hm+s0LsCXoeBUND6iMQI3r7MGS44dAm8NDP4zCKBTlKiW25czRulBUy7HntE2Fy4
         1awA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531GJNdmVfoFLf/fhb4ZNic9cXakcvxyp+sPSYni702TgHgcUuUZ
	G0JcRd45wnK7PtNQl2vfkYw=
X-Google-Smtp-Source: ABdhPJyBG+Ru3pHao0XSt0XtWumpVN+14qdQmJFuMpQWiIB9NLqZ4Kam8Ur9RGVAH8PWPS0DZAg+SA==
X-Received: by 2002:a17:906:49d3:: with SMTP id w19mr13298575ejv.116.1619346575279;
        Sun, 25 Apr 2021 03:29:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:db59:: with SMTP id n25ls4946730edt.1.gmail; Sun, 25 Apr
 2021 03:29:34 -0700 (PDT)
X-Received: by 2002:a05:6402:2061:: with SMTP id bd1mr15073898edb.50.1619346574434;
        Sun, 25 Apr 2021 03:29:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619346574; cv=none;
        d=google.com; s=arc-20160816;
        b=KE9BJSWZrvwM9uEiNvnrO4VxE2YztgsHjPQwH5pTUWc0/RN/yDGhRXE1NuCsM0oq1P
         PrTVtHPZWQ/pcZHA6PYnd60O34X4QzadQYO6EjXlRSUMxyQDpzt5fM5GGfI8B0IRcQi5
         nF2aYInp7KIjp/B47ody0PoLALkHP+kpt5MGI37EriOn8PuXQj8RMokgULQHvVlE4BuH
         7WVf1eb/TxX/y1G2Am0E3ClroduN4HRaywe1dbU8gWq2SzvXfAdaIMc4FuvfmIHEjt7w
         46+jDj7VflTEz25nKgEpvUSvmqlQVsM9cXgphr/1DbklO/DWY7JdRo2pZSvWcOu4aI8b
         aVLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=b+kcdBJZXteZFMtxbdB1EK8Xp5F5fEErTL9lXQ4DxJM=;
        b=xi+g99sYl9/zEjopn2chzaEvkjU578xfK4aLciw4Qpp+eLZIbvmNzWtiPhgS38oWPN
         YH/ZKp228u2EeWAww2VIHQkaOgGqJae4cRlDJJKVskQzd2s5stH9qQmu3AV2roQu7Qh0
         f639fErfaT+BtUUlShEaw3PG5vrQp07qxSa3oI9hiCSOB8ItyHZEQQx8/pMaFJ4nSRhB
         X3yjifCfUkK5GXXm57+SpOE500JOjhfpJ1+k4rDfiFoLvIGvTLAxhVXYAny2eihtWFtM
         i0zi4i1XUryuyJwqxVvCdcOv7Q3UiqPOSp4thc/TZL7x4uRkWIrRorHYBAo4ugJGQ1Dq
         byxQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=AiG30ewq;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id m18si622662edd.5.2021.04.25.03.29.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Apr 2021 03:29:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.53]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LhNnw-1lEnnx2yaO-00mbuc; Sun, 25
 Apr 2021 12:29:33 +0200
Subject: Re: [EXT] AW: AW: Inquiry
To: Moustafa Noufale <moustafa.noufale@uni-rostock.de>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <0631a4941db6453491ffecf6c08b1cf7@uni-rostock.de>
 <61de29b4-45a2-8f3b-5937-5cac7dfc2b21@web.de>
 <879f50f352e14aa8b45e9aff399c2b02@uni-rostock.de>
 <0b2f286b-b5ed-8de9-e0a2-73af9f9cbedf@oth-regensburg.de>
 <aa35f9463dd64b96a3998e9fe84da04a@uni-rostock.de>
 <d6df4ded-1fb9-f75d-1a1b-0cef2513acf9@oth-regensburg.de>
 <857f4a45c58d4a85b336ac6f3028e5be@uni-rostock.de>
 <688b5cc9-6150-dab1-0a0f-a7b5cb8d54cf@web.de>
 <c029ad37ed324934b2e0aa3f05ad1713@uni-rostock.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <34742299-7898-adb3-30b8-760bc4596e92@web.de>
Date: Sun, 25 Apr 2021 12:29:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <c029ad37ed324934b2e0aa3f05ad1713@uni-rostock.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6G97N75cFu3HdiPkWBsXPrN8DZikpCvhFPtlOmgD7whHSKy5GxX
 nGoSq3w0mYIYJPti7hzkqdOH49qdsVO+772PW1lonZ2tAXneQzNcjkVVRDVjMfweizxT24I
 uJv2xNCxqEuyZDFbiGXAWA5nQ69CPnNXtwaPWssYHHrQDKQ6xUwFmWBpYwCfqR0+wiJFPni
 sTTlpwrt6iW9C6gsTyBeA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/lhOX+Oj5zc=:jFIiZxTrolTetTK/1ElT8k
 YdUoZV9J5HEjaC+fU8uL52LvXujttXr0M2/EB6fASbQ2fVXJQUrZ0pXdkYDhcR4VzC1pNlGY2
 tU7gx2xyadGRRNhopgU3VzGTfTZ9LG67xWTJzwSW6yOqI77qmd91c/Y+Eg4yx4VmjfacIZ2CT
 bFhAquKsz4+gbDg1IiJSA6YfrQz6I8xHhahNIyFBZd39kgmnFdId6LIan7NroV/LWuUeZVPOu
 wXD09AYbASRM6l7JUf2Og/huv7gwqyGl8GDofyWVOplMw6HaFfPq4RVvcQaNLTc+lMwGCggdg
 HO71jUuw736Th3qr9t4HK/bQWqbAA0TSmT994Ea1dq3/hWk3JXLE16w9J0FZw8Yp3gR9H6qc0
 +3u+AjA2oq1c1yJ5ruJ1RkuuV43Jz60/jDwOZoiHez3TYLwyH6KxjKUicjzpHyOqwTGQAtyxd
 rCDQVY7GdwJbSUlSHy97b1J0yYN3oFKCnnIu5kH3dtk328NfB3nQR0uU3C+NTTMaHwHQkhx9c
 onNhRKoK7+NNJJyVnTftD2hK4JfMUiBzF+L6PrT9M2QOMZveiYDAfLOMG8i3ODi4YDo6K/u75
 80vLkLLovIGNlX7bMqhmE+OGulLiovxkP/H3VqKAQfVcibY8DsYuf9Ehwp8JKd3uWgxNFi50Z
 Cpqtqp1W1JGDjPyJwBvQsjgAnREu0dsqGDGj1UObnHK07csiRi9xao/h6REEg5s7iuJI1NNDW
 3peL25k+YvQgHOhTTPhnKi9cUEz/2Egrm18jkvnpASv5jyl9Z1USMxbZZsaE5o3wNlXgY6rku
 A34XSUUtg8GByyOeDrfwIfF7I3m5+yyFZ9N57aXF45hfsLtGBrmWkZLBkgD+LHWoaTKRd1XMT
 3flPgCaDgf75h3iDVy6Awld7eghH8vw3wF426TTV0x5Q/V/ylr7KNOMCjI3csm5+HN6DeIlPD
 a7iZ6yM1W8tJD6n18RlMCpfT6x+HB4ztNP2EB8EGKX2GUHbtW70Il8vWHwIWxfjdF8lWFzax1
 f8vraW8z44nvXBDKwFo5bIEo2uK4VBFPrB5xjVJCTpeCO35YHKq5yXZVFw2oHcuOClD5EK4Jd
 o0ZHKaZ3tyM21MGNDB9Ws+zWGOwj8teIOeSCcNQRCZUvKh0edpqjvvwrFuLiQR0UJzUMZVRBU
 58W8WNMQuo98XTZdeidwV+f/Q7JwNF2pTyoN9VwCEyYFLLGGn1UDfK97htEYDhI0OdLfyFrr+
 xQODtYJRTAQEcpHc1d39Kw+hTa2kHG0rssjNcSqjk1Qlsa5u8y4aty0B8QYJHBgnNfrappAXD
 r6vjaFpU
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=AiG30ewq;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 25.04.21 12:20, Moustafa Noufale wrote:
> Hi Mr. Kiszka,
> I have one machine with:
> Intel(R) Core(TM) i7-7700HQ CPU @ 2.80GHz
> The setup is win10-> Ubuntu 20 on VMware and I found this while running l=
scpu:
> Vulnerability Itlb multihit:     KVM: Mitigation: VMX disabled
> Vulnerability L1tf:              Mitigation; PTE Inversion; VMX flush not=
 necessary, SMT disabled
>

VMware does not provide sufficient VT-x virtualization, plus things
would become too slow with three levels of virtualization (VMware -> KVM
-> Jailhouse). Run Linux with KVM natively.

> The other machine has Ubuntu 18.
> Intel(R) Core(TM) i7-7500U CPU @ 2.70GHz
>
> Both have virtualization VT-x.
>
> I think that I do not simply have access to enabling VT-x from Bios setti=
ngs.

Here, Ubuntu is running natively? And you still have VT-x but not APIC
virtualization according to jailhouse hardware check? That would be
extremely weird because it's a CPU from 2016 which has all required
features to my best knowledge.

>
> I am thinking of buying a Pi4 and try Jailhouse on real hardware, would t=
hat be a good idea?

It's an architectural switch (not sure which role the arch plays in your
studies) but you will definitely overcome that host OS issue and have
realistic benchmark numbers.

Jan

>
> Thanks in advance
>
> -----Urspr=C3=BCngliche Nachricht-----
> Von: Jan Kiszka <jan.kiszka@web.de>
> Gesendet: Sonntag, 25. April 2021 12:05
> An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>; Ralf Ramsauer <ra=
lf.ramsauer@oth-regensburg.de>; jailhouse-dev@googlegroups.com
> Betreff: Re: [EXT] AW: AW: Inquiry
>
> On 25.04.21 11:32, Moustafa Noufale wrote:
>> Yes, the machine is working and jailhouse is present in the list of Modu=
les. However, when I run this command:
>> jailhouse enable /etc/jailhouse/qemu-x86.cell I get on the QEMU side "
>> Input/output error"
>>
>> and on the terminal:
>> Initializing Jailhouse hypervisor v0.12 (0-g92db71f2-dirty) on CPU 2
>> Code location: 0xfffffffff0000050 Using x2APIC
>>
>> Then I ran jailhouse hardware check and everything is available, except =
for:
>> "Virtualize APIC access             MISSING"
>>
>
> Also when running on a native Linux host? This is unusual. What CPU do yo=
u have (lscpu)?
>
> Jan
>
>> Then I tried to figure it out with different ways:
>>     sudo modprobe kvm_amd nested=3D1
>>     sudo modprobe kvm_intel enable_apicv=3D1
>>
>> or editing the kvm.conf file, but with testing with the following comman=
d:
>> cat /sys/module/kvm_intel/parameters/nested
>> returns Y and it is okay.
>> cat /sys/module/kvm_intel/parameters/enable_apicv
>> it returns always N.
>>
>> I tried two setups:
>> 1- Ubuntu 20.1 as a VM on Win10 machine.
>> 2- Ubuntu 18 as the main host machine.
>>
>> Thanks in advance
>>
>> -----Urspr=C3=BCngliche Nachricht-----
>> Von: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> Gesendet: Freitag, 23. April 2021 20:40
>> An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>; Jan Kiszka
>> <jan.kiszka@web.de>; jailhouse-dev@googlegroups.com
>> Betreff: Re: [EXT] AW: AW: Inquiry
>>
>> Hi Moustafa,
>>
>> On 23/04/2021 15:04, Moustafa Noufale wrote:
>>> Hello,
>>> I would like to thank you for your support and maybe you can give me a =
little help with building "jailhouse.ko"
>>> I have tried make, make install with and without root in this directory=
 "jailhouse-master/driver" and I am not sure if I am following the correct =
procedure. What I have done so far is building an image of a virtual x-86 t=
hrough running ./build-images.sh and I can start it using ./start-qemu.sh.
>>
>> Okay - so you did build successfully build your target with jailhouse-im=
ages, and start-qemu.sh gives you a running qemu instance?
>>
>> In this case, everything is already installed and in place. The jailhous=
e module will already be loaded - you can check that with `lsmod`.
>>
>> To enable jailhouse, you can simply check the history of you bash, or ha=
ve a look here:
>>
>> https://github.com/siemens/jailhouse-images/blob/master/recipes-core/c
>> ustomizations/files/.bash_history-qemu-amd64
>>
>> HTH,
>>   Ralf
>>
>>> What I have understood from the tutorial is that I have to inject jailh=
ouse.ko into the kernel and then start the guest.
>>> Thanks in advance
>>> Moustafa Noufale
>>>
>>> -----Urspr=C3=BCngliche Nachricht-----
>>> Von: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>> Gesendet: Dienstag, 20. April 2021 11:39
>>> An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>; Jan Kiszka
>>> <jan.kiszka@web.de>; jailhouse-dev@googlegroups.com
>>> Betreff: Re: AW: Inquiry
>>>
>>> Hi,
>>>
>>> On 20/04/2021 11:29, Moustafa Noufale wrote:
>>>> Hi Mr. Kiszka,
>>>> I have tried to  build an image through running "build-images.sh" with=
 and without root access:
>>>>
>>>> without root access:
>>>>
>>>> Select images to build (space-separated index list): 1
>>>> docker: Got permission denied while trying to connect to the Docker da=
emon socket at unix:///var/run/docker.sock: Post http://%2Fvar%2Frun%2Fdock=
er.sock/v1.24/containers/create: dial unix /var/run/docker.sock: connect: p=
ermission denied.
>>>
>>> your local user needs to be in the docker group.
>>>
>>>> See 'docker run --help'.
>>>>
>>>> With root access:
>>>>
>>>> Select images to build (space-separated index list): 1
>>>> Error: Running as root - may break certain recipes.
>>>> Better give a regular user docker access. Set KAS_ALLOW_ROOT=3Dyes to =
override.
>>>
>>> Simply read the error message and follow the instructions: If you want =
to run docker as root, you have to set KAS_ALLOW_ROOT=3Dyes to your environ=
ment. For good reasons: You shouldn't do that as root.
>>>
>>> Anyway, solve the issue by adding your user to the docker group.
>>>
>>>   Ralf
>>>
>>>>
>>>> I have installed QEMU version 5, KVM 2.2 and enabled nested virtualiza=
tion.
>>>> I would really appreciate it, if you could me a hint.
>>>> Thanks in advance,
>>>> Moustafa Noufale
>>>>
>>>> -----Urspr=C3=BCngliche Nachricht-----
>>>> Von: Jan Kiszka <jan.kiszka@web.de>
>>>> Gesendet: Samstag, 17. April 2021 11:45
>>>> An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>;
>>>> jailhouse-dev@googlegroups.com
>>>> Betreff: Re: Inquiry
>>>>
>>>> Hi Moustafa,
>>>>
>>>> On 16.04.21 10:29, Moustafa Noufale wrote:
>>>>>
>>>>> To whom it may concern,
>>>>> I am a Master student in Rostock University and I am studying
>>>>> Jailhouse this semester as a Master project and I would like to
>>>>> gather information about this Hypervisor, as well as I would like
>>>>> to ask, whether it is possible to install it on an Ubuntu Virtual
>>>>> Machine? I just need an outline, how I can learn it. I spent today
>>>>> reading the code on GitHub, but I need more information and appreciat=
e it if you can help me.
>>>>>
>>>>
>>>> A good starting point for experiments can be the images generated by [=
1], both for KVM VMs, pure QEMU emulation target or also real boards.
>>>> Note that emulating target inside a VM will work but using KVM (for x8=
6) may not or is at least fairly slow. I would recommend a native Linux hos=
t.
>>>>
>>>> Then you will find a lot of presentations on Jailhouse on the internet=
 as well as an (aging) tutorial on how to bring it up on new hardware.
>>>>
>>>> Jan
>>>>
>>>> [1] https://github.com/siemens/jailhouse-images
>>>> [2]
>>>> https://events.static.linuxfound.org/sites/events/files/slides/ELCE2
>>>> 0
>>>> 1
>>>> 6-Jailhouse-Tutorial.pdf [2]
>>>> https://www.youtube.com/watch?v=3D7fiJbwmhnRw
>>>>
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/34742299-7898-adb3-30b8-760bc4596e92%40web.de.
