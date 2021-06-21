Return-Path: <jailhouse-dev+bncBDUZ5DVA4MLBBBXGX6DAMGQECHWR7GA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x737.google.com (mail-qk1-x737.google.com [IPv6:2607:f8b0:4864:20::737])
	by mail.lfdr.de (Postfix) with ESMTPS id 190893AE197
	for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Jun 2021 04:01:44 +0200 (CEST)
Received: by mail-qk1-x737.google.com with SMTP id m133-20020a37a38b0000b02903adaf1dd081sf12461265qke.14
        for <lists+jailhouse-dev@lfdr.de>; Sun, 20 Jun 2021 19:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=f7v+T472BRkXs4dj23UFc52zMNk96EWyQrrXGjg4ecc=;
        b=KXcQmOpZFTcOymKF8TO5uF3uNIwZQ8QmyIYbM2tMvcHDXCe8WzWq00nrTr6iYHIb41
         PLjJCd9DWQsyLnfJM7BrcLDDZnFIPqbWI2FQtjOe5yqC4Is2Nf3ihUVrl2+8nILIBuCa
         VFwn+L/gvFy1KdBjS9X4HMC9a9RnvxKDPXC7osK5uqpgYPREam1H+GkR9ksCz1M983wM
         XhHaYokjnXHXKC0X1Hs/8mV3wlUfg/7J65+HrS8xkcJz8zgdly2qghvCyPNEkrFdDvnW
         R3JvkDvnpTpVWqiCVaHMoQqkm53oDvcqIEoOJfE2/cOkzs1EY4oxb+ONk8MHJUSH/GM/
         0yAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=f7v+T472BRkXs4dj23UFc52zMNk96EWyQrrXGjg4ecc=;
        b=gIEUdihuWabADd8Nx9RMJNsTvpmGVjvqg07XHzEB8K2f2Og0VX4UQqV/s42fohHR5K
         p4iF7KTlSHPXhlsnYLS/yN+eMucQN9ItxnLpQnF6ewgjHaSneF1PHK0c7QCsX+qnG1fK
         NymMouK8MrZ7acqSMojfXLIWWYw8LZt1APBh0yg1wNxQ3oF6ZXz9HJmUvHBoCXFkrARh
         4WqUq5/Jsd6tOxfncTxon+9AqomsdjupHVlxGnnN+dKimhIYYxlPPjOJgFH6yIVwbub5
         6jZ3zrIylN72iuruKq3OG5RvJxyM+C2w7HpCXspOxED9MMba684+ggVnuRJhl7hwjFnx
         fOdw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531xPKkQl8Td2gRUHoziB5ltbOzOcJBsB+XryxhBA/xUVcyZPvvG
	wJ4uGwrbESLLQ7I6deul7LU=
X-Google-Smtp-Source: ABdhPJx/IIZX2VH/Y8l4fPzwoADXjKFgSeq3FSoUfnFjctgNgjfJ5hIaYGNmO3pCFo4noEN+dk8efw==
X-Received: by 2002:a37:4096:: with SMTP id n144mr20377276qka.271.1624240902583;
        Sun, 20 Jun 2021 19:01:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:1a9a:: with SMTP id bl26ls9090932qkb.1.gmail; Sun,
 20 Jun 2021 19:01:41 -0700 (PDT)
X-Received: by 2002:a37:a0d:: with SMTP id 13mr20776679qkk.47.1624240901717;
        Sun, 20 Jun 2021 19:01:41 -0700 (PDT)
Date: Sun, 20 Jun 2021 19:01:41 -0700 (PDT)
From: li cheng <lchina77@163.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <0b960257-f636-4099-a6a7-57351b764a4bn@googlegroups.com>
In-Reply-To: <22027535-f38c-4c79-81f8-596924ede969n@googlegroups.com>
References: <22027535-f38c-4c79-81f8-596924ede969n@googlegroups.com>
Subject: Re: Failed to compile jailhouse-images for rpi4
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4956_1155336230.1624240901072"
X-Original-Sender: lchina77@163.com
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

------=_Part_4956_1155336230.1624240901072
Content-Type: multipart/alternative; 
	boundary="----=_Part_4957_1122866442.1624240901072"

------=_Part_4957_1122866442.1624240901072
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

$ sudo find build/tmp/ -name proc
build/tmp/work/jailhouse-demo-arm64/buildchroot-host/1.0-r0/rootfs/proc
build/tmp/work/jailhouse-demo-arm64/isar-bootstrap-target/1.0-r0/rootfs/pro=
c
build/tmp/work/jailhouse-demo-arm64/isar-bootstrap-host/1.0-r0/rootfs/proc
build/tmp/work/jailhouse-demo-arm64/linux-jailhouse/5.10.31-r0/linux-eb6927=
f7eea77f823b96c0c22ad9d4a2d7ffdfce/fs/proc
build/tmp/work/jailhouse-demo-arm64/linux-jailhouse/5.10.31-r0/linux-eb6927=
f7eea77f823b96c0c22ad9d4a2d7ffdfce/tools/testing/selftests/proc

