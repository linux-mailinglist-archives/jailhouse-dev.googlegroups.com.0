Return-Path: <jailhouse-dev+bncBC7PTOEB2ALRBGXNVWCAMGQE6SEKVMI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf39.google.com (mail-qv1-xf39.google.com [IPv6:2607:f8b0:4864:20::f39])
	by mail.lfdr.de (Postfix) with ESMTPS id 656E436F456
	for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Apr 2021 05:16:43 +0200 (CEST)
Received: by mail-qv1-xf39.google.com with SMTP id d11-20020a0cdb0b0000b02901c0da4391d5sf4656897qvk.12
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Apr 2021 20:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=f0Y4vw1IPQN3M01Jo7rA3AHtslMhRkeyPpiTzWFQ04c=;
        b=PJVMkYZ/BAGlE+4w/vaN5wNpM5C6bVzSbCjBQARmza2r5PgmnW8aJRsfVF7Wxz7yTr
         FXB+tKaHpRF6xXaQPYz+Jb4l83K3YN/kr+ZKO2NBtbKTtDuEWmVpIO4UeyOfyd2bjHbm
         J9aWfdOfJWU0YByFc/HZHKdUpwoCPCPXmQaW5+JuqjuAxtKV1lEC9tLXd0l9X2nXflj8
         biv9wAF+ke3hNlqGQ+kzWZukU2JEnXGPuHhqIuFRcdVbs7WjBYViHwSlhbMuafvm2Rzw
         gfhyTZZcsd0i7kCcmQJQcp1bbuG4wbgQ5tE+PAES3GHjV7HQZJmXd+AMz7ep0VirjrQ0
         YhPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=f0Y4vw1IPQN3M01Jo7rA3AHtslMhRkeyPpiTzWFQ04c=;
        b=td2CVfcPA1K6hdeakk+5tw0l6NTpZHAPxJU5P9mHFRgKRNRrE4uWgEz0wwsdcThGm8
         YT6szjRyqFeQweJozfQ59S+yJfKbPACb0kpqmDDw+cisncAAvr2K/yi1qmXyJj3+Hq6q
         ZvZYmhoRxuwiQWNVL+EeGuGdEOzvo5fkRT1lnDA5000UvtkJqSH89pogYdyXa9wmQRbu
         D3LGYiIFkhXVXxuwWp9CVGnPLG+bVXNH0t929LjinexBajbZA8CUYSrkBFVvb/NMi1kQ
         7fnsEHCiy9E92ntmH08raOR8vqaMsNQEmFhT/uvXtg8y0t8Kz6dagj+deVbMxeMSfKUI
         5TkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=f0Y4vw1IPQN3M01Jo7rA3AHtslMhRkeyPpiTzWFQ04c=;
        b=dzkHDrnd2WsdKTBWdN3BQHoETEJO1hmvAZPWUN0JBw2agXSy22wlP3hFvZlyVJ/7Xn
         jQ9H/QGOGh7qjsIlRjtdtqsEb3ADrKzdpgvPJosvQJNSH6zyFEogiJ2koHww00JwD+Tt
         tf4pGBUERURtoSdY2NVfxK54JMedjmmvFTIcoNib3eoRxH5v4/toeTRVqftM+T07goug
         CaXhRtm4t+SHSFovXdc4y/hEbksWzLRal9e8mIVi1kdtxJMHb6AA+kPzchE1cf7oa9fK
         WJUBtH/o+YjGbRpJmYQKo8KMJ8q/DuJNKpugBSFyYA88aC4zN+BkYxUcAwEkSFDDfhvc
         HYBQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532WkItO0INMFSxUY6HJ21o5KuI8dqIy/rVegxRAbTsrt9HNHuZw
	hrU89+zC36FfzrnlEcM7vCQ=
X-Google-Smtp-Source: ABdhPJxYHCU2J3+gLSsJXuJeEAH3cCFahhMV2SyIJZTVDKWjCdA6L8QH/gbxB2KlHZvwgKlWQ3M2Bg==
X-Received: by 2002:a37:7ec2:: with SMTP id z185mr3178945qkc.467.1619752602513;
        Thu, 29 Apr 2021 20:16:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ae9:ec17:: with SMTP id h23ls2956859qkg.2.gmail; Thu, 29 Apr
 2021 20:16:42 -0700 (PDT)
X-Received: by 2002:a37:b5c5:: with SMTP id e188mr3102976qkf.144.1619752601950;
        Thu, 29 Apr 2021 20:16:41 -0700 (PDT)
Date: Thu, 29 Apr 2021 20:16:41 -0700 (PDT)
From: along li <v6543210@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <f61a2abb-93fa-45cd-9c56-d967dd3a0247n@googlegroups.com>
In-Reply-To: <0a541a67-4abc-cce6-f677-7b4a1b86b99e@siemens.com>
References: <254a573f-0b4a-4c6e-a5d5-19d0734cf6ebn@googlegroups.com>
 <20a0834c-e41a-855c-71b3-2fea4ff89d14@siemens.com>
 <72da73c0-f3ae-41da-af32-d81c26a5b884n@googlegroups.com>
 <0a541a67-4abc-cce6-f677-7b4a1b86b99e@siemens.com>
