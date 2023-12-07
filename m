Return-Path: <jailhouse-dev+bncBDMO7H4MUADRBM6FY6VQMGQE45L6ICA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oa1-x37.google.com (mail-oa1-x37.google.com [IPv6:2001:4860:4864:20::37])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA62808B9C
	for <lists+jailhouse-dev@lfdr.de>; Thu,  7 Dec 2023 16:20:21 +0100 (CET)
Received: by mail-oa1-x37.google.com with SMTP id 586e51a60fabf-1fb04956beesf3269294fac.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 07 Dec 2023 07:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1701962420; x=1702567220; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwSRexUkpw76J8Pji9KtwVDg9F/MMxegc9Mv2lB3tKs=;
        b=fhhgz1RjYJ4/6dhIieW44uAlkGH8Xv2q3u5oTMdpxfHS5CwLq/KVDuzlD5BcrPBwzT
         2yKe45qv6puSwr7vGY/La4HEaYCInesZSzjhCZkO1M65dKpgPbyyjwbs+m1dhrtE/ott
         7c5pKG7HNhCNTfdN9E90gfxXJX9xW85M2EJoQZhuP+TyeXLSgTcozhME9ueXCjFMXmNG
         g5MKA5PzFSYXx4aAePGZkknN2ZQwSbQ6sJ/kUluR/YAl/LTBfCWjEHQIbyMGvRykx7Ze
         5MmO543fwpw11yFWQJkaxRnhV77CaOF0gFug/BfHnFAv2CiuIJgSbzQ5jG7RqZlHCCxw
         hmeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701962420; x=1702567220; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gwSRexUkpw76J8Pji9KtwVDg9F/MMxegc9Mv2lB3tKs=;
        b=aryi0ed60H4jFiQfoGN12GXaRzvg4dH+5ns8rvhQTbSO9PNrAHcTliDCfAgBSAApuP
         e8UKoGYKYFY8qPBxppOe2H4CF68qipNEJCv0UP89XUHZ4SnfR6mgHu1XQe4dl25BQ9j/
         BiIUf0Cs9aSPcEx5yYnT+VyS7JO0+6S5WEygQa65Q6ZW8OUcPwZwpgVvuNzu6FaoT0Cr
         6Q0sRpKuyoUsmwN4utkRq1d9BncBCtMpEQGoz9TS8GNrGwTizcUObnxPVCjN2FzcIB9W
         EISdV9Zo0K0mgnwwa4uXa58eydm/fNiSrVrVcG5Gia0ofDqtdKg9w/9PjfAY4LfRrH9t
         g1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701962420; x=1702567220;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwSRexUkpw76J8Pji9KtwVDg9F/MMxegc9Mv2lB3tKs=;
        b=G5UjxZ8GhdHOafxIevKlS57bNZA4ofavzm1txAxDVs9y+/16KvOM/dnWZygO/rqnSx
         I9hpnA2jQDcAfmwhCg6nk1amkJJwabbdVbRpH4J0gcGk355oqtah9j6vkum17ssRkSqN
         eare/FogDRphzKn+j9Ln0yZ+5XFuRZLnk4UVPGQ3cTcWe6syTBiUhj2k5RWoWEgHUxJG
         vYgG7AknuSqYs6TOeiStzKdaypz5Mtma0kLnDBFxiIH7XUugrZ/NA5/sWfd5rj054oF2
         xpFxMlz6B52bKu2PdTogVjHtQjfs+SZfgVyLMcqifc2CsTwQSPK/eWAOlLAhV4U8KViO
         tMlQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YzXUwoNBv2JnH6yH526ZTmllTBRQv38Esw3GOMIKfg8fCQbIOqq
	9bS4SPKZM+xRIpGLoydhxLU=
X-Google-Smtp-Source: AGHT+IF3i/HEDxvqQMsO3Y2GFkk/mRBKBWbVk3pf6p70FDJ9ALpyyqgWq9ypiji/9hcV5De6gYzk5w==
X-Received: by 2002:a05:6870:8a28:b0:1fb:788:e8a5 with SMTP id p40-20020a0568708a2800b001fb0788e8a5mr2303823oaq.32.1701962420145;
        Thu, 07 Dec 2023 07:20:20 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6870:7b54:b0:1fb:1d02:1209 with SMTP id
 ji20-20020a0568707b5400b001fb1d021209ls863616oab.1.-pod-prod-04-us; Thu, 07
 Dec 2023 07:20:19 -0800 (PST)
X-Received: by 2002:a05:6870:d8ca:b0:1fa:fc3e:7891 with SMTP id of10-20020a056870d8ca00b001fafc3e7891mr3414328oac.0.1701962418763;
        Thu, 07 Dec 2023 07:20:18 -0800 (PST)
Date: Thu, 7 Dec 2023 07:20:18 -0800 (PST)
From: Lupe Elnicki <lupeelnicki@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <7f7c1afc-859b-41ac-8eb8-68eef6e72c95n@googlegroups.com>
Subject: LS-Magazine-Issue 01 My Childhood.rar
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_55787_1034222333.1701962418023"
X-Original-Sender: lupeelnicki@gmail.com
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

------=_Part_55787_1034222333.1701962418023
Content-Type: multipart/alternative; 
	boundary="----=_Part_55788_2077092335.1701962418023"

------=_Part_55788_2077092335.1701962418023
Content-Type: text/plain; charset="UTF-8"

LS-Magazine-Issue 01 My Childhood.rar\nDOWNLOAD 
https://urlin.us/2wIVEk\n\n\n\n eebf2c3492\n\n\n

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7f7c1afc-859b-41ac-8eb8-68eef6e72c95n%40googlegroups.com.

------=_Part_55788_2077092335.1701962418023
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>LS-Magazine-Issue 01 My Childhood.rar\nDOWNLOAD https://urlin.us/2wIVE=
k\n\n\n\n eebf2c3492\n\n\n</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/7f7c1afc-859b-41ac-8eb8-68eef6e72c95n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/7f7c1afc-859b-41ac-8eb8-68eef6e72c95n%40googlegroups.co=
m</a>.<br />

------=_Part_55788_2077092335.1701962418023--

------=_Part_55787_1034222333.1701962418023--
