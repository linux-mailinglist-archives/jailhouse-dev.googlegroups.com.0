Return-Path: <jailhouse-dev+bncBDDYHZXV2EIRBGWGXGVQMGQEABVCWSQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oa1-x37.google.com (mail-oa1-x37.google.com [IPv6:2001:4860:4864:20::37])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1CC80429F
	for <lists+jailhouse-dev@lfdr.de>; Tue,  5 Dec 2023 00:39:07 +0100 (CET)
Received: by mail-oa1-x37.google.com with SMTP id 586e51a60fabf-1faef8466f9sf6675675fac.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 Dec 2023 15:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1701733146; x=1702337946; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMomagRnCIJv2avNYAvXPBqI8hAmxsSfPmdXva9w3ZU=;
        b=xq286S9gQKqzaYqtfQQOZbcGxO/kEZgAPbSL7gXYnH8UfYa/7cZ39edOTxa4Bv1+sx
         aIh0vHDHavtD6Vprp6AV80xsdzxtVQnW3iYe0UOaoXV5VsmuEIv9xKPISUg2pwYOcxMz
         rWHlnbfGzqhVt1hHfDH8fdq4+C0gzjryuEThyLY1vclHm4LMTkDav7AwTnaVjQ8Mkf0T
         BUd0nDMllju16QUmYolWhSRB3Gu68xowpJ29yMnPc1NyPZDQWJta8w3FZv/DfIFq1xoZ
         4E5nQtb57x447ZyQISwPMt96yNbssEN6hwrJc2wSuTwsKvgZ7QYN5Ffv3YhfbPB8brbf
         NcXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701733146; x=1702337946; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WMomagRnCIJv2avNYAvXPBqI8hAmxsSfPmdXva9w3ZU=;
        b=JB4nH+S5UmRjF7HMbLpFtGCOTMRyS9RS/WoE2RrbfNxbNxS21wlJalzGU8U+0fuzWt
         4DQpR3Pb0dvKTLYLLFRh0wp0QmssR1eSYMg7VYOq8FyMsroIUkqp+S7uZxl22M5Yuyh+
         Mi7auhMsKQ9C9QVACh7CmJwFBv2S8eYkXrg/iUy3U7DCeyxjI1J9kDcv+RvY2iKdIWFC
         acZ/8/PnX8sdb7cJmKC65vBmIGFbCF1pccY+0qj97johS+xHNwOmLjNG8leVzShOesxF
         YEzZcNtji6XSi1lKB8WZCRcpUbDMVKOlZOFSyq+szYCyy+vd7fSQsCtYfIrepEJ92hET
         jGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701733146; x=1702337946;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMomagRnCIJv2avNYAvXPBqI8hAmxsSfPmdXva9w3ZU=;
        b=YtaOqcNoCHIW1RFNL9opEeaRzyj6dCjxnQI8WYsITLIy9nkE01TEv0Rn11EuxNgbZi
         7VZt6VERIWqIi8VhOTO978tN6oanvsUYBLPP2ftDM9ow2aCCoVh+9aE3iZzN8XaJt2rf
         3WQ7tZcZZXqGq3n/ObHDQA8IrvIZInIRAyg6niP/VXtAxVOQNqU1Ww/CMTqE4c64cHJf
         InrWhKy7JHNnFamm4XAgLXHGj0kPk2MjxJt9MmhwpiElMV/rzaEPYhZj6SDTK3us077O
         EQEAzlBliUi0vEBqEtjKJ7a/xQffCJVRc/HmxsocfO4b3PdgNgn2pQTGDraGDjSLNGJC
         boSw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YwqXt6iK7N4WO2w4jg69Wxv/n4PIGl1492kl+UER5XFMGWYWoWX
	x1/9yKQ4RcMAFIzDdiP9AV8=
X-Google-Smtp-Source: AGHT+IFk906ARbAjj8ClEvbb/qnQLP8pSd/u21jQugHAMTFxYHRAdVZDHrqePlTIMAi+DHsJ9Kz7Pg==
X-Received: by 2002:a05:6871:284:b0:1fb:75a:6d3d with SMTP id i4-20020a056871028400b001fb075a6d3dmr5819386oae.100.1701733146732;
        Mon, 04 Dec 2023 15:39:06 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6870:454:b0:1f4:88df:8b64 with SMTP id
 i20-20020a056870045400b001f488df8b64ls7830431oak.1.-pod-prod-09-us; Mon, 04
 Dec 2023 15:39:05 -0800 (PST)
X-Received: by 2002:a05:6871:14f:b0:1fb:121c:c297 with SMTP id z15-20020a056871014f00b001fb121cc297mr3282454oab.2.1701733145070;
        Mon, 04 Dec 2023 15:39:05 -0800 (PST)
Date: Mon, 4 Dec 2023 15:39:04 -0800 (PST)
From: Kay Deleppo <kaydeleppo@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <1e767560-fb57-4fd9-b733-7aa3d0ce1691n@googlegroups.com>
Subject: Mr Configurator - Setup161e
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_238_1318386886.1701733144485"
X-Original-Sender: kaydeleppo@gmail.com
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

------=_Part_238_1318386886.1701733144485
Content-Type: multipart/alternative; 
	boundary="----=_Part_239_1903023815.1701733144485"

------=_Part_239_1903023815.1701733144485
Content-Type: text/plain; charset="UTF-8"

Mr Configurator - Setup161e

*Download* https://8gutrosimpbu.blogspot.com/?pj=2wIa2P


eebf2c3492

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1e767560-fb57-4fd9-b733-7aa3d0ce1691n%40googlegroups.com.

------=_Part_239_1903023815.1701733144485
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><h2>Mr Configurator - Setup161e</h2><br /><p><b>Download</b> https://8=
gutrosimpbu.blogspot.com/?pj=3D2wIa2P</p><br /><br /></div><div></div><div>=
 eebf2c3492</div><div></div><div></div><div></div><div></div><div></div><di=
v><p></p></div><div></div><div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/1e767560-fb57-4fd9-b733-7aa3d0ce1691n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/1e767560-fb57-4fd9-b733-7aa3d0ce1691n%40googlegroups.co=
m</a>.<br />

------=_Part_239_1903023815.1701733144485--

------=_Part_238_1318386886.1701733144485--
