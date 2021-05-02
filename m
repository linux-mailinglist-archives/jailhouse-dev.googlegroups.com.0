Return-Path: <jailhouse-dev+bncBAABB36LXGCAMGQEFIZZHXY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 0686F370ACD
	for <lists+jailhouse-dev@lfdr.de>; Sun,  2 May 2021 10:42:25 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id o4-20020a05651c0504b02900bef5ae012asf1295297ljp.23
        for <lists+jailhouse-dev@lfdr.de>; Sun, 02 May 2021 01:42:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1619944944; cv=pass;
        d=google.com; s=arc-20160816;
        b=V1jPqE9K2r//9rxtOlVzG+AUqq5G8xcOeMumct8hTjLkhdXoyZ9b/MxYExSVkG5c1X
         n1fL3qLxVAdN+BeqxhYWEJbZjq3CzLHVBms3Wv5HCW4EOi+jE0nLPWr+kjHbTRt9N6T7
         uFgGY6F6vO1XdI1l7MbQpLxxuW0tbrp1btlJIRz5mF0d9mjWu1WcYfcKyHiRQ0jsHWNp
         scV2zvvcbLIc47zFRdBZJ6pPR1QwhzmZRVQxe6EG3G9tXzWv/6qHf7wTV6ryDG6Xsx0t
         JIjXysjOHd+Rcy//pDIywa8HGI3vmVYEtMclx18pIIKhwld1Snwnq1Aoj52RifrXML58
         rZ9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=+baAFnpFh+WU1CCo/ND6Nt5kV/+MOBe7/R5jVjYTLGI=;
        b=xww7rlupwEXfjb57Yi4fUtiJRyKLSu+M2DhRNamSaqHCG3s2D9QMbkXGW8Jkfy0whO
         83GGUGtm1LR5CFMih+dQ29e/+ddOPKTWGN1DWhN73tjI/QsebQ9SyJSM44I/Xmz4Jp2D
         WLZ8JKTP5KaGC+mVjYIn/e8szbJU1NSN2DSWpO++q+Hq61IeyGNasdSDLg0fyNY/vzZp
         e/Ge0t+4W+RtlcMz1YbXNRD5NmrcRceW6coyDFrq2aNzlUCKfWtAsG1XQ+ysie8Vr7Fy
         vRdvCMKeHe6/oQBVL3GVAnKyyI/u0+iy8bQffx5ADG05wEbAROkZwNzFkJio3B01zlhD
         pyRg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=neutral (no key) header.i=@uni-rostock.de header.b=amv+rufH;
       dkim=pass header.i=@uni-rostock.de header.s=itmz header.b=SrZHmWcp;
       spf=pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.71 as permitted sender) smtp.mailfrom=moustafa.noufale@uni-rostock.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=uni-rostock.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+baAFnpFh+WU1CCo/ND6Nt5kV/+MOBe7/R5jVjYTLGI=;
        b=tNDOfA1LeD0RlHleCHhzaDW9vL5EwDuLCBRccynOUHkFpnvp7McWU/rx1bw0WiaKH4
         Ji8rZt4AZms0eiA+fNZZfE2uXWTJD8ffB2qZ9CBmJDVa1gihMpE50gBJN6Vg+4Pcp1CA
         LI4qVxWovk618sOvrNOYSRGUq28xr+m+j9Y77ZYzkYF0jUxYokg2qBcSWea9AO0ektWt
         oERftTVNocE//DSADiHnD+YnvxmgDkdcxih9aDriYfWYSN8xtczHfA+Giu49e+BJXlUt
         ix508jUysGEg2/rBzEMbAqiruqThUCTKMExq0WcZepG37CZg2SR9StAQjAN2zM6eNLqc
         kbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=+baAFnpFh+WU1CCo/ND6Nt5kV/+MOBe7/R5jVjYTLGI=;
        b=e34tUbOOy8SstM6GIUaCmpBlJFhdFisMX4pCdLTxT7kIYIPkaFQ4+MPOlBYoU+dHBx
         NAGwhhpHSSehTLJa9WNDqnCbI+GyMUP++VaodCy6BhsRWLgCZ79ExfFIOTIBrgJ3LZQc
         AiQrrvQTPMzc6PQaXnE5khfSnuG06K5/6XhfC1GwHei4qpklj8TiXVWUW8mllo72Pc5d
         2zC4Lh90PjIJ4+wtZ3s7fHi+kzc5ZoSJUb81qu7Ba7+fdarRJ6oq7mcU7tibvxjvidZx
         TiHWinglh5IaeqMwTERtJhAHjwd0RqNTGJhRkjynHsRyGKA7JHJLPxOfNuueU7GtWCnW
         +9EQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5332vTLOWLK0r73Y7yxoZjS4k+wu+XEkKHD50uM8CgSiqLiIEoVQ
	VnaRM6g303JMB3XSccKChlI=
