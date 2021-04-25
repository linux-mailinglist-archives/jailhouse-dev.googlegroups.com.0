Return-Path: <jailhouse-dev+bncBAABBX7OSSCAMGQEUK7SV4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C02236A61C
	for <lists+jailhouse-dev@lfdr.de>; Sun, 25 Apr 2021 11:33:20 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id h60-20020adf90420000b029010418c4cd0csf16439854wrh.12
        for <lists+jailhouse-dev@lfdr.de>; Sun, 25 Apr 2021 02:33:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1619343199; cv=pass;
        d=google.com; s=arc-20160816;
        b=DWzjicdBwkyhgwwj87TqkTg7DDSAztFYlkOE4I1kreDNqPvqzZJ78DFZjvK5z7lEr0
         Gby2Ty4/glWDVjNV3G488lmyY3Mc2V/kjyawItw3/v1E6yK3Iz+fmHxWppeCEzh+3R3l
         LzVYegwAoIfqrpvS1c7m5Z/wDC/qms8LJmjsDXSbqT9qS8Ft5A5hBvOIWZ+m+jQw4sVV
         JoZ2s6lpgqqYJACpTrjhDt4r5gXaTQJaWDywDxifFmuj5alhFIR0s027nSipAm8+bCyN
         s9Dz+HcCxzN+g4hKgDjJgIBFuya/52gDG8QnZ8VNU8PuRsfsqSc/0ikQlT9BAh7nZXiD
         TlBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=nUrXA9O3AIpoyxsX6RGiTR1/f2BORamI4NVWTRinjPc=;
        b=LeImewYylkrIyW6ri+bWcfWvdgUq1D3neJ1k2PCJ8hTuBZiguAz66xLi6xJitT453B
         NMK+TgxRpWxLSuy6ufHv2YWBMhLKa0Rpch7/K4TRe3N0HasNVf/MS2uZuWOVRnPEnvy9
         VZdu0xLRSOsZRqMQiMjYZ/S+2PjFXIFF5DDl2oU8qCQU4U/Tk3JoVxBJU1HBwsvx1MuW
         TQbzMlVO/cJ46zUJK6kK/8AoWgZuaO9aNPC3Pfpg8b2wagPXU/aE1QUEGApoLcUvwffO
         a3RTZY41ES2s/BIpiuffTXsZodv0a+/HBmyv4UzdFtU4oUgEZZtFFirl6ckhwlcEPa/T
         xvpA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=neutral (no key) header.i=@uni-rostock.de;
       dkim=pass header.i=@uni-rostock.de header.s=itmz header.b=IIoSXhQl;
       spf=pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.72 as permitted sender) smtp.mailfrom=moustafa.noufale@uni-rostock.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=uni-rostock.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=nUrXA9O3AIpoyxsX6RGiTR1/f2BORamI4NVWTRinjPc=;
        b=s5YUKmIvQaWwq0XSn/w1gaityC7EGHQ6nYzgweuuOEEVJFIwzIINcb2I5yD7P5OtBH
         ZTXm7HAwHJMauWsxiSNyRH34e1OW/Ncqu2ly7McZXzHQNde3zRVf2E4Z/ZV6E4amYhGt
         xCEmtrYjpLgQege8XgKkpe9oBwu6kD57VJ0Q5+kYrRTCLzTfEKSgVkg/kjm+Yx1C7Jc2
         wjIDz7M9/NShCCyOhF6a8u1ihT+TOzhiSdH61fa2zvnQgF4y9+SGviY4KlWq6i7u4ppd
         sKyWGkYHjKjJ+DJqjV0GzdNb5b8rewlDb8uBOly9B9CAzTpFgSzW+RAVgcepMu6sIj7r
         TGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=nUrXA9O3AIpoyxsX6RGiTR1/f2BORamI4NVWTRinjPc=;
        b=RP1GWLbBieW0SQouCiHuC92ZuTCAyjr8gtHNBl2bQ0W4fNuYBpY2NRioT0jEqKvo18
         pIIH/lcqrk/p0kkx0rPpoNJ063Ce/LvOcrrTaQU3tHiw7VfhQAw3MlchihTg4Crmdzec
         DVcousEn4M1I3f079xxBqHwKfCM6UKVY/i3qMuXkro+4va6Q40L+inKDMPZLURuuqtKT
         ITY42f2wwrqRpcHLY4WE07txDGa2KzqLzqr5+/lhLfq95tmx2TdK+Wdcx8O6IWwECi5J
         qCeT3h/6Zj6PkNhsHEw7nmPXEQK7nk7vZBTkqaURA52yrP7oSUk5fFeVjgYn7tV0jQR8
         FwTA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533cXqzrPL5S+g71KtS9YTRuExSrw9+fh8ryn+cfz0tP2NpfDFUT
	RHHc14eEX/a7izdSOuaSQZs=
