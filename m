Return-Path: <jailhouse-dev+bncBCY2BFVMXUPBBZU35X7AKGQEADHJ47A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x63c.google.com (mail-pl1-x63c.google.com [IPv6:2607:f8b0:4864:20::63c])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7652DD176
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Dec 2020 13:24:07 +0100 (CET)
Received: by mail-pl1-x63c.google.com with SMTP id 1sf15308993plb.4
        for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Dec 2020 04:24:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1608207846; cv=pass;
        d=google.com; s=arc-20160816;
        b=0iNaUwxRbhIZ7ilamKOEHD013hrP7ecwXjVrSMM4rIJZz5FAsf6x4LmiWbRE7IS0br
         XOp8Xd7mvYEUx2LfQinThCAVTEftYFEU2ibTNvZlI4wcjRD/m1CRAZHeaCjvi79vludw
         FFYh9iRIbFMm4TOtZKM0rjRGoJ4oLurG2xIUQWbJOefXfKjplY7yRFYOhxzgEn1J2PZD
         BWIu8aYxzahiWdXI7Qqd068aA5RpWUHPl30d0akiJ+UVIui1jP0V1HyK87NeKc/E4Ucp
         XqDzth0/OcxySAv5q8JpBp5cU3Hxsch83a9fuO/5n71oVWCvbLmCzLPgBhJf4OKocwnw
         oZtA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature
         :dkim-signature;
        bh=IAG2Nd1QFDtd40Eu7HQoxAL1bbMateaDoI07TYnmEdQ=;
        b=cljWh5a7nSuqlJIPnDj+Y613GSL9j/+FzlITef3YNL9aX2NZsSEvfDqRCthWC2p1mI
         I7tddwgipcuDoXn5kxZLfPeL3s5k+r2fc+xRt14zm/ut80jN8jJsihldnmlMKTMJGvph
         yOyAsoe2LUfpJomTspe2OsUdvj4dEsIJKV8NQQrSmdYyCq+eIKfFQqX9xGrdCUPaT/5G
         ijQgIBu3EeFpr1Re6WoP7oows6bX4/Ekuhc8k+2pnzrZIdYgG/yGCiimVd5TkbFYQY+U
         LdTrwzT6wg09m2WW9hH5581BjYTnL/6VI7vN9YC+EQvifibxa6oV7o3jsUd8c//h/2PJ
         vD1A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=OWNHAPW1;
       spf=pass (google.com: domain of fredyzhang2018@gmail.com designates 2607:f8b0:4864:20::634 as permitted sender) smtp.mailfrom=fredyzhang2018@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IAG2Nd1QFDtd40Eu7HQoxAL1bbMateaDoI07TYnmEdQ=;
        b=HHXQk8ycR4qK0nxphgaYvQBIEvtQ5ksLcEfu5WACJLHRWIYI7KcC8+UbhoxtzAzT4I
         V/4TNFSZgpj0w4wZ8C5sKxfZSUSScCIY9zlWWW4RWrQaNewgKB4jiEk8d1TIr0DIhD93
         7mTEnei3/Di+7vWpR8TWdMw+MeBfcZbuD9rqSDvBAgBTvBHV6cZh8GAyduPZCIHtiqpE
         M7z8yDicixcYex2DATk1W2OH1rLQvenCdp3BmyP++a1N1WnGHEVdcd+smcGPbhTKJjbg
         T077dCvQf8wUvGMVLJCGmuwyzNAd6Q5d/qsvq9Wg15txi9Nd/xYE4daQmqKCwwDwAQeO
         Welg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IAG2Nd1QFDtd40Eu7HQoxAL1bbMateaDoI07TYnmEdQ=;
        b=fnM+WC6Y1Jukso3dY9y3WF7Pxssv1WcEzZ7lMDTX7dimkI5A5A9RwrGIbbcw0b9+bS
         rSBCvtpU22VqsSUC18+boVGNLDyqjwUF74xLEscFXM1zt5/l9fDMY+qfd8GlM+xhNZG1
         wSGRppP4SxmJqHvDzzFUVI1AvSD0iLkuCeJZcm8b4uzUCn+FbmA923eNPW+y3hNjv4jb
         yDWSC0fECZVAqFbFrqdfgtnkT3vlUCsxqr5ur13CclJKYrleQGmsGRNCisu9B336rYlE
         5ht1wf8cfJQ9q/scLPlUu/yPtehAlJ0NFDe4dKKbcJcdRaKOlM71EY6k+RhiS79t7VxP
         Q3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IAG2Nd1QFDtd40Eu7HQoxAL1bbMateaDoI07TYnmEdQ=;
        b=bvr3GL2gVSgNYToX7BZgNWZ/rYGBMtDvAhCQZsSzypvYwMSDaJmit8MUnSsl7ko4aF
         +iw+89o1KV33aTAX3v7jmZHqbblxGZgNjhsQ+C74WUic9C3sZsROLPcS2inofbs747Av
         MSVejb6RX6ApLXoSW5KGeTq7r2JDRri8zfF6a+S/wUE47KpRRS+C8GXxoEhyhYFdivi2
         TbtC1Eck8hIGXAk3cL9XgJpbPHhDXNhdwvnUnc0cS7FjnG4hEZ09Qd2Tqxs9rjbHTMeB
         MAtWgtdwF+4nyb+8i7U5wRTLe0f/lwEYVbww++YWDgq4Pt+8xCpQNK5H7V2aVv/Uz+HS
         TalA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531clzPanmCCLKY8ssYYoMrfzVUzcdAyJC0YBBtMyJQMU3QDsG0r
	FVp9/l8Tlq1lC8RmISFmymk=