X-Google-Smtp-Source: ABdhPJw/9nniSmHtaw5fK0XREpJZ2HT3IDNMXjdRY7za2mg2aXoLYud3Ii9DFIDC7/gzl2x9QU1orA==
X-Received: by 2002:a2e:9185:: with SMTP id f5mr5161257ljg.194.1619944944450;
        Sun, 02 May 2021 01:42:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:507:: with SMTP id o7ls2707497ljp.6.gmail; Sun, 02
 May 2021 01:42:23 -0700 (PDT)
X-Received: by 2002:a2e:7306:: with SMTP id o6mr4264449ljc.420.1619944943294;
        Sun, 02 May 2021 01:42:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619944943; cv=none;
        d=google.com; s=arc-20160816;
        b=YsaTHaCfEtCLGKhc3DcN3GYmsbjBigfZN6ISQFV9YLhpsae+Odyd4G2nZPLPsrZ8uU
         qBiwCg+NdjJLYCTIUWpTPyh7c2/7yRywCoeVyrZOUIfD6dlzNnvxeQsTCjM67jLaDN4K
         /7/YDO/AktoIYUDf4dTja/s4+t0Tb8PpmtZaMHHrmF/6aFl5N5eds5WwmwhIyTuWwq7F
         5AT/k9xhj2QTqiEhziDPVEKRyEh6rG6pNJ3ZQlOwYF7HBSYsOYeWaeEAzTUAoNHQWo7b
         4d+hE3LIq0/pxNtud9b5/lC8mgaVbXQ9pqRYyxIDNhzf+2yAAKHAEYLoSDO1dVPzt/U4
         amMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature:dkim-signature;
        bh=cGxFl/MCV5Nxs3yPt7P3edQ7VOc0pM191pM+Ds9QFIM=;
        b=e18UppEPsivAfITBid5UX6fnbyN7MBb2Cve2OzEVQb/3epmaM7ZYXlalVw+MfuhMEK
         XHPE6Vsuxy4ShgKZBrsEnJGZ08PxKGPfGjhYBCRELN63Tfe4Qc2k/W6X+nq1DGsy4fKd
         EHtVtJOPPcM35H9AHAAgNuwZrEkw2Uw97KJvjJXAqc2mTPLCYnqqyiyNQFHKI5AvBDPr
         QeXIgOpQ6tB3USeCop2Bm466hwwf7FP7tTzobLqCcFlxZm9EAqmQ1uvyKnav2mwFqcRH
         s9DSk0Z3mjcD1y9CcuvjAsoed1t73zOMnVyRL1zPGd7Q8q9uGzhjrcg1Mjp2i3mxXs6k
         pKzw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=neutral (no key) header.i=@uni-rostock.de header.b=amv+rufH;
       dkim=pass header.i=@uni-rostock.de header.s=itmz header.b=SrZHmWcp;
       spf=pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.71 as permitted sender) smtp.mailfrom=moustafa.noufale@uni-rostock.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=uni-rostock.de
Received: from mx1.uni-rostock.de (mx1.uni-rostock.de. [139.30.22.71])
        by gmr-mx.google.com with ESMTPS id g25si461820lfb.10.2021.05.02.01.42.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 May 2021 01:42:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.71 as permitted sender) client-ip=139.30.22.71;
Received: from 139.30.22.82 by mx1.uni-rostock.de (Tls12, Aes256, Sha384,
 DiffieHellmanEllipticKey384); Sun, 02 May 2021 08:42:16 GMT
Received: from Pickup by email2.uni-rostock.de with Microsoft SMTP Server id
 15.2.858.5; Sun, 2 May 2021 08:42:12 +0000
Received: from email1.uni-rostock.de (139.30.22.81) by email2.uni-rostock.de
 (139.30.22.82) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.858.5; Sun, 2 May 2021
 10:40:07 +0200
Received: from email1.uni-rostock.de ([139.30.22.81]) by email1.uni-rostock.de
 ([139.30.22.81]) with mapi id 15.02.0858.010; Sun, 2 May 2021 10:40:07 +0200