X-Google-Smtp-Source: ABdhPJxJBPiqBD1S6mEP/cvXIwIM48SOIUywMrS0Ga9m3AkoAtExFfzLgHP4Lsmy9t1+HF/9kAnKkA==
X-Received: by 2002:a5d:6b50:: with SMTP id x16mr15672104wrw.379.1619343199742;
        Sun, 25 Apr 2021 02:33:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6804:: with SMTP id w4ls4654797wru.2.gmail; Sun, 25 Apr
 2021 02:33:19 -0700 (PDT)
X-Received: by 2002:adf:fdcd:: with SMTP id i13mr15634588wrs.185.1619343199055;
        Sun, 25 Apr 2021 02:33:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619343199; cv=none;
        d=google.com; s=arc-20160816;
        b=ee6LpSr5WxR6FUDBAwbCtQnX7n2SA9jmLI5NQQiiQ04F2Fbg6U+R/qiOH8jpoqQWE2
         02uhEA6bjFm5X56Wa9CxUhN38bwllwhZRLQ55SpSUtbaG8x+EQ7s+I+TXnDPSsk4DhKF
         U8I0Wk0dl65V/G1hq4ODgK4ISfi1S8i8RJHDW++R1d+EGvjAJeklFCkM4e8DmuHXrapf
         44LthGBnKPWa2YNLGHGZclNvO9QqlMbwDhgqa73Yc9eCu/ANndmDyonW8H9pt5gxUM0a
         NL+BXHz9pHUoF383Nm7Xixm0e6YQ4y144D4kQ/2VrixtdQT6LPytgB8sQOahDgfbcWyP
         M0zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature:dkim-signature;
        bh=IyC0Y44OE2SuXFVzjAxkA/ERmWIdTczNeE+EdaWf5eI=;
        b=RFkGaPFUXnlJIIiLFeTXxiEBT8bcFsuJ0jONlGn0Ul3TSgao5htEE0XMiysQucnVlF
         5rPFgmqeq5zLN5e8cXuWrWVNK4EmPPbcUoVpXaj3GAwGBXnOVAlQz+lpCVyAcx17cnCg
         Prppo0dRkAs45lUM6E5QkJcolw6FFh0kedNwA/tNaqopglxCP6+H7LAGWHI2RQkksSk9
         FZhcTTW3XOKD6Q6HRx5bBavTXL70yQ0q16XEHkuTyt39eIwBj02pXxhPP2dTUaXKYOTn
         3lA3C91Ng7IbxnJMHgV9Gg4ffgtQNDuyY9CUzOpE1hVJDdgWcqncKK03Vo06/QH5g2VX
         n8VA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=neutral (no key) header.i=@uni-rostock.de;
       dkim=pass header.i=@uni-rostock.de header.s=itmz header.b=IIoSXhQl;
       spf=pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.72 as permitted sender) smtp.mailfrom=moustafa.noufale@uni-rostock.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=uni-rostock.de
Received: from mx2.uni-rostock.de (mx2.uni-rostock.de. [139.30.22.72])
        by gmr-mx.google.com with ESMTPS id r4si1639942wma.1.2021.04.25.02.33.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 25 Apr 2021 02:33:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.72 as permitted sender) client-ip=139.30.22.72;
