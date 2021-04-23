Return-Path: <jailhouse-dev+bncBAABBREMROCAMGQEHWFPJDQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id D01A23692A8
	for <lists+jailhouse-dev@lfdr.de>; Fri, 23 Apr 2021 15:06:12 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id j72-20020adf914e0000b02901073cdd9d65sf5539299wrj.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 23 Apr 2021 06:06:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1619183172; cv=pass;
        d=google.com; s=arc-20160816;
        b=QAS9T6rcawRtDfQfw5hm9aGCt3mT5cOuUM+mivpRpsCjayu+pK5/iTlKhYCFJM0/uU
         47rP/6sIjqSQRhf4AxFnacT6RdMcoK9V+D8XhW+FuZQTWyEmnC/bBHn6apTUYVrjKQKb
         JoI7gXwT/mE9LoABv4LrUJXHtIzlBoSON0BzIqNtBAVtvbgDyi300yv6CL2e8+5UQJQY
         F8eGPq/XyfOR3FxJVSUxrLojs24FFUhY1QPFUJtj9JmP4hVyTR9+9imOHOW0cP1p1oMM
         OvnhQ1Z8zAKHbZXSp71OYDuqYH8hR1ZcZR0VOxqz+B52gA4VsQ9uCFSMs6DPLX8JeWRx
         Iw4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=TDl0ul8rA5kbRIhENQIlXSp/jYE7sC7CTgtGGV8SFIo=;
        b=xoRfTrt2nS5M4xqIoa6itkEbwybu29yan05Pb+nT2Ly4tFLdDBQXBhf+yMl0ld4jmU
         grKaQAMTzm6LTX5pdRn0ESb/ZPo/eRSQC05/tHZFP5rSyZJdZkVwKtbITXyrZ/IbsiIM
         qP1gqbM5V9em93qjp8BosEmdapMw1lGXXQU4OEZSVrNyj2vjtzCjfTVLJlXhQ5J5GhLW
         l4QXnXTGBcFTjW2WPtrjZxr733W+XyxH9oRHO76/GLlQSqLpgOdFGkzcJXj3gDfzvn8V
         yyhNyqr+70KoYvqvl/ijSy0DMcX4CMx9K/JnvD4Zttl7T04fs/2dPrhFc8magMXWtneG
         th/g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=neutral (no key) header.i=@uni-rostock.de header.b=L1EgQxqW;
       dkim=pass header.i=@uni-rostock.de header.s=itmz header.b=ki165J8Y;
       spf=pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.71 as permitted sender) smtp.mailfrom=moustafa.noufale@uni-rostock.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=uni-rostock.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=TDl0ul8rA5kbRIhENQIlXSp/jYE7sC7CTgtGGV8SFIo=;
        b=Dywl7RQe/XX3owEJ67IKPZmf00xW0Qgm2E8YMd6tERS6U3VcCtDXhStI3GyOC4cudM
         fbioXRn5vSosXtGS1HlAEkiJEQPr24/VZq39FLIT/raLUQ5hAtn9xd66eWmHdIzn3udm
         LOwXKdJHaPo0p4SFqcUSXGFJLmL+0uQSl2rxuHBbGXC/z3EsATrIELMjf4QYqNN9DpBC
         wPkMzI/3443ZA4+lyIRasTSaiJezQiya3p5R7Ex21JSITReanl7rpghYfEM9ZMh8AvCg
         F7fCui4MysmNKPbK3rBcF6vEZl2wMDVgFigNARVDylurHDJxF9Thz5V/gmg15aN4bF6w
         l5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=TDl0ul8rA5kbRIhENQIlXSp/jYE7sC7CTgtGGV8SFIo=;
        b=i7f27zgptjzOLGSDlLHsV5j+kcu2Q6pRq6rEExQvqAKwu8p7OP8CU9FqEFyxg1AyrN
         0KYY2mGs0rOeHB4XYEfPH2ZKh5xgiLMo3cJGoCTFrM9lke88zKjuvF+6iA5whf0vv1De
         aCBH+BG2IR6P7Y1tOoqdewYuPpaVHWBIOZzW++g91QfdJpvGzrTq0qFgWe+s3SuedRko
         3DV9+5d0q82MkOB/of2+9W+I7QTzcPQ46jbqU9aaomvj/tVLh+MZGcJivk2d+BCKmVRZ
         fIn+WDnIyrhzpBz7x7Ev1y8vv23Bcc7kKM+T9xGJuUijc4nKICaPAMrbU5PL4OJGoPZA
         Kfsg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530GAHxVbqOYKeeoHcrktOx41zU3L/psM+voHY6WLlFG6PonvbY9
	NiG3H7gZZY7wmIcAogNnPb0=
