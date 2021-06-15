Return-Path: <jailhouse-dev+bncBD53DGEPXUCRBDG5UKDAMGQEWU3WHWQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x740.google.com (mail-qk1-x740.google.com [IPv6:2607:f8b0:4864:20::740])
	by mail.lfdr.de (Postfix) with ESMTPS id 078013A8118
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 15:43:42 +0200 (CEST)
Received: by mail-qk1-x740.google.com with SMTP id y5-20020a37af050000b02903a9c3f8b89fsf28032693qke.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 06:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=DP9KYHIWabph6DeswxFZlDuow/8ZO6jjXjgAkVGZmLs=;
        b=CR7HhwcWFSsAAJE4TMY3d/9ka50bG+MV4cUpmyHMWpWOdBMI6dPUBz0iy2+sEOPGbj
         /hGSqha5COrnuLkIHKXbmzw5E0lbm07WNoI4MKimwOMlU0Bh5OJQ17TiBpKwuEpnZfxo
         c7UGdbfMXZtISmj3RUXLo3zh1oG7IX/IDvYKW9asON6zkIfyk+oCUrB1b+B7R2WNogb7
         KZn/4rGvMZFZSjnOdBLconnk/to8bZVpekAtUgH2uP3s4B4oXM0+5QnJe86Y5fzsf1+l
         m82/MHBUEvKkO0y77+M2NmLWTuADbCaZU+rwhEfE6St2rI8GvLbX1q4unAnTssIp39wR
         kSKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DP9KYHIWabph6DeswxFZlDuow/8ZO6jjXjgAkVGZmLs=;
        b=J7gRbZVFgCMyAXiQNaaoDBm1Ai51CMB5oLVmw5Zh5Lwtx2epqESAYOHEfKXkJHFb7h
         yibnvddFJ32BfzvNoW27c1MWvnT/XHH8hY5YMJTRaCdC/EN0UR6Vb4ee4FOBMisfuSWs
         gJ3v3OjylftlTm4bVQ/75hEEfafYSJjPmZp57rcGnS9i59XZ9/8pgssQnE+DhDabAIt8
         tA7zsYMHINLiNNG0lCN2mjMeVxZhaL6VFq0cW7WfFkG7KuN+1FqliIAA7pBGk6H+7eVO
         W9iCOQZw9WvRU0J/Wu0HdInYgyO4mYh7is371Nn/Cj0MPXSlj3etV4QnWqT78IF9iRz3
         Td2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DP9KYHIWabph6DeswxFZlDuow/8ZO6jjXjgAkVGZmLs=;
        b=RUf83oTiVI49l0RKA6t+L5SJ5yWVtfUQqZek/ADVdCxGv9zj2RM7zzOEP0Lo8bU5Qa
         l5ECOiboN1372WUmo/ftp9RJgOdtvCxzdxGMQnowwcc3YVVLFnijodpymqUhRzWf6sEi
         wWI2/JxC7Ha8y57aLsVhroIwu6cl6Ix9aeemKVki8C/3583hPRKSv+0cFumQalaZUvE6
         o1HvgwN4+Ld/bkOFj/PotYVCMO0smbjj3aYvJpJ6+wYQhohBfrwoYCINQlLB82vVR0pc
         nbWsMEpq3N43QY3ECFKiBX3w7gbXMZsIOepOjH01DkuoDI+DcTegtwI/l+F1pdI4+AkA
         Sbeg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Pkjj/uReHPTEXLuJO3Y0GBPVufnhQF6+aVU9ej9qVEQgkDtAb
	Jl2dxNzEJw4DbjfgwpKSiB0=
X-Google-Smtp-Source: ABdhPJw+LXG41m+g92YeHkbgcAMm+qhEpkv1s/7OLS5iC0XItODVe6kj5hmP0YssiUQfWNjC3iNgXg==
X-Received: by 2002:a05:620a:1644:: with SMTP id c4mr22054077qko.247.1623764621146;
        Tue, 15 Jun 2021 06:43:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:5cd5:: with SMTP id s21ls2984241qta.10.gmail; Tue, 15
 Jun 2021 06:43:40 -0700 (PDT)
X-Received: by 2002:ac8:71d9:: with SMTP id i25mr21949883qtp.385.1623764620532;
        Tue, 15 Jun 2021 06:43:40 -0700 (PDT)
Date: Tue, 15 Jun 2021 06:43:40 -0700 (PDT)
From: laurent gauty <lgauty@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <d88492f5-3780-4f6e-8fd3-53a609ec4133n@googlegroups.com>
Subject: cell using rootfs on an external USB key
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1120_1678047409.1623764620022"
X-Original-Sender: lgauty@gmail.com
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

------=_Part_1120_1678047409.1623764620022
Content-Type: multipart/alternative; 
	boundary="----=_Part_1121_379984211.1623764620022"

------=_Part_1121_379984211.1623764620022
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm planning to have the linux root cell on an MMC card of my board and a 
linux non-root cell on a USB key plugged into the board. The rootfs of the 
inmate for non-root will be stored on a partition of the USB key. So here 
is my question:
- Do you confirm that i need to declare into the dts of the inmate the USB 
port that will receive the USB key ?
- Do you confirm that i need to declare the USB port (memory mapped) inside 
the inmate cell ?
- Did i forget any other steps ?

Or am i totally wrong ?

Thanks,

regards


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d88492f5-3780-4f6e-8fd3-53a609ec4133n%40googlegroups.com.

------=_Part_1121_379984211.1623764620022
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,</div><div><br></div><div>I'm planning to have the linux root cell =
on an MMC card of my board and a linux non-root cell on a USB key plugged i=
nto the board. The rootfs of the inmate for non-root will be stored on a pa=
rtition of the USB key. So here is my question:</div><div>- Do you confirm =
that i need to declare into the dts of the inmate the USB port that will re=
ceive the USB key ?</div><div>- Do you confirm that i need to declare the U=
SB port (memory mapped) inside the inmate cell ?</div><div>- Did i forget a=
ny other steps ?</div><div><br></div><div>Or am i totally wrong ?</div><div=
><br></div><div>Thanks,</div><div><br></div><div>regards<br></div><div><br>=
</div><div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/d88492f5-3780-4f6e-8fd3-53a609ec4133n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/d88492f5-3780-4f6e-8fd3-53a609ec4133n%40googlegroups.co=
m</a>.<br />

------=_Part_1121_379984211.1623764620022--

------=_Part_1120_1678047409.1623764620022--