Subject: Re: how to run linux with root in none root cell ?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_68_629345371.1619752601415"
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

------=_Part_68_629345371.1619752601415
Content-Type: multipart/alternative; 
	boundary="----=_Part_69_1405686959.1619752601415"

------=_Part_69_1405686959.1619752601415
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

after I=20
learned  https://github.com/siemens/jailhouse/blob/master/Documentation/int=
er-cell-communication.md
I can' find   virtio-ivshmem-console and   virtio-ivshmem-block ...
where is these two program

=E5=9C=A82021=E5=B9=B44=E6=9C=8827=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UTC+=
8 =E4=B8=8B=E5=8D=887:49:08<j.kiszka...@gmail.com> =E5=86=99=E9=81=93=EF=BC=
=9A

> On 27.04.21 11:57, along li wrote:
> > will you  share some indirection to help using  virtio-block ?  Thanks
> > very much.
> >=20
>
> Did you study
>
> https://github.com/siemens/jailhouse/blob/master/Documentation/inter-cell=
-communication.md
> already, how far that can take you?
>
> Regarding jailhouse-images, I'm unfortunately lacking time to do that in
> the next future. My jailhouse to-do list has some other, urgent issues
> for now (not to speak of my general to-do list...).
>
> Jan
>
> > =20
> > =E5=9C=A82021=E5=B9=B43=E6=9C=882=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C U=
TC+8 =E4=B8=8A=E5=8D=881:30:15<j.kiszka...@gmail.com> =E5=86=99=E9=81=93=EF=
=BC=9A
> >=20
> > On 25.02.21 13:32, Smith li wrote:
> > > Dear Community,
> > >         I have compile the jailhouse-images repository, and run
> > the demo.
> > >
> > >   the command to start linux in a cell is like this:
> > >
> > > #jailhouse cell linux /etc/jailhouse/rpi4-linux-demo.cell \
> > >                         /boot/vmlinuz* \
> > >                         -d /etc/jailhouse/dts/inmate-rpi4.dtb \
> > >                         -i /usr/libexec/jailhouse/demos/rootfs.cpio \
> > >                         -c "console=3DttyS0,115200 ip=3D192.168.19.2"
> > >
> > > What I want to know is : how to set the root to a dir or disk ?
> > >
> > > I see some   use   root=3D/dev/nfs   ip=3D192.168.1.1::****** :eth0=
=20
> > in this
> > > page.
> > >
> > [1]
> https://groups.google.com/g/jailhouse-dev/c/vXD4tzCPDG4/m/zX_hHNxJAgAJ
> > <https://groups.google.com/g/jailhouse-dev/c/vXD4tzCPDG4/m/zX_hHNxJAgAJ=
>
> >=20
> > >
> > > Can't we set the linux root to a disk partition or a dir ?
> > > Will somebody tell me ?
> > > Thanks very much !
> >=20
> >=20
> > Jailhouse does not provide regular virtual devices like other
> > hypervisors. Everything is mapped to shared memory devices.
> >=20
> > You may use network-based storage for the non-root cell, nfs as
> > suggested above or nbd. There is also experimental virtio-block, backed
> > by a simplistic process in the root cell. But integration into
> > jailhouse-images is missing, so trying that out can be tough.
> >=20
> > Jan
> >=20
> > --=20
> > Siemens AG, T RDA IOT
> > Corporate Competence Center Embedded Linux
> >=20
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
jailhouse-dev/f61a2abb-93fa-45cd-9c56-d967dd3a0247n%40googlegroups.com.

------=_Part_69_1405686959.1619752601415
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>after I learned&nbsp;&nbsp;https://github.com/siemens/jailhouse/blob/m=
aster/Documentation/inter-cell-communication.md</div><div>I can' find&nbsp;=
 &nbsp;virtio-ivshmem-console and&nbsp; &nbsp;virtio-ivshmem-block ...</div=
>where is these two program<br><div><br></div><div class=3D"gmail_quote"><d=
iv dir=3D"auto" class=3D"gmail_attr">=E5=9C=A82021=E5=B9=B44=E6=9C=8827=E6=
=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UTC+8 =E4=B8=8B=E5=8D=887:49:08&lt;j.kisz=
ka...@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A<br/></div><blockquote class=3D=
"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204,=
 204, 204); padding-left: 1ex;">On 27.04.21 11:57, along li wrote:
