Return-Path: <jailhouse-dev+bncBC3J54VZ4EEBBUG72GQAMGQEDWSNV7I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb37.google.com (mail-yb1-xb37.google.com [IPv6:2607:f8b0:4864:20::b37])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C70F6BEA75
	for <lists+jailhouse-dev@lfdr.de>; Fri, 17 Mar 2023 14:49:06 +0100 (CET)
Received: by mail-yb1-xb37.google.com with SMTP id e20-20020a25d314000000b00b33355abd3dsf5317529ybf.14
        for <lists+jailhouse-dev@lfdr.de>; Fri, 17 Mar 2023 06:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112; t=1679060945;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wSloxUqcb8BoRwoVAb+Smm73e8Zk3JVHNnJ8+o6rXCU=;
        b=XM+8zPjw560DxZ3I9xbBjVCvFwolhIJ1dttMRKfK5nrxmV3cXdKJO3qAgSdr4GVhN0
         s/6qXDO1OckGo+XKPW2ZJEnOnYMsAyad4nkJ3KbPoqQAv5m2kClJ3n+FG2UbkjlYCMka
         QPiQf4DRj2iwZ0NLLkE2q2C0hmldLUx3CHxg+CmTftmB1J0ZYwpnsEAb0lveqMx9qK28
         Jl8iYS9NjP0sESrtAZJDFQhw39PFlMdJM6znXCoDQhdxqS8BLlcr98iBgxbwnt7iW+cf
         KQ1LtwGcWC2ZiJ6J05SURSiZZcgQqnIDb/8C+AqB4DPEIq4shbRnBC16KdxI5GyYv+PR
         fdYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679060945;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wSloxUqcb8BoRwoVAb+Smm73e8Zk3JVHNnJ8+o6rXCU=;
        b=e4UggZ2LB6omRbLrNYSD+9bFDdQAMPy3ZI+2DF8jpYl0ixeYobecuJxJPGZTb2U9sz
         C6sBQYn0GJdB6YCSwfcuSIKFz/xWQD9tberWOnc4785EBP3S3E9PMuAkCG9RHYhCHWqd
         /PGMUo1/T3+194W1HCOt00Qn+B2BgL7SCd5VSJXvSitZYK2GYbKVutuVmhjAjt3r4kD5
         FZ0TUyl7TKxfGsb/m9uTAsaX6/FY5fnSyue6dQ4LpIxuQ5TbgVgWviUmJ8rJtPVocLRW
         SlsSOB93DwGOyAzHNIcBL820oizDBzu203/8f+LPl0p6gI+0BtY8kbXhDm0VdwTCWT2S
         JcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679060945;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wSloxUqcb8BoRwoVAb+Smm73e8Zk3JVHNnJ8+o6rXCU=;
        b=vmw6krdHG6KGS30kk0I+wJp2gyFpXluogScjQyEP8MrAbW1RlzwWe5erJvHC2Ynb9D
         zfql0E5yHt/j1pnVcc/yfraOR3iCQE6/TGvl9hf2mBiETEVxNKJ+2wv/fS2BKLk9Jb+8
         zJixD9aEcp1YT9T/aD0rdvJYdN52KWd2loOP+2MS2fR+9Sh3TZRrcOmO5t24ZyuncLft
         jfhPMsOIzZl7n5LlNV2ceJHEykHEoeDPQtZXvazKEntX2u3HdUh24skZUOcG2zFzzLXp
         MJYW/ClEfmckUXu1JiydwkH60oDNM087vvvPXa8IZTAu9pVb4a3GUH5hVnzZIxfvOcm5
         SIDA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKXP98NcASxHtAkJWNzxI4VGMIombahvW9chIU8GSC0ZODDJp6lq
	0pjErsaPNDn326M5NtKewfY=
X-Google-Smtp-Source: AK7set8SboMrr5sjWi7u9stlrkUhy2lBVlRDx3C3BDMIcmrZdp+gZyUtY/5hHlY3S20P1EtlZ6yygQ==
X-Received: by 2002:a81:c606:0:b0:541:9063:8e9e with SMTP id l6-20020a81c606000000b0054190638e9emr4495755ywi.2.1679060944931;
        Fri, 17 Mar 2023 06:49:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:ada5:0:b0:b25:605d:bcb8 with SMTP id z37-20020a25ada5000000b00b25605dbcb8ls2469800ybi.8.-pod-prod-gmail;
 Fri, 17 Mar 2023 06:49:04 -0700 (PDT)
X-Received: by 2002:a05:6902:725:b0:b58:b42d:945c with SMTP id l5-20020a056902072500b00b58b42d945cmr3865770ybt.0.1679060943267;
        Fri, 17 Mar 2023 06:49:03 -0700 (PDT)
Date: Fri, 17 Mar 2023 06:49:02 -0700 (PDT)
From: Daniel Baluta <daniel.baluta@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <a22210d5-6ea5-4926-acc4-fec65ca36884n@googlegroups.com>
In-Reply-To: <83472a1d-e6cf-3336-a4a8-df3c6bcc2cab@siemens.com>
References: <VE1PR04MB6607BED3DA85B3BFC335000792BF9@VE1PR04MB6607.eurprd04.prod.outlook.com>
 <83472a1d-e6cf-3336-a4a8-df3c6bcc2cab@siemens.com>
