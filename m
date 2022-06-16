Return-Path: <jailhouse-dev+bncBDH5LQU54QDBB27QVOKQMGQEBESBWAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x740.google.com (mail-qk1-x740.google.com [IPv6:2607:f8b0:4864:20::740])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EA154DE30
	for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jun 2022 11:31:26 +0200 (CEST)
Received: by mail-qk1-x740.google.com with SMTP id k13-20020a05620a414d00b006a6e4dc1dfcsf1082875qko.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jun 2022 02:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Laiy9V90GJYunXZ8VeIkdH4qBEM3lxxPhR2//IlAlIo=;
        b=BQItK9vcAB8B7H9P1DlwwJCh7ik6Vc3A2Xufv5BvahfZVs7dPPsyTCpX0czHFgkZ2/
         VAj3ReailwcxnU6Qi70OP27mS1lH1rM1PwH1VRDzYu1NIR/y+HLB5sqWSSc/4PTNAWLy
         MqeEWU3762mrNZ5+TuFbRWjeWdSMgZeKeZfVQg5/TlXR8buXAiuqt1LBYW9S4ttl2w6e
         Pe8GDUIj2tgblWV/9acSTICmvjYo2hOMxNbG25Zf2Z3igxJLx+FI+6WcV5ECX0v0kKtA
         /sg6d6HRLc3IvVoyaWhMwjdBcYIwvMEH6+9pVNG4Es4xia1L7lXdHd652rljVFfUM3IB
         1n0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Laiy9V90GJYunXZ8VeIkdH4qBEM3lxxPhR2//IlAlIo=;
        b=OTMx5uVxHLgktJSGNA5ans/8AGNtoV193BRyJVa2yyOJ0A4sz3hK3+dpCWD5Kw6zmA
         C3fFsxuBD4qnl2ebF59PdB3rycQiIlqc3qCyfJQRn8AFbFI9Dcl+8Qesi9/nEYLkjF6/
         rhoMb5o6Jhc4/4IbrRHTxS1pZfx/fwIeGSpz6I/SFXZS14fOm7txDs6QXq/krkhBX+ow
         WWGAiq7nMkPtzGyCveBYLT9b1nXeNuYYVAvsJgLO8W2J16CWu4y29utmYPxnM5JqApja
         Xmxu8Qwohvq/9mkKgNnELRP6tgbBpH89oXuUGPfZcfjYK+iVTAhAsPosz1EpITE6kRXr
         Xu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Laiy9V90GJYunXZ8VeIkdH4qBEM3lxxPhR2//IlAlIo=;
        b=43pV2MGuuQZWWH4TxiBE1RhPPbZFF1QV7/JkJmeuIDkvIiPemwxwfwVmzu1MJpsk+F
         BBOkvzuIx/BqaGpmFxLS+e27+1HtO1+OQ+8M3dKzC3I0s2PdSx0yspQ2TVSl6zkTHhmG
         qw6qRymFaz4icJIZ2KIs+GKJADEm/dfOgtF1MN/XvnWntSBNQsdDXmLBKnixJMbtLpZH
         DltUc/E74k9nqD2PHl0UPrK1xAnK0UBRWRWg7l6jdGizSOZIXnfpGLO1+PnkC3TA2oK5
         RmftmYve25NMtpX5F/8+QWROPtZoYVoAJA5tahF9XVyCUFTNNrxp96h/i5rGmnoPu5Cu
         FkCQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora8eSg9AfY41df3mTXf9+rbrXTPkEZxSIPgzz90rKzADwqkgq45X
	dcMZiN4CCuWzdSIX53uLUsw=
X-Google-Smtp-Source: AGRyM1vD2Wn1TduuO3WNlbpwRuNvACGcHFhkellWAY5l2j9o/8KFuEOrHG5o90hQSBqeY7JbLaFpng==
X-Received: by 2002:a05:6214:2584:b0:466:67:7cd5 with SMTP id fq4-20020a056214258400b0046600677cd5mr3367945qvb.34.1655371883684;
        Thu, 16 Jun 2022 02:31:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:c04:b0:6a7:3c7f:2b3a with SMTP id
 l4-20020a05620a0c0400b006a73c7f2b3als790695qki.9.gmail; Thu, 16 Jun 2022
 02:31:22 -0700 (PDT)
