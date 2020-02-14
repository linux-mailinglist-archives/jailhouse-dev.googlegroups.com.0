Return-Path: <jailhouse-dev+bncBCDJXM4674ERBVE2TTZAKGQEMH4IHGY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x339.google.com (mail-ot1-x339.google.com [IPv6:2607:f8b0:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB1515F887
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Feb 2020 22:12:53 +0100 (CET)
Received: by mail-ot1-x339.google.com with SMTP id 4sf5922963otd.17
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Feb 2020 13:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MwwRfvI5aJa/FvfZjs67dKOOjZ7TMuUUOzrwiJ4Kstc=;
        b=KDv5sjpD9mQZprRQXU8xmlexk02MXUEIhCtIbcZAPt9tr3au7yYeOomreZapD0zVpi
         DB7zu/idfuoUWs1shesLM7FY9miXA4ePricj6A3nQ5555aYWzh1Zt6kLO+v1tBeS4rir
         AIT38qJZnmBGKjFjEBZxtuA+S0lptZQoCtiW3wmzj8IYglGHr18+qZCOBJfTy/NSdEdK
         ygX5I0Wcbj4HrVxJSvYWyw1P3DoX8zDpxJjLlQPv9YfkTuvqzfgsNfoa6TC1mfYurO9t
         mSkRE+AArknKe3Zy2pkEupmgE5fbI8yo/whACTDe+wrp7GTvPCNUTxPY+VYD5QEQ4AiR
         s76w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MwwRfvI5aJa/FvfZjs67dKOOjZ7TMuUUOzrwiJ4Kstc=;
        b=AZgLFX3/rblzJVQ/vxvrintq9vkVgP1cpPXO/9cMV96gxHcEmctVTkVhHtc0/TIjVe
         hK5DS1Ek397HJhMhwcCWYiw6vWPWvdS5UBBbg9D88u8NhYUwJW+Us3QyQuiKuPsARfRw
         4xh5TaCXUAwPgg8HZiyV56/iPfQZgVPZ3MrpiNb3/KZYkN+XJ2dW9zJC6IIKSY90ggS/
         9yRzoGRjXybd6Rlr6KeEs5k5l49HvBBmmh8VWf9dgZ9zl2NVGt10TfzMKZKyDSOetoFQ
         rbgh4r+G1IWTgN0vrcffxBaHufvlDjpUSRuv6K29kUTMfhG9Omq85BuvrVCeptHMGqQP
         +HXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=MwwRfvI5aJa/FvfZjs67dKOOjZ7TMuUUOzrwiJ4Kstc=;
        b=cR2tI6icKgCqHFFCTRJNIkrpn+pV+7VG9F+qQxJgEat9CFIROYUmIG4OECaV+rfNjQ
         tuzUq7+QXWsSHu36drh9zCAO9MZMocxKUizeZiuTCLEt7E9sjNegaXXluCfeKoG2PqJt
         txYRdLaiS+FRNo3/j0Zxya0t7LQZUjJmAeL9Qi8n8wB7eThV561MUTXhbt5ONIMzGr7G
         wJXdjm10SyYSYFs1mfEYsGXUjzBnc178/WRsAGu9pql9xc4NEnpOB44yFvu6mXSOBi9K
         7CXFM9VLKrzleTIDiyz6XRVLNfy9sxvVZQdP4HqMgusOrUmCENwWpvghWexbpc07EJe0
         iCEg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUXkaxHTfeX1o7f5KQOZ5YUwAjcVPZUq0teIIhA02ozofCCtlQm
	w2HD0fUOzeIGEJ2/B9Ny1HM=
X-Google-Smtp-Source: APXvYqxee1nmCZNTIUbmaCV9ITc73XBj5i0M/fZ4XGMl1DIGfDxIaOobNVUFM1XLnsJgCu/tSpDgeQ==
X-Received: by 2002:aca:4c90:: with SMTP id z138mr3307847oia.140.1581714772439;
        Fri, 14 Feb 2020 13:12:52 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:7dd6:: with SMTP id k22ls74246otn.5.gmail; Fri, 14 Feb
 2020 13:12:52 -0800 (PST)
X-Received: by 2002:a9d:6288:: with SMTP id x8mr3748307otk.2.1581714771906;
        Fri, 14 Feb 2020 13:12:51 -0800 (PST)
Date: Fri, 14 Feb 2020 13:12:51 -0800 (PST)
From: Michael Hinton <michael.g.hinton@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ffb915a7-7216-49c5-a7ec-722d33ee2d05@googlegroups.com>
In-Reply-To: <20200207110143.3f84a121@md1za8fc.ad001.siemens.net>
References: <4d8ab27d-7a1a-4601-8d61-429dd0cdd018@googlegroups.com>
 <20200120144629.201f3081@md1za8fc.ad001.siemens.net>
 <b258dc63-26a9-4eff-852a-23d72d2e3258@googlegroups.com>
 <20200123131505.1e5fdeb5@md1za8fc.ad001.siemens.net>
 <5ba8f35f-912a-4749-bf8b-781193f45ebc@googlegroups.com>
 <20200127081602.08ea3fd6@md1za8fc.ad001.siemens.net>
 <96056326-0700-4779-b1b8-3b0df7134a73@googlegroups.com>
 <20200207110143.3f84a121@md1za8fc.ad001.siemens.net>
Subject: Re: Difference in execution duration between root cell and inmate
 for same code
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3521_2049619274.1581714771371"
X-Original-Sender: Michael.G.Hinton@gmail.com
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

------=_Part_3521_2049619274.1581714771371
Content-Type: multipart/alternative; 
	boundary="----=_Part_3522_767893373.1581714771372"

------=_Part_3522_767893373.1581714771372
Content-Type: text/plain; charset="UTF-8"

Thanks for all the help. I just want to give an update and mention that I 
also changed the (old) IVSHMEM code to do MAP_CACHED. It's now just as fast 
as my other MAP_CACHED memory region and is working great!
-Michael 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ffb915a7-7216-49c5-a7ec-722d33ee2d05%40googlegroups.com.

------=_Part_3522_767893373.1581714771372
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for all the help. I just want to give an update and=
 mention that I also changed the (old) IVSHMEM code to do MAP_CACHED. It&#3=
9;s now just as fast as my other MAP_CACHED memory region and is working gr=
eat!<div>-Michael=C2=A0<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ffb915a7-7216-49c5-a7ec-722d33ee2d05%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/ffb915a7-7216-49c5-a7ec-722d33ee2d05%40googlegroups.com<=
/a>.<br />

------=_Part_3522_767893373.1581714771372--

------=_Part_3521_2049619274.1581714771371--