Received: from 139.30.22.82 by mx2.uni-rostock.de (Tls12, Aes256, Sha384,
 DiffieHellmanEllipticKey384); Sun, 25 Apr 2021 09:33:11 GMT
Received: from Pickup by email2.uni-rostock.de with Microsoft SMTP Server id
 15.2.792.3; Sun, 25 Apr 2021 09:33:06 +0000
Received: from email1.uni-rostock.de (139.30.22.81) by email2.uni-rostock.de
 (139.30.22.82) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Sun, 25 Apr 2021
 11:32:02 +0200
Received: from email1.uni-rostock.de ([139.30.22.81]) by email1.uni-rostock.de
 ([139.30.22.81]) with mapi id 15.02.0858.010; Sun, 25 Apr 2021 11:32:02 +0200
From: Moustafa Noufale <moustafa.noufale@uni-rostock.de>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Jan Kiszka
	<jan.kiszka@web.de>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: AW: [EXT] AW: AW: Inquiry
Thread-Topic: [EXT] AW: AW: Inquiry
Thread-Index: Adcx+AFw6wu1ws16QgaPAGku5ayIpgBZYRUAAJpN+xD//+LWgP/67wQwgApfIwD//qzLwA==
Date: Sun, 25 Apr 2021 09:32:02 +0000
Message-ID: <857f4a45c58d4a85b336ac6f3028e5be@uni-rostock.de>
References: <0631a4941db6453491ffecf6c08b1cf7@uni-rostock.de>
 <61de29b4-45a2-8f3b-5937-5cac7dfc2b21@web.de>
 <879f50f352e14aa8b45e9aff399c2b02@uni-rostock.de>
 <0b2f286b-b5ed-8de9-e0a2-73af9f9cbedf@oth-regensburg.de>
 <aa35f9463dd64b96a3998e9fe84da04a@uni-rostock.de>
 <d6df4ded-1fb9-f75d-1a1b-0cef2513acf9@oth-regensburg.de>
In-Reply-To: <d6df4ded-1fb9-f75d-1a1b-0cef2513acf9@oth-regensburg.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.30.79.246]
x-tm-smex-dtas-header-wtp-uuid: BB9A9D42B6A258ABF493198394F1CD6319F7D029
x-tm-smex-dtas-header-wtp-flag: A32F18B9A1DD6E003F8B0A96E0C1CABD0139F0F90000
	9f32110c-4cb0-47e0-8d95-58718108e1d1:BC4A395C517E27D5DC5D9D61FE921023AB7115
	3C0004e2f129e3-d263-47dd-9eb0-e703a4ceab0b:E86D7FA298E5BF5C91B1B1620E328B6A
	9CBADDE50000865424a9-dd80-42f1-8947-a8a73a094df7
