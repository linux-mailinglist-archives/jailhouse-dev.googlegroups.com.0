Return-Path: <jailhouse-dev+bncBDVP3IWNW4CBBOFL56JQMGQEI2NHWIQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x840.google.com (mail-qt1-x840.google.com [IPv6:2607:f8b0:4864:20::840])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DA3523739
	for <lists+jailhouse-dev@lfdr.de>; Wed, 11 May 2022 17:26:49 +0200 (CEST)
Received: by mail-qt1-x840.google.com with SMTP id a24-20020ac81098000000b002e1e06a72aesf1850267qtj.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 11 May 2022 08:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Rg9ZfTrFccw8m/FdqKNrtRLMyeZwXYKH1tsOnEP5ZNw=;
        b=qrJCAZBsK9UpbYFf+W6IjKNjbggkBSEPb23sRvn46BNhxMCh53yeHxsxrgCJOct/iX
         r/buVYQuMCpKeQAY8Bb8Evfb3QapeU1V1TCNdsaF4/LHkst9gyI+mzmE8N9Rvs0cxyJe
         lsBPk3BgQoeT5nEiFNS6KwRyYGZoSg0Fl9UX3Vb4toHeoGQ8w7VOLM0IolbOgDLl7gBu
         8EMAAOUDoBisue6hlg082crrsLFwTqLCZIB7+GEsFDm1p5DGZDOhjjJDcSb8tNbCXOZ4
         vdfILH5hJ9yt7/5Eu8aPnh2kEDOgYSP+4scc9Joi2q/LlFH8jCX8ZC9zKO+7k4HRhJiW
         aN5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Rg9ZfTrFccw8m/FdqKNrtRLMyeZwXYKH1tsOnEP5ZNw=;
        b=hGP8WYzTQzkcGPAJ7bbAagVa4KcCBeH4cuyRPOJFTpiaPCBzuAIjF20WVfaHGXxgh3
         Fwi0CHOKFgr98KeKmlKk89QLOr9IURiyPH0P02Y1IfUDVIh7vU+z6E4lbPrgJDoFEKZj
         MXBY/uxgp/zJWmYFKAcBfX9vo3osVuAWRYn2MpmfOgTtL3FyeWJ+RTZgsgk0kcqhz98Q
         hEFfW7S3WNny2ng82n3UHGNGfwuQ9IBQbmY4H5oNp8IEOc7a0qFG3Sunr7TVMYdravo4
         gAsQ0eAmOaXsHgFGXPYYzgMluFh7yhSakHbLADxqmwgcs6JFfTuebVedZiHnzU+crO5m
         Yq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Rg9ZfTrFccw8m/FdqKNrtRLMyeZwXYKH1tsOnEP5ZNw=;
        b=uV9xqHzSmEhwDKzQlletC07Ir4fc3u3KZ1cWvWySTV9oZ/dqZ5GeJEiBL0LkfC8CJk
         PrWNJUCqsAc/G6/zegkO0+IiZq2APGZbVWa4PX47T5vZ16zxHRodnYzNYM1np3BQ3qJM
         CoFRqPvmXXzQ7GZDR+wggUWd1VnXkLe4Rdw+8e2gniW8XDMba2Q4HKONtYrSEyA4WjUD
         JGHu/mfK1x1Y0ctKjnQho6ybQfrghXa/Vai/GsxlBiJHLo7Nd7mlHh432cnuW85l7VwR
         kvcc4UpznRBALKKk08fD491zvLBBj72R2ZP2OVk7+WrTvMIy89wuw5t6vKovyummoiIX
         h69A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530LvcSHk47f7+CiTpxzbqqwJpM6kTScFBz4Wg2DON8E6Q4pjgtn
	qHuRMKj+VkLrkF6lTV6ISsI=
X-Google-Smtp-Source: ABdhPJyK3wGNNa61tluuCl6fUJorLbovhaEB4OH+w2l2mAB7woaVhXg/EyWH+c1mQ4q8OQu0lOs9Sw==
X-Received: by 2002:ac8:7e91:0:b0:2f3:df0e:9242 with SMTP id w17-20020ac87e91000000b002f3df0e9242mr11538896qtj.584.1652282808472;
        Wed, 11 May 2022 08:26:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:622a:1490:b0:2f1:d65b:1b21 with SMTP id
 t16-20020a05622a149000b002f1d65b1b21ls1502589qtx.5.gmail; Wed, 11 May 2022
 08:26:47 -0700 (PDT)
