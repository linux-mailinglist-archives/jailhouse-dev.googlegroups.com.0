Return-Path: <jailhouse-dev+bncBCY3B2PSYIBBBJF7ZLVAKGQEZ22K5TQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DDF8B6EA
	for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Aug 2019 13:31:49 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id c18sf21050236lji.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Aug 2019 04:31:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565695909; cv=pass;
        d=google.com; s=arc-20160816;
        b=QkBf+VTxk7YP8iLSZduKo4z54W13p13cH1CMlv2xr3WCZNrGo6ON4uYCtEW7JQMvP7
         zbVVI8L5AL/SRKCktMNmoGzewP/h5iaS4S5OHjvAaP+QfatFP9AibN1umeksLLrKgiOH
         nJPDwNM30lNVtLulNpRT+37AKVcTEE2mADNqrIAnsYNj32VzDFixFbmB7XmdHf3v84Tx
         uORMMqhV7LT1VTNj57maCrJY4B4AeR8i8sUxX2w1lTfcAByU2RvmKUVu3IK7rj3rgZ+l
         MXWLbvua8W6jFIRHkSeDhLmQqTAKCm4+9iEFdXZLPz79eClZczaPuiTld/0p4hDeq63k
         s+hA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=urjdNKpCSMKmfR8AjpAGgHkdf3RJeUcHfS+7ZugIsXo=;
        b=Sp9yU0Z6tTfWu+7o2qawgsP5FXRa6TFFr+KbdxDNZH0Zcp1Sb5aas60Ci7gum1iBYz
         eJwwB4OcnjynAiI6j16QLX1I/cmWRQtyXvpvLJ1JzUeLj0xnvcfC/QOAaBJMmO8M1xBO
         ZR2YjYkPIx1F7E8XNzfdu1Kw3/lvDmEtqlORHOyeQYFKRG603dJOYLQZi8YpzJl96AZ/
         EG/hU08iVyzdbp9qo1IMc6WKtfPOi83DkBm5B9FA8nd7YBoC3AFQveZdDonWBQal1sS5
         GRJtBoHQaQh17dkzegspbUiMcM6wDYFSp2RsLnXgJOTkCApLnzhBviAV5JZXG9h6gAhw
         7V7A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=tG9ZN6Mr;
       spf=pass (google.com: domain of bostancioglucevat@gmail.com designates 2a00:1450:4864:20::531 as permitted sender) smtp.mailfrom=bostancioglucevat@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=urjdNKpCSMKmfR8AjpAGgHkdf3RJeUcHfS+7ZugIsXo=;
        b=bd+MhRMbCOCQPrqPapit8bbtr3UqaPCVWgMIzXPqy4odGn4DW3ycFAD8NqRmRCLxxD
         UvVgCHOpEOOBbb+10qJp1FOi9t1lknrzFRNHdj23j6lMPKD2eICmXpgKaLSD1QpnD/pW
         UWVs5b8iTJFfVFbUevg9/HK3dAeCsWhwHd2F5ZHDXG0EhS+pDkQgcmjE47o7j7i2/M/0
         a9pW4bJDvthhncUvwnjF8b1QQ4GZCzarGrWQu6kQYkyJD0r4ofpOO/ZP1IRN2zqfIcNk
         c6LH3k01C9C1E6eUulTTjgn5rvxRfdxMaiDDo6ZkFkEG5PcyKe9815HxUqMO2w8WcNyU
         Uvaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=urjdNKpCSMKmfR8AjpAGgHkdf3RJeUcHfS+7ZugIsXo=;
        b=hozbeEOfV5rrXoQUCYx5C2vQjo3GegFfy/Cd8okkF6/bMswbK0aOqIuzU4TIlg6VOq
         FUaBSAAhPMpSkYRs/qJ2oeLPfsJtvVgB8dEFkv1zgm72SNOcsq/S4vgZKsmPWOiBn3OQ
         kqXDjwxlF9TuE6nF6peeZ7vO0TS2mDPPPezJBjQcoPxD0r6UDjOZrqyBzvT5b7/X9DRs
         w/GeKhm5lixA4vjY22xMYrNqKiaNK9defhYIlziDRyAnQEailaDHwyYM7eq8p27zd/8J
         M8vjL5PXoEC+q4habFgMweBLxXR0kfakagQoICpjXUbQyWuVrv6A1TAATTn9ahuOwwEa
         NeZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=urjdNKpCSMKmfR8AjpAGgHkdf3RJeUcHfS+7ZugIsXo=;
        b=Q/+Vr9wlbifhT8MzfpDo54ZpLvpdDzo2KQSE4h8rw7qKqu9rZiFJmhUWJvPB07cXVf
         H64kjWH0e3FSvnq3gGu25ZWckSF8A5hG59Eb7VUq8GSgKCajNIBu4mhN6hzmY850sDWn
         wQPAW7hGOGfH769FwouTxYlbCAFI+/3IQw66SYUEnvFtZZd2pwy7hgM5PnQxZowVEt0W
         6gmloTzD3rYilGybAZyyYO/VvWNTEbeB8M/7nrVqEfL7oNHwmJoO/A49JfuNLDNlz9w5
         atgKlkkqIrC2DK4SXnp9X3R7Dp++LPKIW6MwpJStv2MwNVIi0HzULB2ca+MixxlN8kCJ
         xlIg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUv9rb9RdWg/rGX03oszNtQE4jNi1XhAJl/+BuC1TJbs/0dYXBn
	jkxk+8M5VGJqfogvqAfQZwc=
