Return-Path: <jailhouse-dev+bncBDOKTXXSZADRBIHMSKEQMGQEETQH2II@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43c.google.com (mail-pf1-x43c.google.com [IPv6:2607:f8b0:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A5E3F5A63
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 11:04:34 +0200 (CEST)
Received: by mail-pf1-x43c.google.com with SMTP id x18-20020a056a000bd200b003e14701b71dsf9948129pfu.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 02:04:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629795873; cv=pass;
        d=google.com; s=arc-20160816;
        b=vsBUPnb1oehei4MGK3rbyE73DoQ8oODs0nTsAJE/0hak9ZrwjxzO11DfKj7QIhHDd4
         texNzjD83UODgmMyYXmR/hvMlnoPERdVpOuzKcB45yv2K1VTktjXJNNkPO4uY2RC5aQc
         ImqhUzZtAQXoUJ0J+UgHP8xqLNLZxAQ8KE8Rhb3QhmowlbCY5zfF7jtJZeh+uOzguLZS
         FYo6h6dxN8Jzn2T+DAuZeDDJaQvokofcggfKrJ62LVMHgaHfCf+qVT+2PHbZ87d4XXNT
         oCZlJHPBddrhN+Nn1ghdZEI40dhlADuCiQk7nzTh9yppLyvwM8ym+AR3ZGOgPab1WUm1
         pUPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :sender:dkim-signature:dkim-signature;
        bh=t7UqkXKVLi4IpngXlpGWE7DYQnaC7a+58IjGroUBONw=;
        b=MntngPbLTUYBYHeom0j7rFR7Wn3yRwwHp8H8b0CG0hEIfpshOf/CjwwbCQnkmEJzSU
         OJURfPuEMYZyYzbCeUw/eIQfBNu1ssKIFvgEH9YkAkBWAUg19LvywRfdB/DjJD4oqibn
         IKcPlA92EJ2qD8MW9RwAT9CkAXmhV+b8eWXzXO1F0/liftZpthNbHcjH67mnQ5CvxCkD
         7n6gyWZyXNzy30NVm0kAefYQbdd2JE/vwYi7ITUlFhnuPRJK3gU33czfM1Mc6fUX/8SC
         9Kj+FCN2O9SRjmSd4CwTU8ISGJCYMCNZcXSvI/rVSGeDl1+ApbNOgOo16sqtxPZ8zyg4
         bIMg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=qwNEe73w;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::844 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=t7UqkXKVLi4IpngXlpGWE7DYQnaC7a+58IjGroUBONw=;
        b=ITTeB43FL5JrQ7Ccpt0BcaW9ukD8nbdmMKdzOUDrm84i+9C6IbJiNcxd5y0JB7CyzY
         IFTtiJDGf1NLKGwzBrZhTdrm6goKqLTxmSiIINELwnVycqntS9QFql/YhvkI80A4uA+G
         sShwzC3P7LbEhQwvuZb9L8M4LeI+dSsSgvKWT8ULjHuRSsW7Gb1jDpk4SpHJVVg8EeZZ
         MH4GJDh/wOVKMeu73YGgVtDXWhn+rkA6USPze6CFeKlhM00uH02rN5Q4PaOiYEBkByLz
         55/PKgHMcQDMTepbpzi49f/Lnlk9csCgKK6vR2JOfoWznXRzGJ23+BzkXL7Ht4TljQMW
         rWfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=t7UqkXKVLi4IpngXlpGWE7DYQnaC7a+58IjGroUBONw=;
        b=rw4PW4LJCwtH4oq04sTSOqpR861rDFqBZu0snkwLQMhWURi3xjS2lWGxyhZT0FzqWx
         t4AY6f0ZFurYmgMwgBuAfAmX0PsW25zSzVWGabCtyBxq2zfWKeUn8uqFUB7Nr/EhJZut
         RIxZA6dhRVtnvTiaYCartbgitieDr1qaYNZem6rdriXRTKRLlRgYcxl7Yj1H5LPCNzIu
         XgbwMSFCzP9ftkksoS3/1lDVO6PBThYwjd9rVunQp8nqYoFRG8sjVL+hq8OzKZSQUpNP
         Nw6UB/ukoFFL9q1zsu/5QO4N8Eca0DFdPKCVGls2q+YxcnY89RBWaH9gGuw8AZXkKPW4
         2tHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=t7UqkXKVLi4IpngXlpGWE7DYQnaC7a+58IjGroUBONw=;
        b=VxV0HIXAIopMAOjn7a6n0JkENFaxeJABF110sDRtauaS7nfGQBcWT5gpeFPDoWCITX
         OrcF9yqeCIKVyIarcjyXtqBqERP4kZqiMeImOLa2Yn1MSdvnL/3jtZ0agdoHDshkg7pW
         XbKfW8N4ha3kmwNNIl/pOYVDLOQ6uoD8xmluOIgkNIwrXQ9ZsIZYGWb7Z6JI6negDGqR
         ktFTMFK//T12LgvOSpfhFyOiO8NO3SMD/Ws+opnRgT3rWh63bUWrO8gK+xlCWkafWJrv
         Q60JlambMNr/9goIWkmUJzfjLgPObCaFQjUWA2qHT7acjMEB/6Ip4teI+62/HBS/xnhp
         KPaQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532GjEmE4pGJR68ymXAFshCfVTV3nNp4pA5CphUhXg6o6Ioir7UB
	HkPrMpq1Eax2IgrR01KZ9bk=
X-Google-Smtp-Source: ABdhPJym2DPZCjMXZtMUqWMYdUJOoNqDCM4ZU/j+2vDJ2AZoikfXCurow5eUSr3EfdIelbuGdaWv6Q==
X-Received: by 2002:a17:90a:7384:: with SMTP id j4mr3336246pjg.138.1629795872985;
        Tue, 24 Aug 2021 02:04:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90b:218:: with SMTP id fy24ls1084498pjb.3.canary-gmail;
 Tue, 24 Aug 2021 02:04:32 -0700 (PDT)
X-Received: by 2002:a17:90a:7a8b:: with SMTP id q11mr3283723pjf.189.1629795872302;
        Tue, 24 Aug 2021 02:04:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629795872; cv=none;
        d=google.com; s=arc-20160816;
        b=SLBAEJCp4lxKzuXsCoSlchzvC/q468JWQcHKq8TYczV4H3nkPt8fppn+5VDA7OWsdC
         JqAzIN2pHRlDp2NW8eNTdSiyDOQsO1sNUkzCTAW3kuEjD8qcjP3f6s0cMj5i9Q2bGmvM
         Ax/tyHVzJFF6vFQF5PGZkiL9Mk3OoVxPkmBkOyLKcoHwg9E7i6HrYwQvW60Q7A0rRLi4
         I7Iz3DtghhHUpC0d+N0dZediAXW8aa2FLSnjG99xQDOySF/WQRMVDX+YB3ZxF3idH60c
         HsmyIWhg+IvF/PqmcS/nFXeXxTOzN6gAt3NKtduckZmnIlvMXKX4Za+VB0SdGJDi5Xr4
         mbhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/+jgcgwKg3hCuablCp+InBeVA9cKfg4VIYtaMSA1Qp4=;
        b=B3ntAWUWuPgQsdXO7sLKVSiqxxabjfH5zv/X0PgJndqfY34Xyu3HQ9RSigEfVtMR3R
         CEATpZYfzd+PTU2CwJMFAMxbItIGdVvnWVb4AJtGGciUrffamX5FiLIQj9IKWBptCayi
         DCh1h4JRm4d7XU1pXU2azcumD+CXcLe/2fVFxC+EkCrwEI6Ybe2yi4eN2Ruzq82XGQXg
         qAAz7XRCUKne52kUcwedbqaap/cHSZAR4KqrnuB3ts4UbDs8b0Ed12nkXuZGu6lF2Jsh
         tq2MYIp3YyX0vWukBOnnpgd5HSpM9X28jw4mggd4I/k+NlRuMS1d2dA6hMSGHPZDu6q1
         F90g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=qwNEe73w;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::844 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com. [2607:f8b0:4864:20::844])
        by gmr-mx.google.com with ESMTPS id i123si1238630pfb.1.2021.08.24.02.04.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Aug 2021 02:04:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::844 as permitted sender) client-ip=2607:f8b0:4864:20::844;
