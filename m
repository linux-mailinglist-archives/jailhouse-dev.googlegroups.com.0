Return-Path: <jailhouse-dev+bncBDSMF24UTUGRBGXVZ33AKGQEE4EFVVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23f.google.com (mail-oi1-x23f.google.com [IPv6:2607:f8b0:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 017191E9812
	for <lists+jailhouse-dev@lfdr.de>; Sun, 31 May 2020 16:09:31 +0200 (CEST)
Received: by mail-oi1-x23f.google.com with SMTP id u128sf2749663oia.1
        for <lists+jailhouse-dev@lfdr.de>; Sun, 31 May 2020 07:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tk2ReIcSs8Cf0rmU5jh462CKaeEDVy8EhiANJk6OR0w=;
        b=nnvP88Ei3aprM8mcS8lY3TurTKTqc21LYQNd/um65qUCBMTlqndiJslFHta5BOpFye
         fgQv4WVebA9RaNBd1SPkbBADfltK6snd7hchdcK6I6LVGvCLi08j3EzRfeHWvxHjeEIt
         70KrSCUgCpZzO8qvsF71tjdypfNIXY1EYBivzsGDTE3RbVbLii+hHKknWEPOctwofV4Q
         e7cRM86tqm52NNhThkEUguDOP4cEJ2LTjwDCHz0UmxPAC7MEU/Z7pDn6VKpXHcg+a3Na
         BsqAlf+QLpEfcjeYDEGIGLPeNxxHmiMmEJ0t30gFL2M/mPMZf89YkM4GShM6psOvGO9N
         CKWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tk2ReIcSs8Cf0rmU5jh462CKaeEDVy8EhiANJk6OR0w=;
        b=gk2Mwi5pklQkPvWCJ8QDBDL76nj+h+EqtPFIV++DdEye8upxlDs14LWaaYV6M0W8ne
         dKS1RHgDsitIWaakIA/n8h0Yw1nroFkt016DbwrbSzIYpYX11A0lvRm6OQ8mlr2MNIuP
         mYluIT5ibEnDHmbpQLkWsSZ6aTVaAXpejHFMrX1Q+o2KmJSUe/0v4c+0LYAIj+sm2iWu
         6FvBQtw7o6JNoNLVxsdqR0FhbY5hJZKHNSo4Lm61YHzCAgKAQIrerGqEo0g73fYNkVKJ
         QhTlvXZQFOuuSd804pKAaWX9Dz9p6K1LEQ3KzZVvZi3daGS6R1EeJ0DgjGGcCPt4LmKO
         ipWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tk2ReIcSs8Cf0rmU5jh462CKaeEDVy8EhiANJk6OR0w=;
        b=cT7x/C+8hnTnx4wIxV0OLg+FOaVrwVQR4WL68JiPH/pTn5TlOiYVnylHhblUY5f/dN
         xWlOWQpmZEFwcR7NpYHyfv4IjUkUU88UA6K/50uswKMNKWkQ3OeRzUA4F/pALiVjJGko
         7wp8y/QSQeSY6HtwbE9A1hFnQlCsJ6uS4cgkSVHTHDPUeIzWNjB8t2685+Tj8D24e61Y
         0doRxiD23P4TLRuq9d8DiPHazfVi+qMrgYnxgrNYtYsbDLHhd3C6uoKeZnHf2c4cstPm
         sLDJGoGhi+mmawGpChk9r0D5pkDspLktKo/LFpF7TCwr8FdiS33Yqykf+ClCIJZvV+Yk
         0UzQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5303edo+8v68aLsBhVO4/EkNrL3jPRHv7oMJjgdvHa1lmKKWAlzJ
	H2NaaFi0QoUySV3P1jnNVC8=
X-Google-Smtp-Source: ABdhPJyvdDv9zIKDaRPcbnJvm2+o8onUUQtz4FIUChcmXmDsXlbR7W/1106KWOERb9HZqb5PL0e8IA==
X-Received: by 2002:a9d:b82:: with SMTP id 2mr12679086oth.221.1590934170388;
        Sun, 31 May 2020 07:09:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:61c2:: with SMTP id h2ls2241103otk.10.gmail; Sun, 31 May
 2020 07:09:29 -0700 (PDT)
X-Received: by 2002:a9d:674f:: with SMTP id w15mr2662391otm.156.1590934169603;
        Sun, 31 May 2020 07:09:29 -0700 (PDT)
Date: Sun, 31 May 2020 07:09:28 -0700 (PDT)
From: Parth Dode <dodecoder@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <68d7b86a-5fa2-4582-9f53-809c0fc3e760@googlegroups.com>
Subject: Jailhouse recipe
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4202_7105463.1590934168910"
X-Original-Sender: dodecoder@gmail.com
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

------=_Part_4202_7105463.1590934168910
Content-Type: text/plain; charset="UTF-8"

So I am trying to build OS for rpi4 using yocto.
I am not going for debian system so im not gonna use Isar.
How do I configure jailhouse in this ?what are the recipe and configs , I need to keep? 

Parth Dode

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/68d7b86a-5fa2-4582-9f53-809c0fc3e760%40googlegroups.com.

------=_Part_4202_7105463.1590934168910--