X-Google-Smtp-Source: ABdhPJw2ofLezp67EjuDznG0n2gJ11dfmBA+WdGZ5wu/NV2Re7u6YImw6l33YW9qQDmbPZLqp4bG6g==
X-Received: by 2002:a17:90a:cb8d:: with SMTP id a13mr7669895pju.155.1608207846498;
        Thu, 17 Dec 2020 04:24:06 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:ee90:: with SMTP id i16ls3102881pjz.1.canary-gmail;
 Thu, 17 Dec 2020 04:24:05 -0800 (PST)
X-Received: by 2002:a17:90a:12c4:: with SMTP id b4mr7745335pjg.234.1608207845646;
        Thu, 17 Dec 2020 04:24:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608207845; cv=none;
        d=google.com; s=arc-20160816;
        b=W4TasslZyfY7gaITNkGDBx5tRNnm1WtjR6tNCFCgWij+rjEwkbsCDaT14Cs7Khfnb0
         8VvdPaWfqh/Loa12QgfvoorrKM9FVAMtEbp2Ki5LjAyGwQQUtgGPcsuSbQnfze5IckdJ
         g3uv5oQGQiJXfYiE5QIxID/7K0as+cypQ5gV6VJm8QIYBjPNro/TMJxO/R8Sw2VnZQYg
         NEh1dOKmiLGAWpi9cLGUXnw+aro3v8RGbX2ArKCzm4PhD5Z7TCU/qIXHlWw5Xw21tzxp
         WLF5uR6QNcMoICvjbbWopIV6JpPixFLIKqMsqvMJ4C58eWjJVIJgAq07V9Cf0lc3xNIg
         IyPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=TJluGGK2lp1ikTpkgYHqq+Sl90I8bWKnhlKn6QHF2Ls=;
        b=tMtG8Drm5yZAlMfeyh8ofwoJBLJEWOmx9TZJRyCLTX/Sd7MKcHlqnuQ9PPUeR9sliU
         cm9kfLFhHvUsgLP0QebV0kBY5IxwywWzEB5dblekC9Kps8pMgSPB0arQMpLwajIMliir
         3uF/vl8yOO5KCkqBtSaanaRU3vQzOueEm0l+q83aGIwE7sXomFAThINV9eSEnexvH6nC
         55M7oSyXedqK19orMKoMxZYcksoqMZGmij1YH8mGlutrzaW65kTKZGGGiGiwh4O8bmUK
         uPH7XVR+U+QotqqgDI8nl21AbeHlh1NtQ2FJ3iVtd0T51gx9r2udUcSh1dfVCUhmZqg/
         /WTQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=OWNHAPW1;
       spf=pass (google.com: domain of fredyzhang2018@gmail.com designates 2607:f8b0:4864:20::634 as permitted sender) smtp.mailfrom=fredyzhang2018@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com. [2607:f8b0:4864:20::634])
        by gmr-mx.google.com with ESMTPS id b18si352815pls.1.2020.12.17.04.24.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Dec 2020 04:24:05 -0800 (PST)