From: Moustafa Noufale <moustafa.noufale@uni-rostock.de>
To: Jan Kiszka <jan.kiszka@web.de>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: AW: [EXT] AW: AW: Inquiry
Thread-Topic: [EXT] AW: AW: Inquiry
Thread-Index: Adcx+AFw6wu1ws16QgaPAGku5ayIpgBZYRUAAJpN+xD//+LWgP/67wQwgApfIwD//qzLwIAD6CkA///bZqAABW1CgP/0//LQ
Date: Sun, 2 May 2021 08:40:06 +0000
Message-ID: <c53790d5ecf3411cb1990106e9663ecc@uni-rostock.de>
References: <0631a4941db6453491ffecf6c08b1cf7@uni-rostock.de>
 <61de29b4-45a2-8f3b-5937-5cac7dfc2b21@web.de>
 <879f50f352e14aa8b45e9aff399c2b02@uni-rostock.de>
 <0b2f286b-b5ed-8de9-e0a2-73af9f9cbedf@oth-regensburg.de>
 <aa35f9463dd64b96a3998e9fe84da04a@uni-rostock.de>
 <d6df4ded-1fb9-f75d-1a1b-0cef2513acf9@oth-regensburg.de>
 <857f4a45c58d4a85b336ac6f3028e5be@uni-rostock.de>
 <688b5cc9-6150-dab1-0a0f-a7b5cb8d54cf@web.de>
 <c029ad37ed324934b2e0aa3f05ad1713@uni-rostock.de>
 <34742299-7898-adb3-30b8-760bc4596e92@web.de>
In-Reply-To: <34742299-7898-adb3-30b8-760bc4596e92@web.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.30.75.87]
x-tm-smex-dtas-header-wtp-uuid: 9B76DB7C4FF286628A4AE5AEBAA1498D3CFF2861
x-tm-smex-dtas-header-wtp-flag: 26FE7549063222D2B04DA65B266F6B9B2E7B6DE80000
	4feacde7-6623-4b6e-8ec0-5d0a5b895113:BC4A395C517E27D5DC5D9D61FE921023AB7115
	3C0004b52b7f13-fe0a-4c34-bd17-a4142529c08c:E86D7FA298E5BF5C91B1B1620E328B6A
	9CBADDE50000d2fdc6cd-0a2a-4219-b848-35bc28fac255
x-tm-as-product-ver: SMEX-14.0.0.3080-8.6.1012-26126.006
x-tm-as-result: No-10--17.920200-8.000000
x-tmase-matchedrid: sOqIl3tTFSAMPDZrnvcM98CxC+PryYbTgdkHykGcMpkNIbt2ZiH1utX3
	HuAvaX8y8zqcltpHr5XTmvYgY9MMy88hcLrUYl5Lp7rgqkxHgFRf3ennYqHe2BdHX2eZFfZfFhW
	aPtkJY/TsOmdqQuLw/it0f1g+jUzVZcOaRg2YufReu6aRt5rYyVWt71aOqpDDVQ8e/B1BvGjUMP
	ki0YIfof1120/gxM0uiJt8RaL5m8mtIop/D9Co1R03I0O1uBQR52mltlE2n8jWXfwzppZ8SHtcS
	BXe4RfNAIqf5WIQ3F6HtC8AIB8xoJZIlMv7Dr1YifYNsPPgB9aKCqau4lmOsOTWTJAOkSPwKPnd
	oQHmoMtg3KLvgPPi6Z3Qs5sK78d4fvLZvmsRo6wdxBAG5/hkW5AzEzz5nqjOu6qThyrnanMysnX
	xUIjx+xzYzSQWyMCn9tznvLHRcTxFJq0pQoWgsY9BVqQOQlT5yeUl7aCTy8ifE2SVh6kzPJo9tf
	Gq0HaXNe7yncYhXDwCFDosJ/sJO0ieM+TidOC+W1M77Gh1ugarDPxf3LbqpFbDmwy31ULEy5aOm
	ZvTmVOQNk2CmkexJHe1ZiKPDx85dvvbftTsJSflvSeYSYEULA/o5bNHEsCTVr6VRiexIrG6e49A
	QdqG/nGdZVe1+//wtzx3yJL2seF6Icg4A21ScmFzg+No/uuNRwDU669267ychsx3TxRTxyPTyo5
	Y6UW76gRWqn8sKK2M9Gt100itTRp6rGfLEa9iJDcimQIrvHhLzGxCv79G9RHfiujuTbedoh5Ont
	QGGFFnaShipTcsDk4DAdCXIuznYX6qxnGNCyqrm7DrUlmNkF+24nCsUSFN+dkjd91LgACx5amWK
	2anSPoLR4+zsDTtgUicvJ4MChnHqUZU4ZZN0CP10AZ5T2o9Kj8WJMzOcqfuFeEOfJ/gooymdEhG
	WffR
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--17.920200-8.000000
x-tmase-version: SMEX-14.0.0.3080-8.6.1012-26126.006
x-tm-snts-smtp: 8E608BF859AC40A527F051064D6FE89ED4B2B1150C41EE86DEF08B963DD269A02002:8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Original-Sender: moustafa.noufale@uni-rostock.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=neutral (no
 key) header.i=@uni-rostock.de header.b=amv+rufH;       dkim=pass
 header.i=@uni-rostock.de header.s=itmz header.b=SrZHmWcp;       spf=pass
 (google.com: domain of moustafa.noufale@uni-rostock.de designates
 139.30.22.71 as permitted sender) smtp.mailfrom=moustafa.noufale@uni-rostock.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=uni-rostock.de
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

