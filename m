Return-Path: <jailhouse-dev+bncBDOKTXXSZADRBU7YWGEQMGQE3UJSG3I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vs1-xe3c.google.com (mail-vs1-xe3c.google.com [IPv6:2607:f8b0:4864:20::e3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD3A3FB143
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Aug 2021 08:36:09 +0200 (CEST)
Received: by mail-vs1-xe3c.google.com with SMTP id d27-20020a67c11b000000b002c86b4e3194sf907179vsj.19
        for <lists+jailhouse-dev@lfdr.de>; Sun, 29 Aug 2021 23:36:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1630305363; cv=pass;
        d=google.com; s=arc-20160816;
        b=HmMeO85PdVGfUiw8lGLc11SHlWYt0Y+7wLSgCZf3LRyP7v2DbQUGjSE7RfcV3VizT0
         OuJ+5VArLw0FC4g/JF8OeiuT2Cbtf+5G3nT3o+7fmzyjfqeLUc5A9kUZVAbykJEs9rBK
         mM1fnInVNxR920DQTZ0jYc4lyqTeGChMrhEwfdskNHdilbvuDd4w4mLw/+Y9PxbLD5eD
         7dw2/N5MYIG5zsPTSh5uaXH77N8ekitTEqFhDxc0ybDewC7glT6+pBSEQUzmESou+vke
         zqAKGc0sYY/HmB6DjxPHLLvyG5FK0nzRLIffxwaB8dTdn0IEvuCZRz3jHqTV1cOJfpK5
         8zfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :sender:dkim-signature:dkim-signature;
        bh=Le3aQxHOEgn2MU6Wp7v/YZBtzfBW4E9vPVQz9uvo5Ks=;
        b=THzBbaQtDhZb6HF3gdVPMa2su9Lmd+RnOVF924KJ2VJyWbTvjZC31BWuf3I6qI2BiE
         GNt8v7psc5zSPlyaPrvBLoZyf2sqf0E8Wza+hcr0vLRLlA6yGbk3JCFGoSYnrXrfNL7e
         6PtdGSP1hemAgUHxWtUcMBllN3ckXQzjcr7uOsX1BBLnXpn4gqx5EV3Qs0Hx8+e92Sc3
         Ikef+3xhalGQ6o2HjTEMmhGmO95EFI2i66JDNJIxaBIsvLEYfVDFlZkActzE2rjJt+sJ
         m4qmDdxIBJjrw5YPfzd8XF76hAIfn1PGdznYMPORRMLMkGEMOS4LYMfLkLu19ktJ5Dew
         o9qg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=SRIaYJmk;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::844 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Le3aQxHOEgn2MU6Wp7v/YZBtzfBW4E9vPVQz9uvo5Ks=;
        b=Qi6nzjXOtUqWtbrU9eOMwf9WDua6qzqDjzxCkkVuvlre0aT5SUzjDUjdH7W7VFOClg
         gMqQSltj3dyW0lLa1Key1X8Mo1lr8lDApql8RUMrZUdS+rpmqoq333+zy+cD5zBkgDiD
         de71tjSgSdQf96V1sFP+pwTv217RmO/aPOMNtKInhHTDMYv+qcaMe5/s7FY9Ls7oZmpP
         dcspVuyKlU1Gj8VEkpOy71f09cuiT81CYLy/yf+IxFfRYidrGo9CFLwXfUasdY/U9qWg
         xOMWsSDbDz4LiqlteSdaDrdJFJ93hMwCmK+m8WqjhcZKDmUJzbpYa6F0wM9AJHMOQhiw
         nMJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Le3aQxHOEgn2MU6Wp7v/YZBtzfBW4E9vPVQz9uvo5Ks=;
        b=iOQbpgAxGRcgMJ+W8H6lr56w3YoTYd5MXfKD2GjAYcAPpmw/vTi5V9go7nMBATwTAL
         +AXLIB6LgfuPJOmBtSRR7qo0mz42RXVtPbc68/OHxikefEZq12CsZa8xYCDGzJgG/fUx
         Ovx4uoxTf18P7SlOV6Y1uQxxa2hUY14ajTN4iET7fYnbdWy3+Ra0D28pRdBrdS13cCg1
         Gp8J62qw8lWC6CqEmF+YzQaZZFDpK1xT3zuH3h8X45fdv06yZcrFEEnTdxDln73RbQbD
         ZszfTeuF/sZTlQc8iEy87e8Snzsd7WtBfk7KSTbDvpa2j0JgnPMWXoaMoJNoh/yw95wh
         O00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Le3aQxHOEgn2MU6Wp7v/YZBtzfBW4E9vPVQz9uvo5Ks=;
        b=ebcKH1SkOwom3YMe7PClp0fJyJ1q/AffEVLbKsJ8/fos9wgmHYlHq/HQXf4P+f677u
         A7mueJ0SAs/Y/NM1XfiXHN7S6lPniyXnVzFXFjwOqfYPL+6uMaxryYGf1A5uET8sc8rO
         LfcjsNdruRLFd2VFQ+rsNg+CG4KBQ6Fp/XhLKMlonFnyc0oO2A9eZ7FyZbnsJDDqPX8e
         Cy7mndAe/fjnhdfBhW0Ix9/cP/Fsvs6rcFFkmVRqyTJpJbnjjSq3nMgpmOkeNnRK3IRr
         mvOBlwxJCJLPt9/Iki0hPt0F/4fitz9AsO8bd5qiJM41JJOzlgdVgE8XKx6A6TOcHAxm
         Fw4A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532iCwxJpgZAL3IcxDgKxjXbNbJ4e0gdhLCs8JQCLsyYl8nfejTj
	O1F+H6YSYyH8in+evQ3Dbdg=
X-Google-Smtp-Source: ABdhPJwm6q4zOAUWaKKpR73OI/oYzoHysUc3SRvRPVEjg7o9t69noOSS7aVSHQI0+294jcV2pD7k2w==
X-Received: by 2002:ab0:344e:: with SMTP id a14mr14085849uaq.23.1630305363380;
        Sun, 29 Aug 2021 23:36:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:2ebc:: with SMTP id y28ls1628708uay.11.gmail; Sun, 29
 Aug 2021 23:36:02 -0700 (PDT)
X-Received: by 2002:ab0:7581:: with SMTP id q1mr13431906uap.63.1630305362741;
        Sun, 29 Aug 2021 23:36:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630305362; cv=none;
        d=google.com; s=arc-20160816;
        b=GUBgBTxNa9UcLDyhtkKHUfljIrX1+U49XCQr/R3SyYbDOQF1dM2yxcFKqF2xidEBuA
         pkPln5Gp4nDmSX/fh6QahMQkNNHqzqVgXBObfcdcyW24qhNm4ArlqIkZJOt5Kehg0m03
         tcYDwSoQlWA0D2kzdq9qfkyRZUCiwYL2Ph6VMSQJxm+G5Qaz/IjGqOPl1PqjMMdrfDo0
         Py28g0eWcZ8V7yQOrzdHVXz4wTflICuZZPJG0srxOKYjFoBqKrrDA9gX4xpIMOzwQISV
         8l7uidfrQJKqQ3sZZexsz0so+sD4k7C/AnaavJSRuUUSj3A45v5gR7835FRATC20fBRT
         ej3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mno15NI3yfdfTh48PMgCYHTdBA26FQYjrlPRAzy0MAY=;
        b=fb8P/cfTBlxyYqN3ue8yJM9kKqTfrgI6qDKq9XIFgOMNFuSdo+Et5KiHlFYlZvaPo7
         0Lz0YhYhjt8nby0raYiBM5d7+H8K41G8rmSJupLpZShow2LvSrjKXBE4Q5bLCc+Vp6Jq
         Won8uUiqvS+J4ccIZeBpxG8XqY44jW0TmKE8+aFUc6gPeGPF2Oxqae3P6pNXFnCzN/pI
         G5xuDUuf7XWAeU16ixdJ/L0VAQEKKIQl7GRp6Hwn4gmzgt8o8wf+h3ia74cSJ0AXxqSx
         v0b+MjDrGdlBddN7pMqzGIDM6F0Sg8L+U2MRSuqu3+5Jj7V1vyfJ8EUOwlGu3qrS1JCd
         XgIQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=SRIaYJmk;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::844 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com. [2607:f8b0:4864:20::844])
        by gmr-mx.google.com with ESMTPS id w131si701136vkw.3.2021.08.29.23.36.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Aug 2021 23:36:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::844 as permitted sender) client-ip=2607:f8b0:4864:20::844;
