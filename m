Return-Path: <jailhouse-dev+bncBC7PTOEB2ALRBJ6AT6CAMGQEJFVJM7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x839.google.com (mail-qt1-x839.google.com [IPv6:2607:f8b0:4864:20::839])
	by mail.lfdr.de (Postfix) with ESMTPS id 025E936C238
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Apr 2021 11:58:01 +0200 (CEST)
Received: by mail-qt1-x839.google.com with SMTP id a11-20020ac85b8b0000b02901a69faebe0csf22895621qta.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Apr 2021 02:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oRTpQha7j9sddw2YLvpjoz/5Xg1v7JVU1SgNmvSCNV0=;
        b=TZSi2Ub23HmH0DGojzu60YkyBMem7EWaFPYkVw7IYYXzsW58NYyV+vdRoTnEf6Ak4Q
         eMb+lXKhJWhBVSAHBs8Ca41ZMlkA7eNQOExn7PFQR11eJ/R+CWcUGKJ0nr6KKMM8tam1
         0PfRnx2JuACnZjyv8jYOX9qYyMMT6EzKeqpWcjAAuX1Gapddz6qR1p5QAWmvb/2ip0n2
         Juazja8gHlQRwki8CiinWjnYtZToPOFeFfXyb3bFfrJjqWpIH7OOlDYJe/ULNom8mA7M
         lxtiZybDFzoznBPpNCl0Jr2/Sow6UffGp1iGCvBdmEKr9uvAH5DgNjb5JaOv0T+lnh6N
         UjIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oRTpQha7j9sddw2YLvpjoz/5Xg1v7JVU1SgNmvSCNV0=;
        b=ow9FjnLEzpjFsIXPy0qiOvdyJNkv/s0y+8nL/cvbQHEGfeT7RxJRvJeSoHGEkRNCum
         cun5jmJnH4x6QLEXuSoY0d3s9qyyIMQeOlPfrBI/2dkivavmhCo/tK97GgeqvTtQsAPI
         d/2EaXE+dEp5SBs1BdpC9V7P23vkIKam8GGl2uvEujKKQ+tBPThMdnZlK86txedaXUru
         kN4aZXoST88gjGglHnygaVJ7GphjSOQPR7c/aM3BpYd7aAy5hrNBuz4aOAvVrEohU1mf
         3xmqcgPkqF2VS1Z9VSniMkEdq1z+adZHR2ajlVK4snVHawmFFIZRkkzS668xw6RWULVK
         JguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=oRTpQha7j9sddw2YLvpjoz/5Xg1v7JVU1SgNmvSCNV0=;
        b=iYCh3ZHBl17KE5jDjwziAJHPhMg87jwznpI22uP0TT7qMdvV9noLPW48xNyYIPTSJz
         +BAUfP+6wC0t065jmG66Smx3dn0ofPnHA7g5vUInOp93CRYnUy/5Kyf/10eLC+8Ahd3V
         +xpNQGrFAXnkp2qh8PhSzAhR+k4FG54K/ZAq4clYkuzDZrqOfLAd+RedesEoHrIFGuhf
         mFKr54CsmpJ19VLjam2ULnJV9Pfm+BRFl4hHe7fIm4VsggWfCkr0OAQu47++yY1TQJXA
         R8lZMsHm+zRmm6Y8mg6M1BKIORAUnus6sXJG5shJK0dm2NZBOfiW/DDNWpFKQb1M2+5G
         2Dqg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531ICxad4bwBdmplYjIBS7xhzwMFliRJN//l5HNHvdTRb8i98a7W
	n73UswErW+3wLzw6zy5Vwcw=
X-Google-Smtp-Source: ABdhPJyTHT1OanNjB1sYDF27Tm84aCngyB2YZu2i3vLMlg1aDTdFNofTyNw99XR+15t2FmCKXrBXmA==
X-Received: by 2002:a37:6606:: with SMTP id a6mr21717938qkc.165.1619517480050;
        Tue, 27 Apr 2021 02:58:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:7a82:: with SMTP id v124ls11012390qkc.3.gmail; Tue, 27
 Apr 2021 02:57:59 -0700 (PDT)
X-Received: by 2002:a05:620a:712:: with SMTP id 18mr21893579qkc.115.1619517479468;
        Tue, 27 Apr 2021 02:57:59 -0700 (PDT)
Date: Tue, 27 Apr 2021 02:57:59 -0700 (PDT)
From: along li <v6543210@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <72da73c0-f3ae-41da-af32-d81c26a5b884n@googlegroups.com>
In-Reply-To: <20a0834c-e41a-855c-71b3-2fea4ff89d14@siemens.com>
References: <254a573f-0b4a-4c6e-a5d5-19d0734cf6ebn@googlegroups.com>
 <20a0834c-e41a-855c-71b3-2fea4ff89d14@siemens.com>
Subject: Re: how to run linux with root in none root cell ?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_136_2058840233.1619517479002"
X-Original-Sender: v6543210@gmail.com
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

------=_Part_136_2058840233.1619517479002
Content-Type: multipart/alternative; 
	boundary="----=_Part_137_1557455140.1619517479002"

------=_Part_137_1557455140.1619517479002
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

