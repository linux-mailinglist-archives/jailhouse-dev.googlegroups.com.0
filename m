Return-Path: <jailhouse-dev+bncBCX7HWUSSQARB7N4Q2KQMGQEYBF4UHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x738.google.com (mail-qk1-x738.google.com [IPv6:2607:f8b0:4864:20::738])
	by mail.lfdr.de (Postfix) with ESMTPS id E9728544496
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 Jun 2022 09:17:19 +0200 (CEST)
Received: by mail-qk1-x738.google.com with SMTP id v14-20020a05620a0f0e00b00699f4ea852csf18447839qkl.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 Jun 2022 00:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=w2VkG/qmnGTmrQc3uo23/7I5GzCz3+msMTcg9y4hE3w=;
        b=gFdPvQsXMZNjPxsEazpNl8OdKXAj5Fvgt6RotxCwBd11GkbBn10fa/FlkY7DlAboEC
         cBiOev4hYbiPtLUQ/ne5OjuaMwlo+Mn5n68KFVu+iIOrTXjH6CYbvGh3vYyZNKcaHBWQ
         h3M28PHgMTII4bEyYyO0arwVuxi4G5DBhuxGwpkwemAG97vYDXNVkmm5BS1f1hWRuNVm
         KaEuAcNkazI7NbfluCbqGw9bie13aKi9USpvtX0r5J8CuZ4StRSfc54YpjtgTwq1nI6S
         VGAj5KsoJpP2cbg7XRKNVh7iUArnu16Dw9mG+oAPwUAytm0ghpFlwD/rsH/ZGhxAg8rF
         nyWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=w2VkG/qmnGTmrQc3uo23/7I5GzCz3+msMTcg9y4hE3w=;
        b=I+EFsm29UMM3hdM6esX45c0jqZzMEppMb1vRBpDuqfou4QVuyTZzm9+ttg/GS9wS3d
         ML8nvcdmweROD6/le8t/ZryZFW5D94Id/X1l9jJM49dwp8BsEVen31WcuLduQJVeTPTq
         yKCHyUoV7RDClKBOcbtgVtwTy5D9JxWVoQZGDDanJ3+j4CQM0KYgknnBvha0eywkzm78
         OMGSR2Z9QPUUgCE5HFj7wXghEaN0Vu6SXsjXb4XdUbx2gVnMfSp09WKGjdVTjzlxXE6T
         YB8RBF92x314ELutTdGulCe1a1IZO4C+jRPWEpU0y9H/SnnGJyc4TXEbtrozp04jctf/
         32IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=w2VkG/qmnGTmrQc3uo23/7I5GzCz3+msMTcg9y4hE3w=;
        b=islIrCDGa8EkCmO4Yg6NJBTIOtDslQPpSqJPkZH2dzuiQste8VoiZ80++Ct7qqgDka
         ++DWfrfh1Nhu66v+fdzUIYkeTmyZklOSprLlq52hlYyL5y8+KbU2iM9yysRM5B/WCXrm
         XH8+vdqnToGnOQ73xoPLtURMj8rYPukU+l82757MWF60F1DtugXL9obcvsdUuef2s15h
         Vm3Mgbh5xGzlq6KQmFa7e3fKaxkx5gxN5TZ/1K8i4glg5HSzz+K5k8UG+necxqm45dPm
         OVGFAJI4qu0KPSrQJwk3XAtJpnk3HKMv39/M1W+q/iDdU8aNX12HzUHtuM3z+WDuaiDZ
         REqA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530wWCWqR/byLzI95OskmFCRcS8b6r7TOZY0Jj8ySWmTd2jUIW4S
	3iahDxayMDLwrxJga+9EFv0=
X-Google-Smtp-Source: ABdhPJyUe6Yse/7yX6PAyUezLNztPi0cHOyfva5WtDM4wH646NCxB8u4aOlXq2i1+hO4yaufyhpgqw==
X-Received: by 2002:ac8:5fd6:0:b0:2f3:cf81:9821 with SMTP id k22-20020ac85fd6000000b002f3cf819821mr30418554qta.359.1654759038351;
        Thu, 09 Jun 2022 00:17:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:4918:b0:6a7:3034:878b with SMTP id
 ed24-20020a05620a491800b006a73034878bls311563qkb.5.gmail; Thu, 09 Jun 2022
 00:17:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4714:b0:6a7:2f11:d04f with SMTP id bs20-20020a05620a471400b006a72f11d04fmr544497qkb.688.1654759037449;
        Thu, 09 Jun 2022 00:17:17 -0700 (PDT)
Date: Thu, 9 Jun 2022 00:17:16 -0700 (PDT)
From: Jean de Bonfils <jdebonfils5@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <b9b1edf8-b569-4d0b-8b41-778b1f8eed23n@googlegroups.com>
Subject: Trust and security model of Jailhouse
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_120_564811518.1654759036842"
X-Original-Sender: jdebonfils5@gmail.com
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

------=_Part_120_564811518.1654759036842
Content-Type: multipart/alternative; 
	boundary="----=_Part_121_31722427.1654759036842"

------=_Part_121_31722427.1654759036842
Content-Type: text/plain; charset="UTF-8"

Dear all,
I would like to understand the trust model of Jailhouse, I have some 
questions regarding this:

when starting inmates, is jailhouse supposed to check any inconsistencies 
defined in cells configuration (like setting memory regions for inmates 
overlapping each other...) ?

What if, because of a misconfiguration in an inmate, it is able to destroy 
another inmate running ?

Finally, is it the responsibility of the root cell to ensure the correct 
configuration of the inmate it launches ? If so, from the root cell 
perspective, how to ensure that a .cell file is properly defined and there 
is no  inconsistencies   with other cells already running ?

Thank you in advance and have a nice day.

Jean de Bonfils  


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b9b1edf8-b569-4d0b-8b41-778b1f8eed23n%40googlegroups.com.

------=_Part_121_31722427.1654759036842
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear all,<div>I would like to understand the trust model of Jailhouse, I ha=
ve some questions regarding this:</div><div><br></div><div>when starting in=
mates, is jailhouse supposed to check any inconsistencies defined in cells =
configuration (like setting memory regions for inmates overlapping each oth=
er...) ?</div><div><br></div><div>What if, because of a misconfiguration in=
 an inmate, it is able to destroy another inmate running ?</div><div><br></=
div><div>Finally, is it the responsibility of the  root cell to ensure the =
correct configuration of the inmate it launches ? If so, from the root cell=
 perspective, how to ensure that a .cell file is properly defined and there=
 is no&nbsp;

inconsistencies&nbsp;&nbsp; with other cells already running ?</div><div><b=
r></div><div>Thank you in advance and have a nice day.</div><div><br></div>=
<div>Jean de Bonfils&nbsp;&nbsp;</div><div><br></div><div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/b9b1edf8-b569-4d0b-8b41-778b1f8eed23n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/b9b1edf8-b569-4d0b-8b41-778b1f8eed23n%40googlegroups.co=
m</a>.<br />

------=_Part_121_31722427.1654759036842--

------=_Part_120_564811518.1654759036842--