X-Google-Smtp-Source: ABdhPJxwzBadTnIccIQ4zNBdsQyheGTNY210tOdXS5nwFwSFpOGCVZ2lhu64LNZ64OJu5Zv9zBdgVA==
X-Received: by 2002:a5d:4fc7:: with SMTP id h7mr4700948wrw.23.1619183172576;
        Fri, 23 Apr 2021 06:06:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6804:: with SMTP id w4ls765634wru.2.gmail; Fri, 23 Apr
 2021 06:06:11 -0700 (PDT)
X-Received: by 2002:a5d:6648:: with SMTP id f8mr4637418wrw.76.1619183171076;
        Fri, 23 Apr 2021 06:06:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619183171; cv=none;
        d=google.com; s=arc-20160816;
        b=uXvejdsVkVvDDyiiEXeHb+EPtrBB5OFuJ+vpv2TT+twLT66soUStwZZXevbl3sqGb0
         7ArwLWvKUjVuNlrAP7qbNpxfzoQ9+igOMNHYs+Qr7aGAOxXraN5adVfORV5zkoBsPVib
         EYOqNoKM+n48GnBk28xjohWRoR1YUKZzUYrlNGSfq45xqyruksnXamzU9KTuCI0jHVnG
         8XGdqHg3kT9CdQhOBheaZH06t4YueCjMzn2Su8tgPwDeq0TEDiDgsaOBXVYbTIc/z/Ie
         7PCQTrh9B+6viTOxce5Gm7MuZm7pvRX9uo8gROjmB5qbbF1SFclRIGYaHFI6BUbIIDHC
         RosQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature:dkim-signature;
        bh=OX02z19VxHHL+jsEDg/oBY72zpUWmBLDl9dmuAdxavA=;
        b=p/XoUqNJTzTRWrNSVr4f+aTEc6/RzGT89g4zLbLcJ7bM/Duy/MGVGwYgmknAM20FqN
         4t/7Czbqu8uwg0Zt151jcVq0wkUr9leVpDfSiqlyfzMGpf3w+Xx3wwmh8F47bpe7Nmyk
         2mR1ZrNor1qIlv8e10Xx+G+pgOZS20vER1frsgqPhz98S4u2FZEWzYtR8oHtjAdRB93t
         dze90KrWiI7HRP+HET2tAn3qv7q04cE5svodFAFIRPxKNFu9G4eGaPeRioU1JTFsOqNU
         F4KRZxVC8Zvor+PzCdtdVGiwEOxmMgmE5yq2X+ZkhP+62XIIX0O2HH/0cqpTj1/3XG9q
         5XnA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=neutral (no key) header.i=@uni-rostock.de header.b=L1EgQxqW;
       dkim=pass header.i=@uni-rostock.de header.s=itmz header.b=ki165J8Y;
       spf=pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.71 as permitted sender) smtp.mailfrom=moustafa.noufale@uni-rostock.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=uni-rostock.de
Received: from mx1.uni-rostock.de (mx1.uni-rostock.de. [139.30.22.71])
        by gmr-mx.google.com with ESMTPS id s141si1999127wme.2.2021.04.23.06.06.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Apr 2021 06:06:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.71 as permitted sender) client-ip=139.30.22.71;
Received: from 139.30.22.81 by mx1.uni-rostock.de (Tls12, Aes256, Sha384,
 DiffieHellmanEllipticKey384); Fri, 23 Apr 2021 13:06:05 GMT
Received: from Pickup by email1.uni-rostock.de with Microsoft SMTP Server id
 15.2.792.3; Fri, 23 Apr 2021 13:06:02 +0000
