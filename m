Return-Path: <jailhouse-dev+bncBC2PTC4R4MNBBH5B7KBQMGQEQFMXWMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf37.google.com (mail-qv1-xf37.google.com [IPv6:2607:f8b0:4864:20::f37])
	by mail.lfdr.de (Postfix) with ESMTPS id A015A365412
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Apr 2021 10:28:27 +0200 (CEST)
Received: by mail-qv1-xf37.google.com with SMTP id el4-20020ad459c40000b029019a47ec7a9dsf7235704qvb.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Apr 2021 01:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vq5S3XtYYpUWROv7QVoXC+55b8waVys0MheQELdwP/k=;
        b=iVgeu3pUMjI5PaUhMzl+lizaHRmM16ATJ+DbyuINZzYiUFVWYM9V9sVYIKUtw4kYLU
         ljKPCCwB/FG9WELwpq2YQUlEnu92uqQE6nUvjwyCYUyZThllqWdxYjCT20q5fQnk2SyH
         mfqwCFShWey2vgrHlYqruKQvvUDoZ9PBlYmqL2jcN5YqYJzwcmATUeyGnvKfiS0WXDnG
         VgPusPRneVzZH5u1052ShFCI1NjCyVB4nK+fRHULOOqDL23xtQ0y1aZt+qPulGJkHQ/h
         oiL8S8EfyaV/DtIa6u2TtAxnxrX8cDO7D6AvvQ5mQDgguo2OlI+ZsxcaG0X6BYNYane4
         Fs1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vq5S3XtYYpUWROv7QVoXC+55b8waVys0MheQELdwP/k=;
        b=Dq4YQna/vOlO5U1CaAu1+IoAgo76wrk5C4cL4ri1IHju8psdSpEN6mjx4z8As5/FcQ
         aDT4qBDzWIb8uQbGnQ9X3noSEQHVtm84BKvhZtE7jAGSW24O3mFJjK0IMa5kUnuPtZ5l
         GasmgJ6pY32RPl2d3XSuhypS4flSkxAHIXUcmfEHWWm+/F8CYUOu1zbMAYcsjoc8u3UL
         ZlqcBgTyzykIPY5VwsdhuD/4AY+I/F5eA3Y4140QkZngigzwbklI8yOedezF9b1YOsQy
         ZGlE3/qDjKksnH5Kp2ZzjzuF5l8/ZXpUssXSJh3pU3Tl4pYleLsg0tuodlPakrjrLAA9
         fu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=vq5S3XtYYpUWROv7QVoXC+55b8waVys0MheQELdwP/k=;
        b=JwXJOL66uN0tDnBFpARhIffa5yOoiBMt5KtAa5R02JNWDUQZ/4zPzYnmHUB640ye9Z
         bm7nl/V/zlMdRIRazeZNtdZIJNV9ycr3aF8v22TAMRTmUuREFr3DfRaZ0n3haRIDpzxV
         8aVqIUdBkxloWNxDaakiOqZWszK8DOgwCvfWl+O36ywzYNsOXT51UhbV6CdeJ/JAzdDA
         DAni7BXvwjDXM910n+kgApjI8SyjngW2+L/Eum+i/yG7zE1WtLtQmZoxd03tSrcS8z+L
         z+IIlxHHVLB/gw1di+sWuaz2uxbiMBp8CRvMW02ig1sj+ipyuQBGkyUAJ38r085eiTr/
         FOEw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Rbl4BcoHh78E8RtvUDFt6btwaTWrF6SayHuiOwhbBplDkcncf
	XZXpBgBiYt90vnAhXfE99yI=
X-Google-Smtp-Source: ABdhPJyw55eNQZih0/a/ymLXHIU+LmF3O/p8UcJZ5SKHDWzgiGIpoNE6aKTvRPXFvR9hHQSqe6u5LA==
X-Received: by 2002:ac8:7fcd:: with SMTP id b13mr15613119qtk.68.1618907296044;
        Tue, 20 Apr 2021 01:28:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:f8e:: with SMTP id b14ls923050qkn.0.gmail; Tue, 20
 Apr 2021 01:28:15 -0700 (PDT)
X-Received: by 2002:a37:e508:: with SMTP id e8mr16715898qkg.82.1618907295383;
        Tue, 20 Apr 2021 01:28:15 -0700 (PDT)