Received-SPF: pass (google.com: domain of fredyzhang2018@gmail.com designates 2607:f8b0:4864:20::634 as permitted sender) client-ip=2607:f8b0:4864:20::634;
Received: by mail-pl1-x634.google.com with SMTP id q4so9336687plr.7
        for <jailhouse-dev@googlegroups.com>; Thu, 17 Dec 2020 04:24:05 -0800 (PST)
X-Received: by 2002:a17:90a:9d88:: with SMTP id k8mr7959750pjp.141.1608207845431;
        Thu, 17 Dec 2020 04:24:05 -0800 (PST)
Received: from [127.0.0.1] ([193.176.211.41])
        by smtp.gmail.com with ESMTPSA id x4sm6000789pgg.94.2020.12.17.04.24.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Dec 2020 04:24:05 -0800 (PST)
Subject: Re: IVSHMEM-NET Verify
To: Jan Kiszka <jan.kiszka@siemens.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>,
 "Devshatwar, Nikhil" <nikhil.nd@ti.com>
References: <5e2bd88b-6b59-45f4-897c-ad3ffda1b76bn@googlegroups.com>
 <8b9e7352-f3c7-e442-bca6-45c328a9fcb4@siemens.com>
From: Fredy Zhang <fredyzhang2018@gmail.com>
Message-ID: <6e5460f6-276f-1b89-ea69-235fda1382b6@gmail.com>
Date: Thu, 17 Dec 2020 20:23:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8b9e7352-f3c7-e442-bca6-45c328a9fcb4@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Original-Sender: fredyzhang2018@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=OWNHAPW1;       spf=pass
 (google.com: domain of fredyzhang2018@gmail.com designates
 2607:f8b0:4864:20::634 as permitted sender) smtp.mailfrom=fredyzhang2018@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

Hi, Jan,Nikhil

For set up the system: I am following the TI guide to set up the=20
environment.

https://software-dl.ti.com/jacinto7/esd/processor-sdk-linux-jacinto7/latest=
/exports/docs/linux/Foundational_Components/Virtualization/Jailhouse.html?h=
ighlight=3Djailhouse


 =C2=A0=C2=A0=C2=A0 1. based PSDK7.0 SDK.

 =C2=A0=C2=A0=C2=A0 2. run the jailhouse linux demo .

 =C2=A0=C2=A0=C2=A0 =EF=BC=93=EF=BC=8E Porting the IVSHMEM-NET kernel drive=
r.

 =C2=A0=C2=A0=C2=A0 4. board testing. result as below.

Please help to check and give your input. Thanks.

Regards,

=EF=BC=A6=EF=BD=92=EF=BD=85=EF=BD=84=EF=BD=99