<br>&gt; will you=C2=A0 share some indirection to help using=C2=A0 virtio-b=
lock ?=C2=A0 Thanks
<br>&gt; very much.
<br>&gt;=20
<br>
<br>Did you study
<br><a href=3D"https://github.com/siemens/jailhouse/blob/master/Documentati=
on/inter-cell-communication.md" target=3D"_blank" rel=3D"nofollow" data-saf=
eredirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://githu=
b.com/siemens/jailhouse/blob/master/Documentation/inter-cell-communication.=
md&amp;source=3Dgmail&amp;ust=3D1619837678022000&amp;usg=3DAFQjCNGgN4spXCJJ=
ZAktNaSf8s0MvmRVVg">https://github.com/siemens/jailhouse/blob/master/Docume=
ntation/inter-cell-communication.md</a>
<br>already, how far that can take you?
<br>
<br>Regarding jailhouse-images, I&#39;m unfortunately lacking time to do th=
at in
<br>the next future. My jailhouse to-do list has some other, urgent issues
<br>for now (not to speak of my general to-do list...).
<br>
<br>Jan
<br>
<br>&gt; =C2=A0
<br>&gt; =E5=9C=A82021=E5=B9=B43=E6=9C=882=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=
=8C UTC+8 =E4=B8=8A=E5=8D=881:30:15&lt;<a href data-email-masked rel=3D"nof=
ollow">j.kiszka...@gmail.com</a>&gt; =E5=86=99=E9=81=93=EF=BC=9A
<br>&gt;=20
<br>&gt;     On 25.02.21 13:32, Smith li wrote:
<br>&gt;     &gt; Dear Community,
<br>&gt;     &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 I have compile the jailhouse-=
images repository, and run
<br>&gt;     the demo.
<br>&gt;     &gt;
<br>&gt;     &gt; =C2=A0 the command to start linux in a cell is like this:
<br>&gt;     &gt;
<br>&gt;     &gt; #jailhouse cell linux /etc/jailhouse/rpi4-linux-demo.cell=
 \
<br>&gt;     &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /boot/vmlinuz* \
<br>&gt;     &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -d /etc/jailhouse/dts/inmate-rpi4.dtb \
<br>&gt;     &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -i /usr/libexec/jailhouse/demos/rootfs.cpio \
<br>&gt;     &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot;console=3DttyS0,115200 ip=3D192.168.19=
.2&quot;
<br>&gt;     &gt;
<br>&gt;     &gt; What I want to know is : how to set the root to a dir or =
disk ?
<br>&gt;     &gt;
<br>&gt;     &gt; I see some=C2=A0 =C2=A0use=C2=A0 =C2=A0root=3D/dev/nfs=C2=
=A0 =C2=A0ip=3D192.168.1.1::****** :eth0=C2=A0
<br>&gt;     in this
<br>&gt;     &gt; page.
<br>&gt;     &gt;
<br>&gt;     [1]<a href=3D"https://groups.google.com/g/jailhouse-dev/c/vXD4=
tzCPDG4/m/zX_hHNxJAgAJ" target=3D"_blank" rel=3D"nofollow" data-saferedirec=
turl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://groups.google=
.com/g/jailhouse-dev/c/vXD4tzCPDG4/m/zX_hHNxJAgAJ&amp;source=3Dgmail&amp;us=
t=3D1619837678023000&amp;usg=3DAFQjCNFEfTEhq8Zdoc-BRf3UfC9bVc34Yg">https://=
groups.google.com/g/jailhouse-dev/c/vXD4tzCPDG4/m/zX_hHNxJAgAJ</a>
<br>&gt;     &lt;<a href=3D"https://groups.google.com/g/jailhouse-dev/c/vXD=
4tzCPDG4/m/zX_hHNxJAgAJ" target=3D"_blank" rel=3D"nofollow" data-saferedire=
cturl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://groups.googl=
e.com/g/jailhouse-dev/c/vXD4tzCPDG4/m/zX_hHNxJAgAJ&amp;source=3Dgmail&amp;u=
st=3D1619837678023000&amp;usg=3DAFQjCNFEfTEhq8Zdoc-BRf3UfC9bVc34Yg">https:/=
/groups.google.com/g/jailhouse-dev/c/vXD4tzCPDG4/m/zX_hHNxJAgAJ</a>&gt;
<br>&gt;=20
<br>&gt;     &gt;
<br>&gt;     &gt; Can&#39;t we set the linux root to a disk partition or a =
dir ?
<br>&gt;     &gt; Will somebody tell me ?
<br>&gt;     &gt; Thanks very much !
<br>&gt;=20
<br>&gt;=20
<br>&gt;     Jailhouse does not provide regular virtual devices like other
<br>&gt;     hypervisors. Everything is mapped to shared memory devices.
<br>&gt;=20
<br>&gt;     You may use network-based storage for the non-root cell, nfs a=
s
<br>&gt;     suggested above or nbd. There is also experimental virtio-bloc=
k, backed
<br>&gt;     by a simplistic process in the root cell. But integration into
<br>&gt;     jailhouse-images is missing, so trying that out can be tough.
<br>&gt;=20
<br>&gt;     Jan
<br>&gt;=20
<br>&gt;     --=20
<br>&gt;     Siemens AG, T RDA IOT
<br>&gt;     Corporate Competence Center Embedded Linux
<br>&gt;=20
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
om/d/msgid/jailhouse-dev/f61a2abb-93fa-45cd-9c56-d967dd3a0247n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/f61a2abb-93fa-45cd-9c56-d967dd3a0247n%40googlegroups.co=
m</a>.<br />

------=_Part_69_1405686959.1619752601415--

------=_Part_68_629345371.1619752601415--