Hi Mr. Kiszka and Mr. Ramsauer,=20
I would like to thank you for your previous support. We are planning to try=
 jailhouse on a Coral Dev Board with i.MX quad-core Arm Cortex A53. I have =
some questions and some conclusions, you can ignore my conclusions if it is=
 correct:
1- Docker group is only required to build jailhouse-images in case of virtu=
al-machine demo, the reason is avoiding running start-image.sh with root pr=
ivileges. Am I right?
2- Communication between cells is possible, but how? Can you recommend me a=
ny reading about this part.
3- How can I build the inmate or the .cell file? I found in /jailhouse-mast=
er/configs/x86 c files, object files and .cell files but the procedure to b=
uild a customised image is not still clear to me. I read your reply on jail=
house-dev.narkive.com and I think I should use "jailhouse config create" to=
 build an inmate. I would appreciate any help or any information regarding =
this question.=20

Thanks in advance
Moustafa Noufale


-----Urspr=C3=BCngliche Nachricht-----
Von: Jan Kiszka <jan.kiszka@web.de>=20
Gesendet: Sonntag, 25. April 2021 12:30
An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>; Ralf Ramsauer <ralf=
.ramsauer@oth-regensburg.de>; jailhouse-dev@googlegroups.com
Betreff: Re: [EXT] AW: AW: Inquiry

On 25.04.21 12:20, Moustafa Noufale wrote:
> Hi Mr. Kiszka,
> I have one machine with:
> Intel(R) Core(TM) i7-7700HQ CPU @ 2.80GHz The setup is win10-> Ubuntu=20
> 20 on VMware and I found this while running lscpu:
> Vulnerability Itlb multihit:     KVM: Mitigation: VMX disabled
> Vulnerability L1tf:              Mitigation; PTE Inversion; VMX flush not=
 necessary, SMT disabled
>

VMware does not provide sufficient VT-x virtualization, plus things would b=
ecome too slow with three levels of virtualization (VMware -> KVM
-> Jailhouse). Run Linux with KVM natively.

> The other machine has Ubuntu 18.
> Intel(R) Core(TM) i7-7500U CPU @ 2.70GHz
>
> Both have virtualization VT-x.
>
> I think that I do not simply have access to enabling VT-x from Bios setti=
ngs.

Here, Ubuntu is running natively? And you still have VT-x but not APIC virt=
ualization according to jailhouse hardware check? That would be extremely w=
eird because it's a CPU from 2016 which has all required features to my bes=
t knowledge.

>
> I am thinking of buying a Pi4 and try Jailhouse on real hardware, would t=
hat be a good idea?

It's an architectural switch (not sure which role the arch plays in your
studies) but you will definitely overcome that host OS issue and have reali=
stic benchmark numbers.

Jan

>
> Thanks in advance
>
> -----Urspr=C3=BCngliche Nachricht-----
> Von: Jan Kiszka <jan.kiszka@web.de>
> Gesendet: Sonntag, 25. April 2021 12:05
> An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>; Ralf Ramsauer=20
> <ralf.ramsauer@oth-regensburg.de>; jailhouse-dev@googlegroups.com
> Betreff: Re: [EXT] AW: AW: Inquiry
>
> On 25.04.21 11:32, Moustafa Noufale wrote:
>> Yes, the machine is working and jailhouse is present in the list of Modu=
les. However, when I run this command:
>> jailhouse enable /etc/jailhouse/qemu-x86.cell I get on the QEMU side "
>> Input/output error"
>>
>> and on the terminal:
>> Initializing Jailhouse hypervisor v0.12 (0-g92db71f2-dirty) on CPU 2=20
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
>> An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>; Jan Kiszka=20
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
>> https://github.com/siemens/jailhouse-images/blob/master/recipes-core/
>> c
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
>>> An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>; Jan Kiszka=20
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
>>>>> I am a Master student in Rostock University and I am studying=20
>>>>> Jailhouse this semester as a Master project and I would like to=20
>>>>> gather information about this Hypervisor, as well as I would like=20
>>>>> to ask, whether it is possible to install it on an Ubuntu Virtual=20
>>>>> Machine? I just need an outline, how I can learn it. I spent today=20
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
>>>> https://events.static.linuxfound.org/sites/events/files/slides/ELCE
>>>> 2
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
jailhouse-dev/c53790d5ecf3411cb1990106e9663ecc%40uni-rostock.de.