which one should be suitable for BUILDCHROOT_DIR ?   And  how should I=20
specify it ?

Thanks.

=E5=9C=A82021=E5=B9=B46=E6=9C=8818=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94 UTC+=
8 =E4=B8=8A=E5=8D=8810:51:52<li cheng> =E5=86=99=E9=81=93=EF=BC=9A

> I tried to generate jailhouse images for raspberry 4 on my ubuntu 16.04, =
=20
> the kernel is 4.4 and kvm_intel module loaded with parameter `nested=3D1`=
.
>
>  $ uname -r
> 4.4.0-210-generic
> $ lsmod |grep kvm
> kvm_intel             176128  0
> kvm                   561152  1 kvm_intel
> irqbypass              16384  1 kvm
>
> Then  I ran "build-images.sh" and selected "12: Raspberry Pi 4 (1-8 GB=20
> editions)" , but failed.
> The build log and debootstrap.log were attatched.
>
>  "| W: Failure trying to run:  mount -t proc proc /proc" ,   but I found=
=20
> "mount -t proc none '${BUILDCHROOT_DIR}/proc'"  in=20
> the  isar/meta/classes/buildchroot.bbclass.
>
> So  it seems that I need to set BUILDCHROOT_DIR ?   If yes  when and how=
=20
> should I set it ?
>
> Thanks.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0b960257-f636-4099-a6a7-57351b764a4bn%40googlegroups.com.

------=_Part_4957_1122866442.1624240901072
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>$ sudo find build/tmp/ -name proc</div><div>build/tmp/work/jailhouse-d=
emo-arm64/buildchroot-host/1.0-r0/rootfs/proc</div><div>build/tmp/work/jail=
house-demo-arm64/isar-bootstrap-target/1.0-r0/rootfs/proc</div><div>build/t=
mp/work/jailhouse-demo-arm64/isar-bootstrap-host/1.0-r0/rootfs/proc</div><d=
iv>build/tmp/work/jailhouse-demo-arm64/linux-jailhouse/5.10.31-r0/linux-eb6=
927f7eea77f823b96c0c22ad9d4a2d7ffdfce/fs/proc</div><div>build/tmp/work/jail=
house-demo-arm64/linux-jailhouse/5.10.31-r0/linux-eb6927f7eea77f823b96c0c22=
ad9d4a2d7ffdfce/tools/testing/selftests/proc</div><div><br></div><div>which=
 one should be suitable for BUILDCHROOT_DIR ?&nbsp; &nbsp;And&nbsp; how sho=
uld I specify it ?</div><div><br></div><div>Thanks.</div><br><div class=3D"=
gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">=E5=9C=A82021=E5=B9=B46=
=E6=9C=8818=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94 UTC+8 =E4=B8=8A=E5=8D=8810:=
51:52&lt;li cheng> =E5=86=99=E9=81=93=EF=BC=9A<br/></div><blockquote class=
=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(2=
04, 204, 204); padding-left: 1ex;">I tried to generate jailhouse images for=
 raspberry 4 on my ubuntu 16.04,=C2=A0 the kernel is 4.4 and=C2=A0kvm_intel=
 module loaded with parameter `nested=3D1`.<div><br></div><div>=C2=A0$ unam=
e -r</div><div>4.4.0-210-generic</div><div><div>$ lsmod |grep kvm</div><div=
>kvm_intel=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0176128=C2=A0 0</d=
iv><div>kvm=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0561152=C2=A0 1 kvm_intel</div><div>irqbypass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 16384=C2=A0 1 kvm</div></div><div><br></div><div>T=
hen=C2=A0 I ran &quot;build-images.sh&quot; and selected &quot;12: Raspberr=
y Pi 4 (1-8 GB editions)&quot; , but failed.</div><div>The build log and=C2=
=A0debootstrap.log were attatched.</div><div><br></div><div>=C2=A0&quot;| W=
: Failure trying to run:=C2=A0 mount -t proc proc /proc&quot; ,=C2=A0 =C2=
=A0but I found &quot;mount -t proc none &#39;${BUILDCHROOT_DIR}/proc&#39;&q=
uot;=C2=A0 in the=C2=A0=C2=A0isar/meta/classes/buildchroot.bbclass.</div><d=
iv><br></div><div>So=C2=A0 it seems that I need to set BUILDCHROOT_DIR ?=C2=
=A0 =C2=A0If yes=C2=A0 when and how should I set it ?</div><div><br></div><=
div>Thanks.</div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/0b960257-f636-4099-a6a7-57351b764a4bn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/0b960257-f636-4099-a6a7-57351b764a4bn%40googlegroups.co=
m</a>.<br />

------=_Part_4957_1122866442.1624240901072--

------=_Part_4956_1155336230.1624240901072--