Received: by mail-qt1-x844.google.com with SMTP id l3so16156806qtk.10
        for <jailhouse-dev@googlegroups.com>; Tue, 24 Aug 2021 02:04:32 -0700 (PDT)
X-Received: by 2002:ac8:664e:: with SMTP id j14mr34331912qtp.194.1629795871546;
 Tue, 24 Aug 2021 02:04:31 -0700 (PDT)
MIME-Version: 1.0
References: <CABSBigQ_5F-LfmMxFAtZLpHWfe997LHXUDGfVdhNrzJ3D6c+WQ@mail.gmail.com>
 <05fef2bb-c4bc-a81b-c2be-6f0aa7c3c343@siemens.com>
In-Reply-To: <05fef2bb-c4bc-a81b-c2be-6f0aa7c3c343@siemens.com>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Tue, 24 Aug 2021 17:04:23 +0800
Message-ID: <CABSBigTv5cgrVU8fQ6mzg-7uiZBBh=w1gqUYpu1VqiF+c4kppw@mail.gmail.com>
Subject: Re: arm_domain_dcaches_flush() when arch_domain_reset()
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: gengdongjiu1@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=qwNEe73w;       spf=pass
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

Jan Kiszka <jan.kiszka@siemens.com> =E4=BA=8E2021=E5=B9=B48=E6=9C=8823=E6=
=97=A5=E5=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=887:12=E5=86=99=E9=81=93=EF=BC=9A
>
> On 23.08.21 12:04, Dongjiu Geng wrote:
> > Hi,
> >      Sorry to disturb you,  I  have a question to consult with you.
> > when do domain reset why invalid the domain whole normal memory
> > including VM's memory.
> >  I think the VM will invalid its cache when booting.
> >
>
> The main reason is to avoid leaking anything from the previous domain.
> See
> https://github.com/siemens/jailhouse/commit/e27313789869c0f3d93ed4b19424f=
d859943f94b.

Hi Jan,
    Thank you very much for your reply and answer, understand it now.

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
jailhouse-dev/CABSBigTv5cgrVU8fQ6mzg-7uiZBBh%3Dw1gqUYpu1VqiF%2Bc4kppw%40mai=
l.gmail.com.
