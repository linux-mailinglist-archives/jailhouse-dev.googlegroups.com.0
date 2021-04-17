Return-Path: <jailhouse-dev+bncBC2PTC4R4MNBBNNO5KBQMGQECN4DCZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83f.google.com (mail-qt1-x83f.google.com [IPv6:2607:f8b0:4864:20::83f])
	by mail.lfdr.de (Postfix) with ESMTPS id D813F362E77
	for <lists+jailhouse-dev@lfdr.de>; Sat, 17 Apr 2021 10:07:18 +0200 (CEST)
Received: by mail-qt1-x83f.google.com with SMTP id o17-20020ac869910000b02901a7c59f1c14sf7419046qtq.13
        for <lists+jailhouse-dev@lfdr.de>; Sat, 17 Apr 2021 01:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=H/81BavM0Rw2wDuLmCrKUVn+egU4hVLvk/wyjUi0UsQ=;
        b=kTsiBVflFgmQAck1+UO3HZJDYbzQlFFm+8iF3UOSMBTCKxwyGRSWEOByP48xq7e8SZ
         B9Wm6hEkeuZGd/dKQlwu9HZq2xWhTMgYOm6O2qXvDrAUhpK1RHnBRQnkI6n73wX9wpBI
         KjdLZiQu5KpOraYgIg29CGO4WPB5fXPTnWJbZDt0xuxidF8+ymxN7J/J8KFypv1G3WDL
         xQlbPFqCqfMGELVA6cNlmenUZbDVnzCU5JS9lIPtotETVN3mY+2kqadumdPc2lVU73Yy
         Bv7XtvWZTV8milKMEPlL8WMCeU1u+TIXtDR9iIP/+UZIHJXMkAHA9uu6Wuo2UIVmDxL4
         A9ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=H/81BavM0Rw2wDuLmCrKUVn+egU4hVLvk/wyjUi0UsQ=;
        b=IKoBgSs+FSGrx02X84z7EXejN8uB2TB9KOepnC6lnjA0meHj2WKkeWJ35KoGoSzoLP
         lsUrSbJxK+Suarjbmtk3PGiZd+jMVVlc7SeIVNifTElJTEc0xn+g2COWsdaSKBeZa85/
         6agqyJ5nF0ElVXW5PRCW7QeSva9HxVMdPs/aB0HY5Zj+kI6mds+qJu4+ynCip9sIb378
         E1dzg8RtxPl4FkYFT5jIPftwjwkSNWGu2/PkUKzZkdT7Nm09T56R4MAYZ8ke9D5AbmAj
         dRJ07Pe9DS/N/GS75u6aG/naciUAa9hit1Xs1gFPxi9QGDsfzkn98tbQa22X+V8R2wrz
         t0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=H/81BavM0Rw2wDuLmCrKUVn+egU4hVLvk/wyjUi0UsQ=;
        b=Ce17lBzN7Ws6ZWZNA/Axr5UVrkGj0KR165jQAHdxlc3nnEk5HF3XDP17kMsQPU98ET
         Mqw6RD97bIhhvJchrHf+/Z5FoD49dvdVddQd+7CQK5WthLc1mtS7sqEZaqF1UAUTwxy6
         0ih/sorEWMpaN/hnj2Va06UQ7lh633y60tP604yqiXyvo8/QGW8PSrvOlGNRT6fTLoXI
         Hqou1CEDLrjDdLQtNzyjqFqo8Zs49IgspOsF1noQScRQt2xUnrF2KyjDPy9ubYCyS58+
         yhTS09fN6Z4smuwAo2tObmRV/VBenYu0iMooiuJXPM2gE5eUnIg99dREqKjQY7EfZBdf
         +WMQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532znVGJBGeqcPhrNekHub2YEnIc01A7DlJaU3UlLhF8GI58R7sS
	YgOxnfF6AH37Cq7j2QAeXsk=
X-Google-Smtp-Source: ABdhPJzyVIvj0eREFa5sbtlHVxL4fyHFWojsmDO+h2FM0jZCtWHdbY03lCiQ1DXViU3ppxjzmo9JjA==
X-Received: by 2002:a37:6f87:: with SMTP id k129mr2871996qkc.470.1618646837893;
        Sat, 17 Apr 2021 01:07:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:f84a:: with SMTP id g10ls3101094qvo.7.gmail; Sat, 17 Apr
 2021 01:07:17 -0700 (PDT)
X-Received: by 2002:ad4:408c:: with SMTP id l12mr12381583qvp.58.1618646837184;
        Sat, 17 Apr 2021 01:07:17 -0700 (PDT)
Date: Sat, 17 Apr 2021 01:07:16 -0700 (PDT)
From: Chung-Fan Yang <sonic.tw.tp@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <2bd89d4f-6959-4701-b661-3d3e98a2e260n@googlegroups.com>
Subject: Tested x86-64 SBC or mini PC
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_5118_30715781.1618646836553"
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

------=_Part_5118_30715781.1618646836553
Content-Type: multipart/alternative; 
	boundary="----=_Part_5119_1628417411.1618646836553"

------=_Part_5119_1628417411.1618646836553
Content-Type: text/plain; charset="UTF-8"

Hello,

I have been developing on top of Jailhuose for quite some time.
Just become curious and have a question.

Are there any officially tested x86-64 based SBC or mini PC?
Will a Intel NUC work?

I do have a working Xeon Broadwell build at hand it it costly to make a 
duplicate machine.
I did try to run on other commercial or self-built x86-64 PCs, but the 
on-board hardware varies quite a lot and I did have a hard time getting 
things to work from time to time.

I would like to find a more cheap and stable platform for x86-64. 

Thank in advance for any comments or answers on this.

----
Yang

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2bd89d4f-6959-4701-b661-3d3e98a2e260n%40googlegroups.com.

------=_Part_5119_1628417411.1618646836553
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello,</div><div><br></div><div>I have been developing on top of Jailh=
uose for quite some time.<br></div><div></div><div>Just become curious and =
have a question.</div><div><br></div><div>Are there any officially tested x=
86-64 based SBC or mini PC?</div><div>Will a Intel NUC work?<br></div><div>=
<br></div><div>I do have a working Xeon Broadwell build at hand it it costl=
y to make a duplicate machine.<br></div><div></div><div>I did try to run on=
 other commercial or self-built x86-64 PCs, but the on-board hardware varie=
s quite a lot and I did have a hard time getting things to work from time t=
o time.<br></div><div><br></div><div>
I would like to find a more cheap and stable platform for x86-64. <br></div=
><div><br></div><div>Thank in advance for any comments or answers on this.<=
br></div><div><br></div><div>----<br></div><div>Yang<br></div><div><br></di=
v>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/2bd89d4f-6959-4701-b661-3d3e98a2e260n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/2bd89d4f-6959-4701-b661-3d3e98a2e260n%40googlegroups.co=
m</a>.<br />

------=_Part_5119_1628417411.1618646836553--

------=_Part_5118_30715781.1618646836553--