Received: from email1.uni-rostock.de (139.30.22.81) by email1.uni-rostock.de
 (139.30.22.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Fri, 23 Apr 2021
 15:04:58 +0200
Received: from email1.uni-rostock.de ([139.30.22.81]) by email1.uni-rostock.de
 ([139.30.22.81]) with mapi id 15.02.0792.013; Fri, 23 Apr 2021 15:04:58 +0200
From: Moustafa Noufale <moustafa.noufale@uni-rostock.de>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Jan Kiszka
	<jan.kiszka@web.de>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: AW: AW: Inquiry
Thread-Topic: AW: Inquiry
Thread-Index: Adcx+AFw6wu1ws16QgaPAGku5ayIpgBZYRUAAJpN+xD//+LWgP/67wQw
Date: Fri, 23 Apr 2021 13:04:58 +0000
Message-ID: <aa35f9463dd64b96a3998e9fe84da04a@uni-rostock.de>
References: <0631a4941db6453491ffecf6c08b1cf7@uni-rostock.de>
 <61de29b4-45a2-8f3b-5937-5cac7dfc2b21@web.de>
 <879f50f352e14aa8b45e9aff399c2b02@uni-rostock.de>
 <0b2f286b-b5ed-8de9-e0a2-73af9f9cbedf@oth-regensburg.de>
In-Reply-To: <0b2f286b-b5ed-8de9-e0a2-73af9f9cbedf@oth-regensburg.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.30.77.214]
x-tm-smex-dtas-header-wtp-uuid: 51209D5CEB1DA3052110010FE95BCE7AEF6DA8AE
x-tm-smex-dtas-header-wtp-flag: BC4A395C517E27D5DC5D9D61FE921023AB71153C0004
	22edefb4-fb42-40a3-9f43-b15358742656:E86D7FA298E5BF5C91B1B1620E328B6A9CBADD
	E50000b465b9c8-0def-4788-a75c-29ddbb130440
x-tm-as-product-ver: SMEX-14.0.0.3080-8.6.1012-26108.007
x-tm-as-result: No-10--18.392300-8.000000
x-tmase-matchedrid: H3ZpYoPBtOsMPDZrnvcM98CxC+PryYbTgdkHykGcMpkNIbt2ZiH1ugcs
	lYpo5iSTVUS1uAMFpa1c7/JU/kbLPrfptZTbFVSKHTcjQ7W4FBGlY4F8r0vXP0oPLn6eZ90+Hb9
	zBU4IqPFzZZOp5uRvoguArxTmEsuQejjTBkVEGhmJUlmL3Uj0mFqYwiQV1klIol1UW7pUzfMloy
	ZPjEzgOSfk8Yb4Z8/axTyMFXEpjXE+D3J+ThgLRomR/mpCAiHdBXngI6jFvpflljQaTuDz5J8zU
	jXBpWAivVmSH63E5kuu/Aa0mckQekxeCc1JgM9Sno3qNdYltDcLN61PzIMAozP3WYNhkszlniaA
	R1vWRcUHu+tcIbtwyHlQFuqYPEsntkW+yAlBugGOjIrMSa2sRyv2BWU4g3/qNWO9z3c712Q25RE
	dh9VNPy89RmEQbeWoPrH6rrCPc98qXuKH5Jbj7PKUR83BvqItkDMTPPmeqM5snLs9lAVJv7h4BC
	KMuOnfYGbrUJqYkaHiyUbmCt6k6Js7MOmJ02HEJTy1bvT7q62IUHzw/B4qtQdY+faaPuhEEjR4+
	s2j+cT4reeZlWkKLddtIXpAlYiFyXqnoqg+EkhUB7gkgPAJsI1j+mrGi/PFiG5SvF1E1RuymVfV
	+fQLICKKFS2lK8rt+hmED59HKaHpc9QtK5eJapxVZzZr7+O7zJmqByfAaS3oJ66gQ6OdjJFtqKE
	CZLB3WEIxoVT1zFybKItl61J/ybLn+0Vm71LcGt7mdu4lvE5WdFebWIc3VsRB0bsfrpPIXzYxeQ
	R1DvtFUAAfQ52T/7NRAVfeQM3z8aEvLLm0CyrzkHqLrfVdNJhhY/2tZ7iy
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--18.392300-8.000000
x-tmase-version: SMEX-14.0.0.3080-8.6.1012-26108.007
x-tm-snts-smtp: 569B7CAC90C271E1E4A9FD18854F4D2C0367A95912DFF1B16B62B12B8E3937E72002:8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Original-Sender: moustafa.noufale@uni-rostock.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=neutral (no
 key) header.i=@uni-rostock.de header.b=L1EgQxqW;       dkim=pass
 header.i=@uni-rostock.de header.s=itmz header.b=ki165J8Y;       spf=pass
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