Date: Tue, 20 Apr 2021 01:28:14 -0700 (PDT)
From: Chung-Fan Yang <sonic.tw.tp@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <362fa4be-5085-49c5-8def-5224d7d91723n@googlegroups.com>
In-Reply-To: <56d20fde-1da5-8f99-7ea6-81cb0b657690@web.de>
References: <2bd89d4f-6959-4701-b661-3d3e98a2e260n@googlegroups.com>
 <56d20fde-1da5-8f99-7ea6-81cb0b657690@web.de>
Subject: Re: Tested x86-64 SBC or mini PC
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1372_1331202800.1618907294801"
X-Original-Sender: Sonic.tw.tp@gmail.com
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

------=_Part_1372_1331202800.1618907294801
Content-Type: multipart/alternative; 
	boundary="----=_Part_1373_367479073.1618907294801"

------=_Part_1373_367479073.1618907294801
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Jan for pointing out the old NUC will work.

For my application, newest processor might not necessary.

This might be good enough for me (if the NUC is still easily available.)

Yang
2021=E5=B9=B44=E6=9C=8817=E6=97=A5=E5=9C=9F=E6=9B=9C=E6=97=A5 18:47:14 UTC+=
9 Jan Kiszka:

> On 17.04.21 10:07, Chung-Fan Yang wrote:
> > Hello,
> >
> > I have been developing on top of Jailhuose for quite some time.
> > Just become curious and have a question.
> >
> > Are there any officially tested x86-64 based SBC or mini PC?
> > Will a Intel NUC work?
> >
> > I do have a working Xeon Broadwell build at hand it it costly to make a
> > duplicate machine.
> > I did try to run on other commercial or self-built x86-64 PCs, but the
> > on-board hardware varies quite a lot and I did have a hard time getting
> > things to work from time to time.
> >
> > I would like to find a more cheap and stable platform for x86-64.
> >
> > Thank in advance for any comments or answers on this.
> >
>
> I'm not up-to-date with low-cost x86 boards. We have pre-integrated the
> older NUC6CAY in jailhouse-images, and similar Apollo Lake designs
> should be fine as well (though surely not as fast and low-jitter as Xeon
> targets).
>
> Maybe other users can share more recent experiences.
>
> Jan
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/362fa4be-5085-49c5-8def-5224d7d91723n%40googlegroups.com.

------=_Part_1373_367479073.1618907294801
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Thank you Jan for pointing out the old NUC will work.</div><div><br></=
div><div>For my application, newest processor might not necessary.</div><di=
v><br></div><div>This might be good enough for me (if the NUC is still easi=
ly available.)</div><div><br></div><div>Yang<br></div><div class=3D"gmail_q=
uote"><div dir=3D"auto" class=3D"gmail_attr">2021=E5=B9=B44=E6=9C=8817=E6=
=97=A5=E5=9C=9F=E6=9B=9C=E6=97=A5 18:47:14 UTC+9 Jan Kiszka:<br/></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1p=
x solid rgb(204, 204, 204); padding-left: 1ex;">On 17.04.21 10:07, Chung-Fa=
n Yang wrote:
<br>&gt; Hello,
<br>&gt;
<br>&gt; I have been developing on top of Jailhuose for quite some time.
<br>&gt; Just become curious and have a question.
<br>&gt;
<br>&gt; Are there any officially tested x86-64 based SBC or mini PC?
<br>&gt; Will a Intel NUC work?
<br>&gt;
<br>&gt; I do have a working Xeon Broadwell build at hand it it costly to m=
ake a
<br>&gt; duplicate machine.
<br>&gt; I did try to run on other commercial or self-built x86-64 PCs, but=
 the
<br>&gt; on-board hardware varies quite a lot and I did have a hard time ge=
tting
<br>&gt; things to work from time to time.
<br>&gt;
<br>&gt; I would like to find a more cheap and stable platform for x86-64.
<br>&gt;
<br>&gt; Thank in advance for any comments or answers on this.
<br>&gt;
<br>
<br>I&#39;m not up-to-date with low-cost x86 boards. We have pre-integrated=
 the
<br>older NUC6CAY in jailhouse-images, and similar Apollo Lake designs
<br>should be fine as well (though surely not as fast and low-jitter as Xeo=
n
<br>targets).
<br>
<br>Maybe other users can share more recent experiences.
<br>
<br>Jan
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/362fa4be-5085-49c5-8def-5224d7d91723n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/362fa4be-5085-49c5-8def-5224d7d91723n%40googlegroups.co=
m</a>.<br />

------=_Part_1373_367479073.1618907294801--

------=_Part_1372_1331202800.1618907294801--