X-Google-Smtp-Source: APXvYqxF5LJPNSpTmDrZpmxEB3Obn/6jGZpCnFdqdTlKkR8WKYYiAq1lpfmJYFIi5pEXTZ3RzW5F4Q==
X-Received: by 2002:ac2:599b:: with SMTP id w27mr9679095lfn.75.1565695908993;
        Tue, 13 Aug 2019 04:31:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4285:: with SMTP id m5ls147033lfh.14.gmail; Tue, 13 Aug
 2019 04:31:48 -0700 (PDT)
X-Received: by 2002:ac2:4948:: with SMTP id o8mr1452858lfi.13.1565695908375;
        Tue, 13 Aug 2019 04:31:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565695908; cv=none;
        d=google.com; s=arc-20160816;
        b=UqorWhC3q6QcfU7s9yd8673SFMJWG4s6WA4lm+iDenrQpy/9qhhG1x4jEOlurNibdQ
         GtYraAdjTb1+IzmDDbnWXFTK5FNnQ9bFrxQkPEv8n7VTdmGYHKkbE1VW+DCnpo90v+yM
         lV23EePAy2HS/i5sFzBYFIQOA2+QOCsFbTPDdXM1/Nb/CZ63MYuscxuwzWqxWTy6sKNh
         omvYXIg8SAuvYaP3eg5KaY1WM2FJqGIfuzUBcP4qv2TVxem2HTIrTHL9xDlYX393dOE3
         Z6blbbrlHJikAE4lETKFTor4929fMbdH6ADSDFxN+9ZRP0Td9lO3d1K0GFaxmxI21B62
         Ld2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HgyxZ1BHwszeMXF35bdVyXL2RtFPhnPy89evan072Iw=;
        b=rJtimLmumqV0yMqzdaOBCkVH0/sFtnkfOqB47AwCF3h8y+CXotvar0CfjcbI6rr1Mt
         uc9ZgUXdMYaM+7cbD8C41V+ytKURMLOrcvzssbal0CPuGM3ragHbPCYbdvquFO500Qmx
         4v2jwe2tD9PATlK/Eby4KCMhngx/Ye/ejEKrDT1+qLHxwT65ivH3+qp8/D+9sWItjqm4
         S25krxN2mA5b6W9NK/wdTgzSEc9YkVT2GRDYB2D88Bn8bhl1TcyTN3Vp940cRBBOcU9w
         HtHo2aSXf2M3wtkH7N6maL3oNQqUYLQ78ekMrXkPxMC6HA+UFaE6HN81P61Cdm8QTIp7
         JKDw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=tG9ZN6Mr;
       spf=pass (google.com: domain of bostancioglucevat@gmail.com designates 2a00:1450:4864:20::531 as permitted sender) smtp.mailfrom=bostancioglucevat@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com. [2a00:1450:4864:20::531])
        by gmr-mx.google.com with ESMTPS id f26si5091209lfp.5.2019.08.13.04.31.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Aug 2019 04:31:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of bostancioglucevat@gmail.com designates 2a00:1450:4864:20::531 as permitted sender) client-ip=2a00:1450:4864:20::531;