X-Received: by 2002:a05:620a:4691:b0:6a6:c549:9ff3 with SMTP id bq17-20020a05620a469100b006a6c5499ff3mr2746583qkb.288.1655371882772;
        Thu, 16 Jun 2022 02:31:22 -0700 (PDT)
Date: Thu, 16 Jun 2022 02:31:22 -0700 (PDT)
From: "luigi.d...@gmail.com" <luigi.desimone3@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <057cb264-afe2-4f2d-8fba-adc8eefec16cn@googlegroups.com>
Subject: Jailhouse reliability/certifiability in ISO26262
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_444_1311985004.1655371882189"
X-Original-Sender: luigi.desimone3@gmail.com
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

------=_Part_444_1311985004.1655371882189
Content-Type: multipart/alternative; 
	boundary="----=_Part_445_558331958.1655371882189"

------=_Part_445_558331958.1655371882189
Content-Type: text/plain; charset="UTF-8"



Dear all,

I'm an assistant professor at the University of Naples Federico II - Italy, 
and in our research group, we are working on the performance, testing, 
reliability, security, and certification aspects of partitioning 
hypervisors.

This is to disseminate our recent work on Jailhouse 
reliability/certifiability for ISO26262, a preliminary study that was 
accepted for publication at 2022 DSN (The 52nd Annual IEEE/IFIP 
International Conference on Dependable Systems and Networks, 
https://dsn2022.github.io/) SSIV (SAFETY AND SECURITY OF INTELLIGENT 
VEHICLES) workshop https://sites.google.com/view/ssiv.

I just want to receive some feedback from this community that has both 
industry and academic researchers that orbit Jailhouse and partitioning 
hypervisors world.

The pre-print is already available on arxiv: 
https://arxiv.org/pdf/2205.12596.pdf 

Please, do not hesitate to contact me also privately (luigi DOT desimone AT 
unina DOT it)

Regards,

Luigi De Simone

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/057cb264-afe2-4f2d-8fba-adc8eefec16cn%40googlegroups.com.

------=_Part_445_558331958.1655371882189
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p>Dear all,</p><p>I'm an assistant professor at the University of Naples F=
ederico II - Italy, and in our research group, we are working on the perfor=
mance, testing, reliability, security, and certification aspects of partiti=
oning hypervisors.</p><p>This is to disseminate our recent work on Jailhous=
e reliability/certifiability for ISO26262, a preliminary study that was acc=
epted for publication at 2022 DSN (The 52nd Annual IEEE/IFIP International =
Conference on Dependable Systems and Networks,&nbsp;<a href=3D"https://dsn2=
022.github.io/">https://dsn2022.github.io/</a>) SSIV (SAFETY AND SECURITY O=
F INTELLIGENT VEHICLES) workshop&nbsp;<a href=3D"https://sites.google.com/v=
iew/ssiv">https://sites.google.com/view/ssiv</a>.</p><p>I just want to rece=
ive some feedback from this community that has both industry and academic r=
esearchers that orbit Jailhouse and partitioning hypervisors world.</p><p>T=
he pre-print is already available on arxiv:&nbsp;<a href=3D"https://arxiv.o=
rg/pdf/2205.12596.pdf">https://arxiv.org/pdf/2205.12596.pdf</a>&nbsp;</p><p=
>Please, do not hesitate to contact me also privately (luigi DOT desimone A=
T unina DOT it)</p><p>Regards,<br></p><p>Luigi De Simone<br></p>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/057cb264-afe2-4f2d-8fba-adc8eefec16cn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/057cb264-afe2-4f2d-8fba-adc8eefec16cn%40googlegroups.co=
m</a>.<br />

------=_Part_445_558331958.1655371882189--

------=_Part_444_1311985004.1655371882189--