Subject: Re: Question: integrating Jailhouse in the Linux kernel tree
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4408_374079187.1679060942691"
X-Original-Sender: daniel.baluta@gmail.com
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

------=_Part_4408_374079187.1679060942691
Content-Type: multipart/alternative; 
	boundary="----=_Part_4409_32789445.1679060942691"

------=_Part_4409_32789445.1679060942691
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable



On Friday, March 17, 2023 at 9:01:39=E2=80=AFAM UTC+2 Jan Kiszka wrote:

On 15.03.23 19:29, Laurentiu Mihalcea wrote:=20
> Hi,=20
>=20
> I'm not sure if this topic has been discussed before but would it be=20
> possible to integrate the Jailhouse driver in the Linux kernel tree?=20
> This would allow other kernel modules to utilise Jailhouse and would be=
=20
> useful in cases where user space is not yet available (e.g: during a=20
> device's probe()) to do all the setup.=20
>=20
>=20
> Use case:=20
> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=821) Linux boots=20
> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=822) device_x's probe=
() is called=20
> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=823) User space becom=
es available.=20
>=20
> I would be interested in enabling the hypervisor, creating an inmate and=
=20
> loading some image during step 2) of the above flow.=20
>=20

But you know that Jailhouse startup and non-root cell loading currently=20
depends on userspace? How would a built-in Jailhouse driver help there?=20


We want to make startup and cell root loading independent of user space.=20

e.g=20

Use EXPORT_SYMBOL for jailhouse_cmd_cell_load / jailhouse_cmd_cell_load &=
=20
friends.=20


What you can already do is pushing the setup into an initramfs.=20

=20
This won't really help in our case. Our driver (Sound Open Firmware) runs=
=20
at boot and somehow
it already expects that the jailhouse to be enabled in a controlled way.=20

e.g -> Our driver already handles loading the inmate and starting it.=20

We come from a world where there was no need to use Jailhouse (there was a=
=20
separate DSP core).

Exporting the symbols will allow our driver to call in the jailhouse API=20
and create the expected
environment.

Also, where there any attempt to upstream the Jailhouse driver to the Linux=
=20
kernel community?

thanks,
Daniel.
=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a22210d5-6ea5-4926-acc4-fec65ca36884n%40googlegroups.com.

------=_Part_4409_32789445.1679060942691
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br /><br /><div><div dir=3D"auto">On Friday, March 17, 2023 at 9:01:39=E2=
=80=AFAM UTC+2 Jan Kiszka wrote:<br /></div><blockquote style=3D"margin: 0p=
x 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1=
ex;">On 15.03.23 19:29, Laurentiu Mihalcea wrote:
<br />&gt; Hi,
<br />&gt;=20
<br />&gt; I'm not sure if this topic has been discussed before but would i=
t be
<br />&gt; possible to integrate the Jailhouse driver in the Linux kernel t=
ree?
<br />&gt; This would allow other kernel modules to utilise Jailhouse and w=
ould be
<br />&gt; useful in cases where user space is not yet available (e.g: duri=
ng a
<br />&gt; device's probe()) to do all the setup.
<br />&gt;=20
<br />&gt;=20
<br />&gt; Use case:
<br />&gt; =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=821) Linux b=
oots
<br />&gt; =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=822) device_=
x's probe() is called
<br />&gt; =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=823) User sp=
ace becomes available.
<br />&gt;=20
<br />&gt; I would be interested in enabling the hypervisor, creating an in=
mate and
<br />&gt; loading some image during step 2) of the above flow.
<br />&gt;=20
<br />
<br />But you know that Jailhouse startup and non-root cell loading current=
ly
<br />depends on userspace? How would a built-in Jailhouse driver help ther=
e?
<br />
<br /></blockquote><div><br /></div><div>We want to make startup and cell r=
oot loading independent of user space. <br /><br />e.g <br /></div><div><br=
 /></div>Use EXPORT_SYMBOL for jailhouse_cmd_cell_load / jailhouse_cmd_cell=
_load &amp; friends. <br /><br /><br /><blockquote style=3D"margin: 0px 0px=
 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">=
What you can already do is pushing the setup into an initramfs.
<br />
<br /></blockquote><div>=C2=A0<br />This won't really help in our case. Our=
 driver (Sound Open Firmware) runs at boot and somehow</div><div>it already=
 expects that the jailhouse to be enabled in a controlled way. <br /><br />=
e.g -&gt; Our driver already handles loading the inmate and starting it. <b=
r /><br />We come from a world where there was no need to use Jailhouse (th=
ere was a separate DSP core).</div><div><br /></div><div>Exporting the symb=
ols will allow our driver to call in the jailhouse API and create the expec=
ted</div><div>environment.<br /><br />Also, where there any attempt to upst=
ream the Jailhouse driver to the Linux kernel community?<br /><br />thanks,=
</div><div>Daniel.<br /></div><div>=C2=A0</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/a22210d5-6ea5-4926-acc4-fec65ca36884n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/a22210d5-6ea5-4926-acc4-fec65ca36884n%40googlegroups.co=
m</a>.<br />

------=_Part_4409_32789445.1679060942691--

------=_Part_4408_374079187.1679060942691--