On 12/16/20 9:37 PM, Jan Kiszka wrote:
> On 16.12.20 04:31, Fredy Zhang wrote:
>> Hi,
>>
>> I am porting the IVSHMEM-NET patches on TI TDA4VM kernel 5.4. the module
>> can loaded sucessfully. Can you please help to give some suggestions on
>> how to verify the driver works fine ? thanks.
>>
> Nikhil, did you test that already?
>
> Fredy, how did you set up the system? All on your own, following TI
> documentations, or what was your guidance?
>
> Jan
>
>> 1. running the jailhouse linux-demo.
>> 2. check the ifconfig
>> root@j7-evm:~# ifconfig
>> eth0=C2=A0 =C2=A0 =C2=A0 Link encap:Ethernet=C2=A0 HWaddr 50:51:A9:FC:B2=
:20
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST MULTICAST=C2=A0 MTU:150=
0=C2=A0 Metric:1
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 errors:0 dropped:0 over=
runs:0 frame:0
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:0 errors:0 dropped:0 over=
runs:0 carrier:0
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:1000
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0 B)=C2=A0 TX bytes:0 =
(0.0 B)
>>
>> lo=C2=A0 =C2=A0 =C2=A0 =C2=A0 Link encap:Local Loopback
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet addr:127.0.0.1=C2=A0 Mask:255.0=
.0.0
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: ::1/128 Scope:Host
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP LOOPBACK RUNNING=C2=A0 MTU:65536=
=C2=A0 Metric:1
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:82 errors:0 dropped:0 ove=
rruns:0 frame:0
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:82 errors:0 dropped:0 ove=
rruns:0 carrier:0
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:1000
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:6220 (6.0 KiB)=C2=A0 TX byt=
es:6220 (6.0 KiB)
>> 3. modprove ivshmem-net, it
>> root@j7-evm:~# modprobe ivshmem-net
>> root@j7-evm:~# lsmod
>> Module=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Siz=
e=C2=A0 Used by
>> ivshmem_net=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0327680=C2=A0 0
>> xt_conntrack=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 262144=C2=A0 1
>> xt_MASQUERADE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0262144=C2=A0 1
>> xt_addrtype=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0262144=C2=A0 2
>> iptable_filter=C2=A0 =C2=A0 =C2=A0 =C2=A0 262144=C2=A0 1
>> iptable_nat=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0262144=C2=A0 1
>> 4. check the ifconfig
>> root@j7-evm:~# ifconfig , I found a docker0 node. is the docker0 for
>> IVSHMEM-NET ?
>> docker0=C2=A0 =C2=A0Link encap:Ethernet=C2=A0 HWaddr 02:42:51:08:03:0E
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet addr:172.17.0.1=C2=A0 Bcast:172=
.17.255.255=C2=A0 Mask:255.255.0.0
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST MULTICAST=C2=A0 MTU:150=
0=C2=A0 Metric:1
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 errors:0 dropped:0 over=
runs:0 frame:0
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:0 errors:0 dropped:0 over=
runs:0 carrier:0
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:0
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0 B)=C2=A0 TX bytes:0 =
(0.0 B)
>>
>> eth0=C2=A0 =C2=A0 =C2=A0 Link encap:Ethernet=C2=A0 HWaddr 50:51:A9:FC:B2=
:20
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST MULTICAST=C2=A0 MTU:150=
0=C2=A0 Metric:1
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 errors:0 dropped:0 over=
runs:0 frame:0
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:0 errors:0 dropped:0 over=
runs:0 carrier:0
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:1000
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0 B)=C2=A0 TX bytes:0 =
(0.0 B)
>>
>> lo=C2=A0 =C2=A0 =C2=A0 =C2=A0 Link encap:Local Loopback
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet addr:127.0.0.1=C2=A0 Mask:255.0=
.0.0
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: ::1/128 Scope:Host
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP LOOPBACK RUNNING=C2=A0 MTU:65536=
=C2=A0 Metric:1
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:82 errors:0 dropped:0 ove=
rruns:0 frame:0
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:82 errors:0 dropped:0 ove=
rruns:0 carrier:0
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:1000
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:6220 (6.0 KiB)=C2=A0 TX byt=
es:6220 (6.0 KiB)
>>
>> Regards,
>> Fredy

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/6e5460f6-276f-1b89-ea69-235fda1382b6%40gmail.com.
