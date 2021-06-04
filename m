Return-Path: <jailhouse-dev+bncBCMYJFG524BBB4X646CQMGQERQZX5MQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3c.google.com (mail-qv1-xf3c.google.com [IPv6:2607:f8b0:4864:20::f3c])
	by mail.lfdr.de (Postfix) with ESMTPS id AE38939B6F8
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Jun 2021 12:24:51 +0200 (CEST)
Received: by mail-qv1-xf3c.google.com with SMTP id n17-20020ad444b10000b02902157677ec50sf6371762qvt.12
        for <lists+jailhouse-dev@lfdr.de>; Fri, 04 Jun 2021 03:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xZGcpcs/4eWHnzW4G1ZfOXw9MNgNIxKNzfsa7Z33DpI=;
        b=mpcNJeSZVbJpPu3SzR9k5NwRcjp1cFhiqMlMwFXOxz/tfsLt2TAPAJB3DEO4/gHBzV
         6eNnhYadMf2bXeOqCcLC+BE9BgXOJ2aeu0NddLXr7SDYpPKID9kddIsviKReKUPsPsu0
         /2GVtfoXMzjRAp/hg1Njbe97Gsq8k/a9Bh47/N/v64UPU5w+CZ2u0Oz+nm0LMp0MPEz3
         Vu7i+WalsMFXxNsh11CrsOeuKyHzLU2BJedbpZseIIa4JBGcmLOEjFobYoviBNP4ehMQ
         3x/292Kj7oC2YtIs1xPd0HhqvRWcvDtNFMiuWn1SwLxPq8dRSTH4skUcOZoBWyhAXAMQ
         Gl4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xZGcpcs/4eWHnzW4G1ZfOXw9MNgNIxKNzfsa7Z33DpI=;
        b=u6FZBcGgzD5LkD9DmnP6cbMLbwdVvil04a0DSkJh+rGMQyv2MHci9tG78Mj7tSXkmn
         sE7javCYGbf/uuY9NaA3F/z/QsaxtCuHn4dnZoPpVaG2swJ3IDRxO1whwwGkscODsbAw
         EbVeFyD66dS1WzLBMfm7qsviwlSXV3HALdJaFSh/cTeMDtIoUsg+6gq1Y7rXn6ZqlmWP
         I5qiXdVMcWmJ0bxNlTHTO5KftPp/X9i2nD5jV04DE43O+hKdH6hTicCC3oJNpFHpwpES
         59iw47Eq437p2G9s5KlxuUxD7l5NzacAfGnOTKYIjFqWdQeUFxZT6gXRSqfkrhQyl1Hi
         9ykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xZGcpcs/4eWHnzW4G1ZfOXw9MNgNIxKNzfsa7Z33DpI=;
        b=EGcMH+1luFFPUvnMTJXdi6vkDOTx5aht2bK7DppcTeCZuzxofSM5uweBJT3LyKYMMi
         VwQ40D3cpZFGtusqXz0eNWAfT+hPNYbLp4zn453/MbphRMNuMZ7mZlSnRA8bQdABOYmd
         8JFgqTuWdTMLb/JFIbkDVA727458COEStvWtM/T+DFAulDN+Urs2KWqlB35R8H2CSW+9
         LKzBwUGh/3olYBxk6uhlv378dYjmlQYvb6ZKrQEaLWZ6can9T3pzIG1pJkK/giXS2Ic5
         IDVZz5RjB43xf/LSgi1jwPjxzqQH+r0XcZ8oLJToCAuJu8clra2KUOzm6EaW95AYh+mL
         GPHA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532G1R2yFS6Y2sozsxz+0KeMAk+ZIvFFUojmD7OdAiojly37zp/n
	EYXYTy/N19vnwMIxiHb6hXc=
X-Google-Smtp-Source: ABdhPJzNT9il0KQBf13txpwmCtS2RiE5YMt3WoSWsBONyfrr0cDeR1CjEbo6t5o5b/oekP39S+JRvQ==
X-Received: by 2002:ac8:4d50:: with SMTP id x16mr3882787qtv.271.1622802290240;
        Fri, 04 Jun 2021 03:24:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:20ef:: with SMTP id 15ls2086328qvk.11.gmail; Fri,
 04 Jun 2021 03:24:49 -0700 (PDT)
X-Received: by 2002:ad4:5bef:: with SMTP id k15mr4113051qvc.22.1622802289610;
        Fri, 04 Jun 2021 03:24:49 -0700 (PDT)
Date: Fri, 4 Jun 2021 03:24:48 -0700 (PDT)
From: Nikoleta Markela Iliakopoulou <nmiliakopoulou@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <10331404-4fab-410c-ba3f-77f4ed6ccbebn@googlegroups.com>
Subject: install and run jailhouse on rpi4 board
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1258_362569112.1622802288916"
X-Original-Sender: nmiliakopoulou@gmail.com
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

------=_Part_1258_362569112.1622802288916
Content-Type: multipart/alternative; 
	boundary="----=_Part_1259_1548939502.1622802288916"

------=_Part_1259_1548939502.1622802288916
Content-Type: text/plain; charset="UTF-8"

Dear all, 

I am student in ECE NTUA and I am studying Jailhouse for my diploma thesis. 
So far I managed to install and run jailhouse in virtual environment (QEMU) 
in x86 and use ready-to-use jailhouse images for virt environment for both 
x86 and arm architecture. Now I am assigned to install it on rpi4 board. 

I know there is this repo https://github.com/siemens/jailhouse-images with 
ready to use image for rpi4, but I would like to install it manually to 
explore better all the options provided, write some code on my own and test 
it. 

I have already explored the internet and this google group for further 
information, and apart from some general guidance, I didnt find anything 
specific/(or maybe I coudn't understand some key points). 


I would really appreciate it if someone could give me some advice/guidance 
on this subject.

Thank you all in advance. 

Nikoleta Iliakopoulou

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/10331404-4fab-410c-ba3f-77f4ed6ccbebn%40googlegroups.com.

------=_Part_1259_1548939502.1622802288916
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear all,&nbsp;<div><br></div><div>I am student in ECE NTUA and I am studyi=
ng Jailhouse for my diploma thesis. So far I managed to install and run jai=
lhouse in virtual environment (QEMU) in x86 and use ready-to-use jailhouse =
images for virt environment for both x86 and arm architecture. Now I am ass=
igned to install it on rpi4 board.&nbsp;</div><div><br></div><div>I know th=
ere is this repo&nbsp;https://github.com/siemens/jailhouse-images with read=
y to use image for rpi4, but I would like to install it manually to explore=
 better all the options provided, write some code on my own and test it.&nb=
sp;</div><div><br></div><div>I have already explored the internet and this =
google group for further information, and apart from some general guidance,=
 I didnt find anything specific/(or maybe I coudn't understand some key poi=
nts).&nbsp;</div><div><br></div><div><br></div><div>I would really apprecia=
te it if someone could give me some advice/guidance on this subject.</div><=
div><br></div><div>Thank you all in advance.&nbsp;</div><div><br></div><div=
>Nikoleta Iliakopoulou</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/10331404-4fab-410c-ba3f-77f4ed6ccbebn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/10331404-4fab-410c-ba3f-77f4ed6ccbebn%40googlegroups.co=
m</a>.<br />

------=_Part_1259_1548939502.1622802288916--

------=_Part_1258_362569112.1622802288916--