will you  share some indirection to help using  virtio-block ?  Thanks very=
=20
much.

=20
=E5=9C=A82021=E5=B9=B43=E6=9C=882=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UTC+8=
 =E4=B8=8A=E5=8D=881:30:15<j.kiszka...@gmail.com> =E5=86=99=E9=81=93=EF=BC=
=9A

> On 25.02.21 13:32, Smith li wrote:
> > Dear Community,
> >         I have compile the jailhouse-images repository, and run the dem=
o.
> >=20
> >   the command to start linux in a cell is like this:
> >=20
> > #jailhouse cell linux /etc/jailhouse/rpi4-linux-demo.cell \
> >                         /boot/vmlinuz* \
> >                         -d /etc/jailhouse/dts/inmate-rpi4.dtb \
> >                         -i /usr/libexec/jailhouse/demos/rootfs.cpio \
> >                         -c "console=3DttyS0,115200 ip=3D192.168.19.2"
> >=20
> > What I want to know is : how to set the root to a dir or disk ?
> >=20
> > I see some   use   root=3D/dev/nfs   ip=3D192.168.1.1::****** :eth0  in=
 this
> > page.
> > [1]
> https://groups.google.com/g/jailhouse-dev/c/vXD4tzCPDG4/m/zX_hHNxJAgAJ
> >=20
> > Can't we set the linux root to a disk partition or a dir ?
> > Will somebody tell me ?
> > Thanks very much !
>
>
> Jailhouse does not provide regular virtual devices like other
> hypervisors. Everything is mapped to shared memory devices.
>
> You may use network-based storage for the non-root cell, nfs as
> suggested above or nbd. There is also experimental virtio-block, backed
> by a simplistic process in the root cell. But integration into
> jailhouse-images is missing, so trying that out can be tough.
>
> Jan
>
> --=20
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/72da73c0-f3ae-41da-af32-d81c26a5b884n%40googlegroups.com.

------=_Part_137_1557455140.1619517479002
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

will you&nbsp; share some indirection to help using&nbsp; virtio-block ?&nb=
sp; Thanks very much.<div><br>&nbsp;</div><div class=3D"gmail_quote"><div d=
ir=3D"auto" class=3D"gmail_attr">=E5=9C=A82021=E5=B9=B43=E6=9C=882=E6=97=A5=
=E6=98=9F=E6=9C=9F=E4=BA=8C UTC+8 =E4=B8=8A=E5=8D=881:30:15&lt;j.kiszka...@=
gmail.com> =E5=86=99=E9=81=93=EF=BC=9A<br/></div><blockquote class=3D"gmail=
_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, =
204); padding-left: 1ex;">On 25.02.21 13:32, Smith li wrote:
<br>&gt; Dear Community,
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 I have compile the jailhouse-images re=
pository, and run the demo.
<br>&gt;=20
<br>&gt; =C2=A0 the command to start linux in a cell is like this:
<br>&gt;=20
<br>&gt; #jailhouse cell linux /etc/jailhouse/rpi4-linux-demo.cell \
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /boot/vmlinuz* \
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 -d /etc/jailhouse/dts/inmate-rpi4.dtb \
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 -i /usr/libexec/jailhouse/demos/rootfs.cpio \
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 -c &quot;console=3DttyS0,115200 ip=3D192.168.19.2&quot;
<br>&gt;=20
<br>&gt; What I want to know is : how to set the root to a dir or disk ?
<br>&gt;=20
<br>&gt; I see some=C2=A0 =C2=A0use=C2=A0 =C2=A0root=3D/dev/nfs=C2=A0 =C2=
=A0ip=3D192.168.1.1::****** :eth0=C2=A0 in this
<br>&gt; page.
<br>&gt; [1]<a href=3D"https://groups.google.com/g/jailhouse-dev/c/vXD4tzCP=
DG4/m/zX_hHNxJAgAJ" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://groups.google.com=
/g/jailhouse-dev/c/vXD4tzCPDG4/m/zX_hHNxJAgAJ&amp;source=3Dgmail&amp;ust=3D=
1619603124332000&amp;usg=3DAFQjCNGp38whWh7sxRiWAnqiZGFV7f_AHA">https://grou=
ps.google.com/g/jailhouse-dev/c/vXD4tzCPDG4/m/zX_hHNxJAgAJ</a>
<br>&gt;=20
<br>&gt; Can&#39;t we set the linux root to a disk partition or a dir ?
<br>&gt; Will somebody tell me ?
<br>&gt; Thanks very much !
<br>
<br>
<br>Jailhouse does not provide regular virtual devices like other
<br>hypervisors. Everything is mapped to shared memory devices.
<br>
<br>You may use network-based storage for the non-root cell, nfs as
<br>suggested above or nbd. There is also experimental virtio-block, backed
<br>by a simplistic process in the root cell. But integration into
<br>jailhouse-images is missing, so trying that out can be tough.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, T RDA IOT
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/72da73c0-f3ae-41da-af32-d81c26a5b884n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/72da73c0-f3ae-41da-af32-d81c26a5b884n%40googlegroups.co=
m</a>.<br />

------=_Part_137_1557455140.1619517479002--

------=_Part_136_2058840233.1619517479002--