Received: by mail-qt1-x844.google.com with SMTP id d2so10836858qto.6
        for <jailhouse-dev@googlegroups.com>; Sun, 29 Aug 2021 23:36:02 -0700 (PDT)
X-Received: by 2002:ac8:5707:: with SMTP id 7mr19686881qtw.268.1630305362470;
 Sun, 29 Aug 2021 23:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <CABSBigRew4uS4Hg2QAvRgLJM3MvV60ff3E1wvsv+U52u-MYTbA@mail.gmail.com>
 <e6df60db-8a0c-a0e6-7880-547edbcf1c6d@siemens.com>
In-Reply-To: <e6df60db-8a0c-a0e6-7880-547edbcf1c6d@siemens.com>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Mon, 30 Aug 2021 14:35:51 +0800
Message-ID: <CABSBigQRphzbxvzjcSyTvbChopJ3DM3wv2L0MgoxYrXJRf2u_g@mail.gmail.com>
Subject: Re: No need to add spin_loc() and spin_unlock() for cpu_public - cpu_suspended
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: gengdongjiu1@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=SRIaYJmk;       spf=pass
 (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::844
 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

Jan Kiszka <jan.kiszka@siemens.com> =E4=BA=8E2021=E5=B9=B48=E6=9C=8826=E6=
=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=889:28=E5=86=99=E9=81=93=EF=BC=9A
>
> On 26.08.21 11:40, Dongjiu Geng wrote:
> > Hi,
> >      I see  cpu_public->cpu_suspended is protected by spinlock,  but I
> > see there is no concurrency problem for the cpu_public->cpu_suspended.
> >  check_events() is the only place to change cpu_public->cpu_suspended
> > variable=EF=BC=8C other CPU can not change is variable, also  check_eve=
nts()
> > is
> > not preempted in the current CPU, because IRQ is masked in the current
> > CPU.  So there is no need to add spin_lock for
> > cpu_public->cpu_suspended variable.
> >
>
> The lock protects (among other things) the consistent view on and
> modifications of suspend_cpu and cpu_suspended. You have on CPU setting
> suspend_cpu as a request and another CPU being the target, evaluating it
> and setting cpu_suspended when actually having reached that state.
>
> You can't remove the lock without risking racing between the two CPUs.
> Maybe not all of them will lead to inconsistent states, but some can,
> and arguing that those will not happen in reality is much harder (if
> possible at all) than placing these locks here.

Understand it now, thanks a lot for the clarification.

>
> Jan
>
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CABSBigQRphzbxvzjcSyTvbChopJ3DM3wv2L0MgoxYrXJRf2u_g%40mail.gm=
ail.com.