Received: by mail-ed1-x531.google.com with SMTP id a21so3766278edt.11
        for <jailhouse-dev@googlegroups.com>; Tue, 13 Aug 2019 04:31:48 -0700 (PDT)
X-Received: by 2002:a17:906:198e:: with SMTP id g14mr13382892ejd.158.1565695907890;
 Tue, 13 Aug 2019 04:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <CABPcKDPEVAW0Y1x8ndpc6LQutq8cCsEKu20inFyFhrMRwa+--w@mail.gmail.com>
 <a17c3513-f573-84ad-5d4e-5027121e51b5@siemens.com>
In-Reply-To: <a17c3513-f573-84ad-5d4e-5027121e51b5@siemens.com>
From: =?UTF-8?B?Q2V2YXQgQm9zdGFuY8Sxb8SfbHU=?= <bostancioglucevat@gmail.com>
Date: Tue, 13 Aug 2019 14:31:36 +0300
Message-ID: <CABPcKDNb9HKXNHGoUY84WnFup2wn79zsoHzDa-i2xeaETM7VDQ@mail.gmail.com>
Subject: Re: Orange Pi Zero Jailhouse Yocto Integration
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com, 
	Henning Schild <henning.schild@siemens.com>
Content-Type: multipart/alternative; boundary="0000000000006a88c5058ffdfc32"
X-Original-Sender: bostancioglucevat@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=tG9ZN6Mr;       spf=pass
 (google.com: domain of bostancioglucevat@gmail.com designates
 2a00:1450:4864:20::531 as permitted sender) smtp.mailfrom=bostancioglucevat@gmail.com;
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

--0000000000006a88c5058ffdfc32
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,
Thanks for the fast reply,

I tried with 9f233898917f8c1141132606f2f2c624405d8c81 commit and also
latest commit, still have same problem.

I will be appreciated if you guys can provide/help with examples.

Thanks,
Cevat

Jan Kiszka <jan.kiszka@siemens.com>, 13 A=C4=9Fu 2019 Sal, 14:09 tarihinde =
=C5=9Funu
yazd=C4=B1:

> On 13.08.19 12:39, Cevat Bostanc=C4=B1o=C4=9Flu wrote:
> > Hello,
> > I am trying to learn/play embedded virtualization tools and i saw Isar
> > Integrated jailhouse-image repo, tested orange pi zero(256mb) image and
> > everything is fine.
> > I am trying to integrate latest jailhouse(0.11) into yocto project and =
i
> saw
> > https://bitbucket.org/retotech/meta-jailhouse/src/master/ , which is
> for banana
> > pi with jailhouse_0.8.
> >
> > Anyway, I ported jailhouse-images and meta-jailhouse
> together(meta-orangepi,
> > https://github.com/cevatbostancioglu/meta-orangepi/tree/dev) and trying
> to
> > compile for orange pi zero(256mb) but I saw many errors while building.
> can you
> > guys can guess what is the problem?
> >
> > my status:
> > i am trying to build exact image with jailhouse-images so i patched
> u-boot &
> > kernel, now i am trying to compile/install jailhouse.
> >
> > You can see build error as follows,
> > also attached log outputs too.
> >
>
> The errors look like they could get better with
>
> https://github.com/siemens/jailhouse/commit/9f233898917f8c1141132606f2f2c=
624405d8c81
>
> > My repo:
> > https://github.com/cevatbostancioglu/meta-orangepi/tree/dev
> >
>
> Thanks for sharing. Henning did some yocto'ization for an internal
> Jailhouse
> project recently (though that was for legacy vendor BSP) - maybe he can
> share
> some thoughts on your direction.
>
> Jan
>
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CABPcKDNb9HKXNHGoUY84WnFup2wn79zsoHzDa-i2xeaETM7VDQ%40mail.gm=
ail.com.

--0000000000006a88c5058ffdfc32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,=C2=A0<div>Thanks for the fast reply,<div><br></div>=
</div><div>I tried with=C2=A09f233898917f8c1141132606f2f2c624405d8c81 commi=
t and also latest commit, still have same=C2=A0problem.</div><div><br></div=
><div>I will be appreciated if you guys can provide/help with examples.</di=
v><div><br></div><div>Thanks,</div><div>Cevat</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Jan Kiszka &lt;<a href=
=3D"mailto:jan.kiszka@siemens.com">jan.kiszka@siemens.com</a>&gt;, 13 A=C4=
=9Fu 2019 Sal, 14:09 tarihinde =C5=9Funu yazd=C4=B1:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On 13.08.19 12:39, Cevat Bostanc=C4=B1=
o=C4=9Flu wrote:<br>
&gt; Hello,<br>
&gt; I am trying to learn/play embedded virtualization tools and i saw Isar=
 <br>
&gt; Integrated jailhouse-image repo, tested orange pi zero(256mb) image an=
d <br>
&gt; everything is fine.<br>
&gt; I am trying to integrate latest jailhouse(0.11) into yocto project and=
 i saw <br>
&gt; <a href=3D"https://bitbucket.org/retotech/meta-jailhouse/src/master/" =
rel=3D"noreferrer" target=3D"_blank">https://bitbucket.org/retotech/meta-ja=
ilhouse/src/master/</a>=C2=A0, which is for banana <br>
&gt; pi with jailhouse_0.8.<br>
&gt; <br>
&gt; Anyway, I ported jailhouse-images and meta-jailhouse together(meta-ora=
ngepi, <br>
&gt; <a href=3D"https://github.com/cevatbostancioglu/meta-orangepi/tree/dev=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/cevatbostancioglu=
/meta-orangepi/tree/dev</a>) and trying to <br>
&gt; compile for orange pi zero(256mb) but I saw many errors while building=
. can you <br>
&gt; guys can guess what is the problem?<br>
&gt; <br>
&gt; my status:<br>
&gt; i am trying to build exact image with jailhouse-images so i patched u-=
boot &amp; <br>
&gt; kernel, now i am trying to compile/install jailhouse.<br>
&gt; <br>
&gt; You can see build error as follows,<br>
&gt; also attached log outputs too.<br>
&gt; <br>
<br>
The errors look like they could get better with <br>
<a href=3D"https://github.com/siemens/jailhouse/commit/9f233898917f8c114113=
2606f2f2c624405d8c81" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/siemens/jailhouse/commit/9f233898917f8c1141132606f2f2c624405d8c81</a><br=
>
<br>
&gt; My repo:<br>
&gt; <a href=3D"https://github.com/cevatbostancioglu/meta-orangepi/tree/dev=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/cevatbostancioglu=
/meta-orangepi/tree/dev</a><br>
&gt; <br>
<br>
Thanks for sharing. Henning did some yocto&#39;ization for an internal Jail=
house <br>
project recently (though that was for legacy vendor BSP) - maybe he can sha=
re <br>
some thoughts on your direction.<br>
<br>
Jan<br>
<br>
-- <br>
Siemens AG, Corporate Technology, CT RDA IOT SES-DE<br>
Corporate Competence Center Embedded Linux<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CABPcKDNb9HKXNHGoUY84WnFup2wn79zsoHzDa-i2xeaETM7VD=
Q%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/CABPcKDNb9HKXNHGoUY84WnFup2wn79zsoHzDa-i2xe=
aETM7VDQ%40mail.gmail.com</a>.<br />

--0000000000006a88c5058ffdfc32--