x-tm-as-product-ver: SMEX-14.0.0.3080-8.6.1012-26112.006
x-tm-as-result: No-10--11.858300-8.000000
x-tmase-matchedrid: sOqIl3tTFSAMPDZrnvcM98CxC+PryYbTgdkHykGcMpkDwV9jYWbSUyB/
	i5+13Aa4yR4vuIAZpDJrFSBxCqPzKfKywxUrGdUktLDu9qtqKeGB+Bp0AxEJF2h76/bDpGEr1bF
	/2rM7HEpSl318SPsuoh2acnDLtmvQy7PF/07l4/JM+xVFI1xtY9GOcAfHKa6u+wLiqgrym7YcZF
	VPMrL3XsS6pV1aEFrxh7QvACAfMaCWSJTL+w69WIn2DbDz4AfWigqmruJZjrDk1kyQDpEj8E1NJ
	2MN+nPk/YUtGtrcVxC8kpEcz1xGk6YFcZuboHd5/ccgt/EtX/1+S5m2/8VLmlP++i/BUt02GRoB
	mh+0eS2bsWYknkK3GIzTyPqwIWmSxwDaapN87annBcjWg41W4AKflB9+9kWVfXoLsYVy+TJM9t0
	xhmRzkyFDPhCO3zhjyRZV4eCHDnDJvuWHZ1DOrIlSWYvdSPSYBXngI6jFvpflljQaTuDz5J8zUj
	XBpWAivVmSH63E5kuu/Aa0mckQekxeCc1JgM9SvmT2VURehlpr9+Kgn2XgeE2aZutybpc13tnBJ
	NDiopjiJ4mWYohn7lj+0tQMojxA/ZG8oSoOiZQsisyWO3dp27TrV2IG143XR619hNjJH0QYijGH
	xpmrmSwQpFg3G2mjrCdBvt04JcZ0OTdOu6KfB2vDT+wC7pqFEeq+exnvf0gZv1WIPFVlSPO7jh9
	ccQkDAKuvLTDJgDFcJ0n+mveZvtxXg3OszYixvOAv94sAIMR5ybkwtj/jvi99T+uJIleRCxyC37
	qTSIsCn662Wdi9aXATQySX1loTrH6oGS7HY8+rm7DrUlmNkF+24nCsUSFNBLPx9cDMrKax5amWK
	2anSPoLR4+zsDTtgUicvJ4MChljHN0Ub5BxHxOe5W/nBBM34t0Iun+xu7V1DNH9L6ajFlHtId5r
	KleF
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--11.858300-8.000000
x-tmase-version: SMEX-14.0.0.3080-8.6.1012-26112.006
x-tm-snts-smtp: C8D80AD5DCE88451D26230B17E525906AE41C82FE7D426DC47706F9495F8D90E2002:8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Original-Sender: moustafa.noufale@uni-rostock.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=neutral (no
 key) header.i=@uni-rostock.de;       dkim=pass header.i=@uni-rostock.de
 header.s=itmz header.b=IIoSXhQl;       spf=pass (google.com: domain of
 moustafa.noufale@uni-rostock.de designates 139.30.22.72 as permitted sender)
 smtp.mailfrom=moustafa.noufale@uni-rostock.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=uni-rostock.de
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

Yes, the machine is working and jailhouse is present in the list of Modules=
. However, when I run this command:
jailhouse enable /etc/jailhouse/qemu-x86.cell
I get on the QEMU side " Input/output error"

and on the terminal:
Initializing Jailhouse hypervisor v0.12 (0-g92db71f2-dirty) on CPU 2
Code location: 0xfffffffff0000050
Using x2APIC

Then I ran jailhouse hardware check and everything is available, except for=
:
"Virtualize APIC access             MISSING"

Then I tried to figure it out with different ways:
    sudo modprobe kvm_amd nested=3D1
    sudo modprobe kvm_intel enable_apicv=3D1

or editing the kvm.conf file, but with testing with the following command:
cat /sys/module/kvm_intel/parameters/nested
returns Y and it is okay.
cat /sys/module/kvm_intel/parameters/enable_apicv
it returns always N.=20

I tried two setups:=20
1- Ubuntu 20.1 as a VM on Win10 machine.=20
2- Ubuntu 18 as the main host machine.

Thanks in advance

-----Urspr=C3=BCngliche Nachricht-----
Von: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>=20
Gesendet: Freitag, 23. April 2021 20:40
An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>; Jan Kiszka <jan.kis=
zka@web.de>; jailhouse-dev@googlegroups.com
Betreff: Re: [EXT] AW: AW: Inquiry

Hi Moustafa,

On 23/04/2021 15:04, Moustafa Noufale wrote:
> Hello,
> I would like to thank you for your support and maybe you can give me a li=
ttle help with building "jailhouse.ko"
> I have tried make, make install with and without root in this directory "=
jailhouse-master/driver" and I am not sure if I am following the correct pr=
ocedure. What I have done so far is building an image of a virtual x-86 thr=
ough running ./build-images.sh and I can start it using ./start-qemu.sh.=20

Okay - so you did build successfully build your target with jailhouse-image=
s, and start-qemu.sh gives you a running qemu instance?