X-Received: by 2002:a05:622a:389:b0:2f3:c675:b61 with SMTP id j9-20020a05622a038900b002f3c6750b61mr24815282qtx.361.1652282807516;
        Wed, 11 May 2022 08:26:47 -0700 (PDT)
Date: Wed, 11 May 2022 08:26:46 -0700 (PDT)
From: "vsun...@gmail.com" <vsuneja63@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <51ac167a-59b6-448a-b6db-e109ab528009n@googlegroups.com>
In-Reply-To: <e4196998-4979-c4f8-bc45-52f0499a8033@siemens.com>
References: <ab9f5a7b-d479-44a1-8ae6-a2ad564fe1b1n@googlegroups.com>
 <e4196998-4979-c4f8-bc45-52f0499a8033@siemens.com>
Subject: Re: Jailhouse 0.12 on i.MX8MQ EVK
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_740_1032557888.1652282806938"
X-Original-Sender: vsuneja63@gmail.com
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

------=_Part_740_1032557888.1652282806938
Content-Type: multipart/alternative; 
	boundary="----=_Part_741_1400151310.1652282806938"

------=_Part_741_1400151310.1652282806938
Content-Type: text/plain; charset="UTF-8"

Hi,

I am using AGL lamprey source & building for i.MX8MQ.

Thanks & Regards,
Vipul Kumar

On Wednesday, May 11, 2022 at 8:39:41 PM UTC+5:30 j.kiszka...@gmail.com 
wrote:

> On 11.05.22 09:16, vsun...@gmail.com wrote:
> > Hi All,
> > 
> > I am building jailhouse 0.12 on kernel 5.4.147 i.MX8, but its failing
> > with below logs. I could successfully build jailhouse 0.11 on the same
> > kernel. Any suggestions on this, does 0.12 version support i.MX8?
> > 
> >  /*vipulkumar@A812DBLR:~/platform/AGL_lamprey/build$ bitbake -k
> > agl-demo-platform*/
> > 
>
> Are you using an AGL-provided integration here?
>
> Anyway, maybe Peng can provide guidance here.
>
> Jan
>
> -- 
> Siemens AG, Technology
> Competence Center Embedded Linux
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/51ac167a-59b6-448a-b6db-e109ab528009n%40googlegroups.com.

------=_Part_741_1400151310.1652282806938
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<div><br></div><div>I am using AGL lamprey source &amp; building for i.M=
X8MQ.</div><div><br></div><div>Thanks &amp; Regards,</div><div>Vipul Kumar<=
br><br></div><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_at=
tr">On Wednesday, May 11, 2022 at 8:39:41 PM UTC+5:30 j.kiszka...@gmail.com=
 wrote:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 =
0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">On 11=
.05.22 09:16, <a href data-email-masked rel=3D"nofollow">vsun...@gmail.com<=
/a> wrote:
<br>&gt; Hi All,
<br>&gt;=20
<br>&gt; I am building jailhouse 0.12 on kernel 5.4.147 i.MX8, but its fail=
ing
<br>&gt; with below logs. I could successfully build jailhouse 0.11 on the =
same
<br>&gt; kernel. Any suggestions on this, does 0.12 version support i.MX8?
<br>&gt;=20
<br>&gt; =C2=A0/*vipulkumar@A812DBLR:~/platform/AGL_lamprey/build$ bitbake =
-k
<br>&gt; agl-demo-platform*/
<br>&gt;=20
<br>
<br>Are you using an AGL-provided integration here?
<br>
<br>Anyway, maybe Peng can provide guidance here.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, Technology
<br>Competence Center Embedded Linux
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/51ac167a-59b6-448a-b6db-e109ab528009n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/51ac167a-59b6-448a-b6db-e109ab528009n%40googlegroups.co=
m</a>.<br />

------=_Part_741_1400151310.1652282806938--

------=_Part_740_1032557888.1652282806938--