Hello,=20
I would like to thank you for your support and maybe you can give me a litt=
le help with building "jailhouse.ko"
I have tried make, make install with and without root in this directory "ja=
ilhouse-master/driver" and I am not sure if I am following the correct proc=
edure. What I have done so far is building an image of a virtual x-86 throu=
gh running ./build-images.sh and I can start it using ./start-qemu.sh.=20
What I have understood from the tutorial is that I have to inject jailhouse=
.ko into the kernel and then start the guest.=20
Thanks in advance
Moustafa Noufale

-----Urspr=C3=BCngliche Nachricht-----
Von: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>=20
Gesendet: Dienstag, 20. April 2021 11:39
An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>; Jan Kiszka <jan.kis=
zka@web.de>; jailhouse-dev@googlegroups.com
Betreff: Re: AW: Inquiry

Hi,

On 20/04/2021 11:29, Moustafa Noufale wrote:
> Hi Mr. Kiszka,
> I have tried to  build an image through running "build-images.sh" with an=
d without root access:
>=20
> without root access:
>=20
> Select images to build (space-separated index list): 1
> docker: Got permission denied while trying to connect to the Docker daemo=
n socket at unix:///var/run/docker.sock: Post http://%2Fvar%2Frun%2Fdocker.=
sock/v1.24/containers/create: dial unix /var/run/docker.sock: connect: perm=
ission denied.

your local user needs to be in the docker group.

> See 'docker run --help'.
>=20
> With root access:
>=20
> Select images to build (space-separated index list): 1
> Error: Running as root - may break certain recipes.
> Better give a regular user docker access. Set KAS_ALLOW_ROOT=3Dyes to ove=
rride.

Simply read the error message and follow the instructions: If you want to r=
un docker as root, you have to set KAS_ALLOW_ROOT=3Dyes to your environment=
. For good reasons: You shouldn't do that as root.

Anyway, solve the issue by adding your user to the docker group.

  Ralf

>=20
> I have installed QEMU version 5, KVM 2.2 and enabled nested virtualizatio=
n.=20
> I would really appreciate it, if you could me a hint.=20
> Thanks in advance,
> Moustafa Noufale
>=20
> -----Urspr=C3=BCngliche Nachricht-----
> Von: Jan Kiszka <jan.kiszka@web.de>
> Gesendet: Samstag, 17. April 2021 11:45
> An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>;=20
> jailhouse-dev@googlegroups.com
> Betreff: Re: Inquiry
>=20
> Hi Moustafa,
>=20
> On 16.04.21 10:29, Moustafa Noufale wrote:
>>
>> To whom it may concern,
>> I am a Master student in Rostock University and I am studying=20
>> Jailhouse this semester as a Master project and I would like to=20
>> gather information about this Hypervisor, as well as I would like to=20
>> ask, whether it is possible to install it on an Ubuntu Virtual=20
>> Machine? I just need an outline, how I can learn it. I spent today=20
>> reading the code on GitHub, but I need more information and appreciate i=
t if you can help me.
>>
>=20
> A good starting point for experiments can be the images generated by [1],=
 both for KVM VMs, pure QEMU emulation target or also real boards.
> Note that emulating target inside a VM will work but using KVM (for x86) =
may not or is at least fairly slow. I would recommend a native Linux host.
>=20
> Then you will find a lot of presentations on Jailhouse on the internet as=
 well as an (aging) tutorial on how to bring it up on new hardware.
>=20
> Jan
>=20
> [1] https://github.com/siemens/jailhouse-images
> [2]
> https://events.static.linuxfound.org/sites/events/files/slides/ELCE201
> 6-Jailhouse-Tutorial.pdf [2]=20
> https://www.youtube.com/watch?v=3D7fiJbwmhnRw
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/aa35f9463dd64b96a3998e9fe84da04a%40uni-rostock.de.