In this case, everything is already installed and in place. The jailhouse m=
odule will already be loaded - you can check that with `lsmod`.

To enable jailhouse, you can simply check the history of you bash, or have =
a look here:

https://github.com/siemens/jailhouse-images/blob/master/recipes-core/custom=
izations/files/.bash_history-qemu-amd64

HTH,
  Ralf

> What I have understood from the tutorial is that I have to inject jailhou=
se.ko into the kernel and then start the guest.=20
> Thanks in advance
> Moustafa Noufale
>=20
> -----Urspr=C3=BCngliche Nachricht-----
> Von: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> Gesendet: Dienstag, 20. April 2021 11:39
> An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>; Jan Kiszka=20
> <jan.kiszka@web.de>; jailhouse-dev@googlegroups.com
> Betreff: Re: AW: Inquiry
>=20
> Hi,
>=20
> On 20/04/2021 11:29, Moustafa Noufale wrote:
>> Hi Mr. Kiszka,
>> I have tried to  build an image through running "build-images.sh" with a=
nd without root access:
>>
>> without root access:
>>
>> Select images to build (space-separated index list): 1
>> docker: Got permission denied while trying to connect to the Docker daem=
on socket at unix:///var/run/docker.sock: Post http://%2Fvar%2Frun%2Fdocker=
.sock/v1.24/containers/create: dial unix /var/run/docker.sock: connect: per=
mission denied.
>=20
> your local user needs to be in the docker group.
>=20
>> See 'docker run --help'.
>>
>> With root access:
>>
>> Select images to build (space-separated index list): 1
>> Error: Running as root - may break certain recipes.
>> Better give a regular user docker access. Set KAS_ALLOW_ROOT=3Dyes to ov=
erride.
>=20
> Simply read the error message and follow the instructions: If you want to=
 run docker as root, you have to set KAS_ALLOW_ROOT=3Dyes to your environme=
nt. For good reasons: You shouldn't do that as root.
>=20
> Anyway, solve the issue by adding your user to the docker group.
>=20
>   Ralf
>=20
>>
>> I have installed QEMU version 5, KVM 2.2 and enabled nested virtualizati=
on.=20
>> I would really appreciate it, if you could me a hint.=20
>> Thanks in advance,
>> Moustafa Noufale
>>
>> -----Urspr=C3=BCngliche Nachricht-----
>> Von: Jan Kiszka <jan.kiszka@web.de>
>> Gesendet: Samstag, 17. April 2021 11:45
>> An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>;
>> jailhouse-dev@googlegroups.com
>> Betreff: Re: Inquiry
>>
>> Hi Moustafa,
>>
>> On 16.04.21 10:29, Moustafa Noufale wrote:
>>>
>>> To whom it may concern,
>>> I am a Master student in Rostock University and I am studying=20
>>> Jailhouse this semester as a Master project and I would like to=20
>>> gather information about this Hypervisor, as well as I would like to=20
>>> ask, whether it is possible to install it on an Ubuntu Virtual=20
>>> Machine? I just need an outline, how I can learn it. I spent today=20
>>> reading the code on GitHub, but I need more information and appreciate =
it if you can help me.
>>>
>>
>> A good starting point for experiments can be the images generated by [1]=
, both for KVM VMs, pure QEMU emulation target or also real boards.
>> Note that emulating target inside a VM will work but using KVM (for x86)=
 may not or is at least fairly slow. I would recommend a native Linux host.
>>
>> Then you will find a lot of presentations on Jailhouse on the internet a=
s well as an (aging) tutorial on how to bring it up on new hardware.
>>
>> Jan
>>
>> [1] https://github.com/siemens/jailhouse-images
>> [2]
>> https://events.static.linuxfound.org/sites/events/files/slides/ELCE20
>> 1
>> 6-Jailhouse-Tutorial.pdf [2]
>> https://www.youtube.com/watch?v=3D7fiJbwmhnRw
>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/857f4a45c58d4a85b336ac6f3028e5be%40uni-rostock.de.
