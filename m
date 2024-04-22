Return-Path: <jailhouse-dev+bncBCDLVQP2RIKBBZXZTGYQMGQEKSF3GHQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103f.google.com (mail-pj1-x103f.google.com [IPv6:2607:f8b0:4864:20::103f])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5778AD033
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Apr 2024 17:06:17 +0200 (CEST)
Received: by mail-pj1-x103f.google.com with SMTP id 98e67ed59e1d1-2a5e1e7bab9sf6009152a91.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Apr 2024 08:06:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1713798375; cv=pass;
        d=google.com; s=arc-20160816;
        b=SsE0Hdg0wG04v2+aX3u49+hdlUvZ56y3dXZyK28yESuycfYY9//1WgV5km+YGFSgqa
         dP+dmk83zsYP258OndEQCEJj7h7vZ7fbQLi7hisRn4oByDerXPUFMhri+uUo/dBMejaI
         B65fD0Ns8I/qtqoAHSNlfet4j3Betq6Qh+DIizGeXo5vP/ons9fC45joNQdStE0NWWU6
         q8hAM1IJVvHXO8G4pMKrIFii04z7SVDkLf/qnSow/jB6txsIK495NSYwCzGKd1/TZR5V
         TFMCKRv+s8lTU42SyLaOYqlwli3S0pdyoSHtiM6uj4G86ipf/hBatBBvPz73W9h9V4HA
         2IAA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:to:feedback-id:list-unsubscribe:sid
         :reply-to:subject:message-id:mime-version:from:date:dkim-signature;
        bh=YqjVJLOo5k9PN2n1Yn9FxvgXBglXiBobDwAtwzHAil0=;
        fh=WNlAAE/x1uxwaq4Z0q2XvKNQYXGJulzN1lj5VRUNrN4=;
        b=YYA5+k8eY+TbwFttP7n7iRaoIs9CD0DbzIypjc23ozLKkWWJccDYBKPzHV8QwwHdQp
         vyEE98YQpflMaKM7bp6jJ4Z2b5Vs0YsXGV0Nh7ZRwXw/m+GC5P9pDpHVy8PqMPKR+PXF
         4G7MR+xiiiD3i0HUsFo/GbjHhJ2N2f/clgmuQACaIDFPgYN6go1GNcdTKLXO39/fUPN6
         /VX/+SzWlx0nnWze2XqXGdk4FKJbwGzlhIdyARJq5o1mTN9yJhSJ3OT35v66ykdgOCVF
         zZDlDKqEjB/qQpmq34GGIwaIlbx4gFCeoM+MhCqNxoLdJzxZ6vR6jfRaEU/2ZC22oiBk
         9VTA==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@mail.beehiiv.com header.s=s1 header.b=PfbYCBHA;
       spf=pass (google.com: domain of bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com designates 159.183.141.16 as permitted sender) smtp.mailfrom="bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=beehiiv.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1713798375; x=1714403175; darn=lfdr.de;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:feedback-id:list-unsubscribe:sid:reply-to
         :subject:message-id:mime-version:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqjVJLOo5k9PN2n1Yn9FxvgXBglXiBobDwAtwzHAil0=;
        b=W9+hGg0v+WgfNjX8/peJdft62NOAjLB6+3CXCLQGi7OFi0DiC71agqAM+Sa7xlBYYj
         mUef7umWhfWn0YYCc1Jx7w5TVTKYSFyENPpNSRnrNgjX9Fk+mNQSzjmNugIVh5GOfRwX
         hi0aMu4B7pvhAiEDZZ1717mqGZ/wJOCwdZZbLTDMvHfRXubuD5ENE/LnwAiBJ7iIF9a+
         6ypk9HslyGO37L6F5UksDem/3NMGd4mgPT8/Hns+akurOHYtJySwqwCCvkgm5kg/h5OX
         ldT6Us9zZwYK4QvKK9oG40aHVE2pLbNtfdXXfE01mCY7ftHcpNrqS1D6jaFxMkH1mY3m
         tnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713798375; x=1714403175;
        h=list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:to:feedback-id
         :list-unsubscribe:sid:reply-to:subject:message-id:mime-version:from
         :date:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqjVJLOo5k9PN2n1Yn9FxvgXBglXiBobDwAtwzHAil0=;
        b=freKYkxls6lINWQD9/6HplRpO0IurvOaGP8DXt1QRLuG0G1STk+sGOdD7RYkzTy8Xy
         1RQz0fBLeMwGb7KNTqkHs4FeluJgdwFjIVQbNGNVi3qEEdrJRg17WL8jMJ/PRmGB+mtx
         8sSHa5qGkD8Voreccnu+7XGlQsV1Z72HQi8TjKWsmwYlpDMQYeZJAW5Es9dLdOeFZJmo
         UlAAWYTyARGClcZki288dsC3KBr8sQcEpWRwBNRib5AE4ylORWR4a9uDTYhBcUpRImtI
         KuKZf8dHmiyb+ARtjK9LWbpxYV4aWzDxbr41zg9HAWH92lbwPMwgCdspIV3Dgh7nI7lI
         ys8A==
X-Forwarded-Encrypted: i=2; AJvYcCU5sNtxGfvSXOdyfi3e6W0r9D5b3ioR4T/E1QKLKaHIpfOx3ZzyuiEvIYRNGNwZg1YTIfPIOzoed9cfTgaObqs+t05BMHiHzGxCEWA=
X-Gm-Message-State: AOJu0YytsYzfn3XjzGSZeTWDHYXPGg34DawqARO5OarcNU6NnoRE6cQJ
	5bePToApxo3Gqd5uA2v+EazTMUUxoei6PsZkzsQTffxx085uJNhZ
X-Google-Smtp-Source: AGHT+IGrrdsGdm4nFxkmnxjzxFlPdB5RlTaU6jlMeRe7yp15gd5vuU6gwB/DOvjd/HRt3z7Ztye1LQ==
X-Received: by 2002:a17:90a:a592:b0:2a5:3ec5:cecd with SMTP id b18-20020a17090aa59200b002a53ec5cecdmr8778917pjq.12.1713798375174;
        Mon, 22 Apr 2024 08:06:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90b:4b0b:b0:2a6:cc80:9c6a with SMTP id
 98e67ed59e1d1-2ac482c33bcls43622a91.1.-pod-prod-06-us; Mon, 22 Apr 2024
 08:06:13 -0700 (PDT)
X-Received: by 2002:a17:90a:a085:b0:2a0:4495:1f3d with SMTP id r5-20020a17090aa08500b002a044951f3dmr11279860pjp.0.1713798373220;
        Mon, 22 Apr 2024 08:06:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713798373; cv=none;
        d=google.com; s=arc-20160816;
        b=A96J/7YrG8mh9ie4RquP/1H8TKvCsWIfqjsIIn+DX+3tVptCh0DOshVenlMt5rJMqP
         bwRQwbiY+1AKUYnPU5/QFfoS5u35pnGjItbT0dyB9CcvC5CGZtH+gbRhDpK5u2bM3kIy
         Ew8U0ncPyNa2OjS7EvqLqONC//BpQ3zVVsXRG4yPNJspNYGSExhycZNOHwRBOkGTCJxz
         b7KqkpRfaIQPtp9w2gdpxDiXScnI3w4J2hyi0Oa5T6KgtPMX9CgAnn+KZo++k+ug1Q8D
         wahginI2dQz6NV/mw8v4KaPW/HkIxMXjsgJQmy/U7IWB+MAm+5/JUV80/sreppuWZzw3
         Xmtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:feedback-id:list-unsubscribe:sid:reply-to:subject:message-id
         :mime-version:from:date:dkim-signature;
        bh=6mot4xOIare1sPNCOnfT/S8N9gapFKtV2Dlu60CTkCs=;
        fh=gxv6KPRH6O+Oq3mqvhuXuTetS01385E93D+NhmqUcp4=;
        b=W5ey6K8nh/mAiSJJnfAwhCr6rdDBxbxxK+qU81ojYBfblNRck3Jx+9ueX7Mh+SCDFj
         gHVpPpteRSHjG3vqAvZF/X5CoSshjDPg/yKGu/d18X5SerzT3I5MKFVvd/Tpd699x/mH
         pPPpLBleFKvSZtRCcyKdAbEn2ZqcWtMhNt2Ki5XYtm14CYD5XMHUKjwFchHxF0uZOUTT
         EzXvSXHBtLpfyG0xGIkiT1LNKqQlPKvuchFvNNj7Byr081KG0f2WdVf72RbkX4bsFmUZ
         bC5tyWp7d2PhKrqZzqhKuWfVbUpUrlqImleopKACnIk7aOV24WvChfbNV1n7RefG7JkY
         9z0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@mail.beehiiv.com header.s=s1 header.b=PfbYCBHA;
       spf=pass (google.com: domain of bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com designates 159.183.141.16 as permitted sender) smtp.mailfrom="bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=beehiiv.com
Received: from o11.ptr8898.mail.beehiiv.com (o11.ptr8898.mail.beehiiv.com. [159.183.141.16])
        by gmr-mx.google.com with ESMTPS id w24-20020a17090a8a1800b002ae70be297fsi58200pjn.1.2024.04.22.08.06.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 08:06:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com designates 159.183.141.16 as permitted sender) client-ip=159.183.141.16;
Received: by filterdrecv-6f69f98fd7-zcdw4 with SMTP id filterdrecv-6f69f98fd7-zcdw4-1-66267CBB-5E
        2024-04-22 15:05:31.211509051 +0000 UTC m=+839845.677336741
Received: from NDAzNDMyOTY (unknown)
	by geopod-ismtpd-13 (SG) with HTTP
	id EqOXcTjNRxiUVNUgwbyc1w
	Mon, 22 Apr 2024 15:05:30.999 +0000 (UTC)
Content-Type: multipart/alternative; boundary=1e7f5921563e81fe116f0acd0eaa30ea7f87231cb578f9fc2a26e95a895a
Date: Mon, 22 Apr 2024 15:06:12 +0000 (UTC)
From: "'SEED Conference' via Jailhouse" <jailhouse-dev@googlegroups.com>
Mime-Version: 1.0
Message-ID: <EqOXcTjNRxiUVNUgwbyc1w@geopod-ismtpd-13>
Subject: SEED Conference 2024
Reply-To: SEED Conference <seedconf@upv.es>
x-newsletter: https://seed-conference-valencia.beehiiv.com/p/seed-conference-220424
sId: 71fc7e6d-cd28-47c6-aa1e-5d673d88c28e
x-beehiiv-ids: =?us-ascii?Q?{=22account=5Fname=22=3A=22https=3A=2F=2Fseed-conference-valencia=2Ebeehiiv=2Ecom=2F?=
 =?us-ascii?Q?=22=2C=22campaign=5Fid=22=3A=2233df71dc-2b25-4227-a3e?=
 =?us-ascii?Q?3-5efa003d7225=22=2C=22category=22=3A=22newsletter=22?=
 =?us-ascii?Q?=2C=22email=5Fgenerated=5Fat=22=3A1713798330=2C=22user=5F?=
 =?us-ascii?Q?id=22=3A=2271fc7e6d-cd28-47c6-aa1e-5d673d88c2?=
 =?us-ascii?Q?8e=22}?=
x-newsletter-id: https://seed-conference-valencia.beehiiv.com/
x-list-id: 71fc7e6d-cd28-47c6-aa1e-5d673d88c28e
x-beehiiv-type: newsletter
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
Feedback-ID: =?us-ascii?Q?33df71dc-2b25-4227-a3e3-5efa003d7225=3Anewsletter=3A71fc7e6d-cd28-?=
 =?us-ascii?Q?47c6-aa1e-5d673d88c28e=3A73c7af638dd0cac?=
x-list-owner: <mailto:seedconf@upv.es>
x-newsletter-signup: https://seed-conference-valencia.beehiiv.com/subscribe
X-SG-EID: =?us-ascii?Q?u001=2EMt=2FpfclHn1+UMtV8LJLhNNy4mEHVvqc1hZQ2Olx3PhEx8x0AjXbaNLDVr?=
 =?us-ascii?Q?pzjLLk3hXXJDPZv5bNMhpkmvRjphJxDILoXEE4z?=
 =?us-ascii?Q?Yuf6F8Bgxpm+UusyXr3UAml8uMxLxMjn8L1Qj+w?=
 =?us-ascii?Q?4FvQPjOS6SSNlN=2Frd9lFQXG6ia+4a=2FXNyXlmvtz?=
 =?us-ascii?Q?Bm1dH57jBJBC+0=2FitOMIUc+=2FMDkAhyxEczfELLn?=
 =?us-ascii?Q?kFa1ePuP0IO4UXdiJg6mtGcuQrJVg1+WVgm3uFa?=
 =?us-ascii?Q?ocgoV7e78D0HyuAEAvp6covoP6Gb34=2FGgKLZL16?=
 =?us-ascii?Q?iMiyDbbA=3D?=
X-SG-ID: =?us-ascii?Q?u001=2ESdBcvi+Evd=2FbQef8eZF3BpTL9BgbK5wfSJMJGMsmprAVgeiC8iaV7rEmQ?=
 =?us-ascii?Q?+cYi2k7DVoTjSdxEg+WNZy7o8IqkW1DBNvnJBmD?=
 =?us-ascii?Q?hdmuxN6VKQ7TAKIREd0gYMMqeQLsgLEc+yGxxFP?=
 =?us-ascii?Q?h7IEth=2FHmjYXLPupBZ4nmR2b4tTii0OgE5AgE8Z?=
 =?us-ascii?Q?n8fazlmv5kasb5t1oTL95cf40edL5JnFhhenMRy?=
 =?us-ascii?Q?MgOV7w5F0=2FCGXzkHBPGP0w=2FE4DNp6PGS0sFMeXp?=
 =?us-ascii?Q?yo=2FXsgZ2D=2FanjHVKK=2F2bukZoPw=3D=3D?=
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
X-Entity-ID: u001.GINWaumzpjWck0y5/PF8TQ==
X-Original-Sender: seed-conference-valencia@mail.beehiiv.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@mail.beehiiv.com header.s=s1 header.b=PfbYCBHA;       spf=pass
 (google.com: domain of bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com
 designates 159.183.141.16 as permitted sender) smtp.mailfrom="bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=beehiiv.com
X-Original-From: SEED Conference <seed-conference-valencia@mail.beehiiv.com>
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>

--1e7f5921563e81fe116f0acd0eaa30ea7f87231cb578f9fc2a26e95a895a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0

View image: (https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,forma=
t=3Dauto,onerror=3Dredirect,quality=3D80/uploads/asset/file/dcbc0422-e91e-4=
be2-9044-0744bbc94e07/6543f3704bcc1407f3339baf.png?t=3D1702884418)
Follow image link: (https://www.seedconference.eu/)
Caption:=20

### **Join SEED 2024 ****& participate in 18 workshops**!=20

### Early registration until April 26th

### Do not miss the opportunity to get your paper published in **WS05 GAME-=
SME**=20

Learn more (https://sites.google.com/uniroma1.it/legs/workshop-game-sme)

View image: (https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,forma=
t=3Dauto,onerror=3Dredirect,quality=3D80/uploads/asset/file/f762a9ae-0c08-4=
59b-8512-c7a20132db56/hero-ws2.jpg?t=3D1713528165)
Follow image link: (https://www.seedconference.eu/registration/)
Caption:=20

----------
# In this newsletter:


--------------------
Click on the Workshop below to read more:


--------------------
**[WS01](#ws1)****    |    ****[WS02](#ws2)****    |    ****[WS03](#ws3)***=
*    |    ****[WS04](#ws4)****    |    ****[WS05](#ws5)****    |    ****[WS=
06](#ws6)**
**[WS07](#ws7)****    |    ****[WS08](#ws8)****    |    ****[WS09](#ws9)***=
*    |    ****[WS10](#ws10)****    |    ****[WS11](#ws11)****   |    ****[W=
S12](#ws12)**
**[WS13](#ws13)****    |    ****[WS14](#ws14)****    |    ****[WS15](#ws15)=
****   |    ****[WS16](#ws16)****    |    ****[WS17](#ws17)****    |    ***=
*[WS18](#ws18)**


--------------------
# WS01. Enabling the flow of knowledge for the Energy and Hydrogen Transiti=
on

In this workshop, we will share our good practices from The Netherlands, of=
 which the proven method of Learning Communities. We will illustrate how re=
search, education, and practical implementation of innovations can reinforc=
e each other and better tackling societal challenges like the energy transi=
tion. Next, we would like to discuss the possibilities of an international =
network in which we can share learnings of proven and new concepts.

Read more (https://www.seedconference.eu/ws1)


--------------------
# WS02. Sustainable Energy Education: Delivering the energy workforce of th=
e future

This workshop aims to address the evolving landscape of the energy sector a=
nd the educational needs to deliver a skilled work force that is ready to d=
eliver clean energy access that is technologically sound, economically feas=
ible, and locally appropriate. Through a panel discussion and interactive s=
ession, this workshop will explore the role of energy education in cultivat=
ing a workforce that is capable of addressing the multiple, complex challen=
ges faced within the sector.

Read more (https://www.seedconference.eu/ws2)


--------------------
# WS03. ESExNBS@NEB - Exploring Sustainable Education implementing the Natu=
re-Based Solution in the New European Bauhaus perspective

New European Bauhaus (NEB) initiative aligns with the EU's goal of carbon n=
eutrality by 2050, integrating aesthetics and sustainability inspired by hi=
storic Bauhaus movement. This workshop explores the key concepts of NEB =E2=
=80=93 sustainability, inclusiveness, aesthetics and social engagement =E2=
=80=93 =E2=80=8B=E2=80=8Bidentifying crucial skills for upskilling the work=
force in nature-based solutions (NBS) for urban regeneration. The workshop,=
 using the World Caf=C3=A9 method, aims to devise effective teaching techni=
ques, discovering skills essential to NEB's values =E2=80=8B=E2=80=8Band ad=
dressing environmental challenges. It brings together educators, profession=
als and organizations for cross-sector collaboration, emphasizing community=
 involvement and raising awareness about the potential of NBS in the NEB pe=
rspective.

Read more (https://www.seedconference.eu/ws3)


--------------------
# WS04. MINDS =E2=80=93 Meaningful Immersive Narratives Driving Sustainabil=
ity

The MINDS project aims to change young people's attitudes towards sustainab=
ility using Virtual Reality (VR) for immersive storytelling, marking a sign=
ificant shift in sustainability education. By making these complex issues m=
ore relatable and engaging, VR can help foster a deeper understanding and u=
rgency for environmental matters. This workshop shares experiences from the=
 project's pilot, focusing on narrative techniques in sustainability educat=
ion, addressing educational challenges, and enhancing skills in creating co=
mpelling environmental narratives. To ensure that the project=E2=80=99s out=
comes are tailored to the needs and expectations of educators, we invite yo=
u to share your thoughts and challenges in sustainability education.=20

Read more (https://www.seedconference.eu/ws4)


--------------------
# WS05. Game-based Learning for Sustainability in Management Education (GAM=
E-SME)

This workshop aims to provide an interactive platform for participants to s=
hare and discuss research findings, pedagogical strategies, and practical e=
xperiences in utilizing business games as tools for teaching sustainability=
 principles in management courses. The primary objective is to explore the =
intersection of two dynamic streams of research and educational trends: the=
 utilization of learning/experimental games and the incorporation of sustai=
nability themes in management education.=20

Read more (https://www.seedconference.eu/ws5)


--------------------
# WS06. Empowering Through Education: T-Shore's Approach to Wind Turbine Te=
chnician Training  (T-shoreEdu)

Welcome to "Empowering Through Education: T-Shore's Approach to Wind Turbin=
e Technician Training," a workshop designed for educators, trainers, and pr=
ofessionals committed to the advancement of sustainable energy education. A=
t the heart of our mission is the harmonisation of training programs across=
 Europe, aiming to establish a standardised yet flexible curriculum that me=
ets the diverse needs of offshore wind technicians. This ambition confronts=
 the intricate challenge of aligning educational practices across five coun=
tries, each with its unique education system and course programming methodo=
logies.

Read more (https://www.seedconference.eu/ws6)


--------------------
# WS07. Build your own LEAF: Learning Ecosystem Taking Action for the Futur=
e

The urgent sustainability challenges that students are expected to solve or=
 cope with in the future require holistic interventions. We developed learn=
ing communities as part of a wider ecosystem to offer our students the oppo=
rtunity to collaborate, learn and innovate on equal footing with all sorts =
of knowledge partners. Involvement from applied sciences and vocational edu=
cation students, as well as private sector, government, and citizens ensure=
s that they experience the complexity of the real world. Our workshop consi=
sts of a simulation game that walks participants through the process of set=
ting up a learning ecosystem on climate action education.

Read more (https://www.seedconference.eu/ws7)


--------------------
# WS08. Sustainable Business Models in practice: a business game competitio=
n (BG-COMP)

The workshop immerses participants in a virtual clothing company, challengi=
ng them to reevaluate traditional business models and achieve a sustainable=
 balance between economic viability, environmental stewardship, and social =
responsibility. Through dynamic business game simulations, participants gai=
n practical experience, navigating real-world challenges and refining their=
 decision making acumen. The workshop aims to foster an understanding of su=
stainable business principles and their practical application in the fashio=
n industry. Participants are encouraged to integrate the triple bottom line=
 framework into their decision-making processes.=20

Read more (https://www.seedconference.eu/ws8)


--------------------
# WS09. PROPOSAL OF A TRAINING WORKSHOP FOR THE SEED CONFERENCE

Europe and Africa have to jointly promote a hydrogen transition to boost su=
stainable economic development and a decarbonization of their economic sect=
or. African green hydrogen transition could boost local economies developme=
nt, that=E2=80=99s why it=E2=80=99s important that both EU and AU hydrogen =
policies and development roadmaps have to be conceived in a cross-fertilizi=
ng way.

Read more (https://www.seedconference.eu/ws9)


--------------------
# WS10. Unveiling Training and Skill Requirements for Driving the Adoption =
of Emerging Technologies in the Renewable Energy field. - RE-SKILLS Worksho=
p

The RE-SKILLS workshop aims to address the demand for skilled professionals=
 capable of implementing cutting-edge technological proposals in the dynami=
c landscape of the energy sector. With a focus on novel technological conce=
pts, the event will bring together industry experts, academia, and professi=
onals to identify essential skills and capabilities required for successful=
 integration.

Read more (https://www.seedconference.eu/ws10)


--------------------
# WS11. Attract and train European technicians in Energy Transition

In Europe, the shift towards sustainable energy faces a chagenge: a shortag=
e of skilled technicians. Studies show a need for maintenance and operation=
al experts, with around 1.5 million individuals requiring training yearly. =
For this reasson, a workshop, building upon the Erasmus+ GreenTech project =
(2022-2024) focusing on renewable energy training, seeks to exchange insigh=
ts and best practices.

Core discussions revolve around improving training attractivity understandi=
ng industry demands, evaluating current and future training schemes, and sp=
reading practical courses. The workshop aims to promote collaboration on re=
gional, national, and international levels to tackle Europe's technician de=
ficit and achieve carbon neutrality and energy transition.

Read more (https://www.seedconference.eu/ws11)


--------------------
# WS12. Transforming Sustainable Energy Education (TranSEED)

In this workshop we invite you to experience a technology demonstration and=
 subsequently help us to transform traditional mono-disciplinary technology=
 education into transdisciplinary and multilevel challenge-based education.=
 You will gain insights in two interesting technology applications and will=
 have the opportunity to enrich your and our perspectives on transdisciplin=
ary, multilevel and challenge-based education.

Read more (https://www.seedconference.eu/ws12)


--------------------
# WS13. Applied and Innovative Research within VET Education for the Energy=
 transition

Research learning to enhance innovation in cooperation with SME, industries=
 and vocation training facilitators is a crucial way for the sustainable an=
d digital transformation in all areas of the society. One of the outcomes o=
f the AIRinVET Project ([https://airnvet.eu](https://airinvet.eu/)) is a ma=
pping of applied research activities in vocational education and Training. =
The workshop will show and discuss approaches as well as results of the AIR=
inVET Project and give best practice from Germany and The Netherlands on ho=
w to design cooperative curricula and research learning programs with the p=
rivate sector for a successful implementation of sustainable energy educati=
on.

Read more (https://www.seedconference.eu/ws13)


--------------------
# WS14. H2 VIRTUAL TRAINING

H2 VIRTUAL TRAINING is a digital training program developed at the Universi=
ty of Toulouse which addresses safety issues during maintenance operations =
on hydrogen vehicles

Read more (https://www.seedconference.eu/ws14)


--------------------
# WS15. Facilitating upliftings in solar energy storage (FUSES)

The workshop is designed to be dynamic and interactive, offering participan=
ts a comprehensive learning experience in the field of solar energy storage=
. The session commences with an introductory overview of Ampere Energy prod=
ucts, which optimize the solar self-consumption and maximize savings on the=
 electricity bill.

Next, there is a specific focus on the algorithmics of the Smart Energy Man=
agement System to transition into a presentation of real-world successful s=
olar self-consumption case studies. Installations that incorporate PV panel=
s and smart batteries are presented in residential, industrial, and energy =
communities locations that have achieved remarkable economic, ecological an=
d grid energy savings.

Read more (https://www.seedconference.eu/ws15)


--------------------
# WS16. Challenges of International Master Degree Courses in Renewable Ener=
gy Systems

Many universities worldwide offer Master degree courses in renewable energy=
 systems. As English has become the generally accepted language in a global=
ized world, courses being taught in English are attended by students coming=
 from all over the world. Although we live in a globalized world and the in=
ternational Master degree is a product representing it, not necessarily the=
re are valid global energy solutions. The aim of the proposed workshop is t=
o shed light on the technical challenges of these Master courses and find s=
olutions which suit teachers and students alike.

Read more (https://www.seedconference.eu/ws16)


--------------------
# WS17. Explore integration of sustainability in education from a reflexive=
, SDG and entrepreneurship perspective

In this inspirational workshop you will explore three approaches to integra=
te sustainability in education from three perspectives: reflexive, SDGs in =
education and the relevance of entrepreneurial skills. You will review the =
three approaches and find out how you can apply the three different perspec=
tives to your own education or in your institute.

Read more (https://www.seedconference.eu/ws17)


--------------------
# WS18. Accelerate matchmaking in a network: what can we learn from trees a=
nd computers?

Experience the strength of networks in solving needs and demands on multipl=
e themes outside and inside the main theme of cooperation.

* Build on your skills to be effective in cooperation with colleagues and p=
eer professionals.

* Experience how to be effective in expressing your needs, talents and prop=
ositions inspired by examples in nature and IT technology.

* Experience how to evaluate value propositions on their effective communic=
ation approaches.

* Experience the power of connections on a personal level within the profes=
sional arena.

Read more (https://www.seedconference.eu/ws18)


----------


=E2=80=94=E2=80=94=E2=80=94

You are reading a plain text version of this post. For the best experience,=
 copy and paste this link in your browser to view the post online:
https://seed-conference-valencia.beehiiv.com/p/seed-conference-220424

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/EqOXcTjNRxiUVNUgwbyc1w%40geopod-ismtpd-13.

--1e7f5921563e81fe116f0acd0eaa30ea7f87231cb578f9fc2a26e95a895a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="UTF-8"
Mime-Version: 1.0

<!DOCTYPE html><html lang=3D"en" xmlns=3D"http://www.w3.org/1999/xhtml" xml=
ns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-microsoft-com=
:office:office" style=3D"font-size:16px;"><head><meta charset=3D"utf-8"/><!=
--[if !mso]><!--><meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge"=
/><!--<![endif]--><meta name=3D"viewport" content=3D"width=3Ddevice-width,i=
nitial-scale=3D1"/><meta name=3D"x-apple-disable-message-reformatting"/><me=
ta name=3D"format-detection" content=3D"telephone=3Dno,address=3Dno,email=
=3Dno,date=3Dno,url=3Dno"/><meta name=3D"color-scheme" content=3D"light"/><=
meta name=3D"supported-color-schemes" content=3D"light"/><title>SEED Confer=
ence 2024</title><!--[if mso]><xml><o:OfficeDocumentSettings><o:AllowPNG/><=
o:PixelsPerInch>96</o:PixelsPerInch></o:OfficeDocumentSettings></xml><![end=
if]--><style>
  :root { color-scheme: light; supported-color-schemes: light; }
  body { margin: 0; padding: 0; min-width: 100%!important; -ms-text-size-ad=
just: 100% !important; -webkit-transform: scale(1) !important; -webkit-text=
-size-adjust: 100% !important; -webkit-font-smoothing: antialiased !importa=
nt; }
  .body { word-wrap: normal; word-spacing:normal; }
  table.mso { width: 100%; border-collapse: collapse; padding: 0; table-lay=
out: fixed; }
  img { border: 0; outline: none; }
  table {  mso-table-lspace: 0px; mso-table-rspace: 0px; }
  td, a, span {  mso-line-height-rule: exactly; }
  #root [x-apple-data-detectors=3Dtrue],
  a[x-apple-data-detectors=3Dtrue],
  #MessageViewBody a { color: inherit !important; text-decoration: inherit =
!important; font-size: inherit !important; font-family: inherit !important;=
 font-weight: inherit !important; line-height: inherit !important; }
  span.MsoHyperlink { color: inherit !important; mso-style-priority: 99 !im=
portant; }
  span.MsoHyperlinkFollowed { color: inherit !important; mso-style-priority=
: 99 !important; }
  .a { background-color:#f5f5f5; }
  .b { background-color:#438ac9; }
  .c  { background-color:#ffffff; }
  .d { background-color:#FFFCDD; }
  .d2 { background-color:#FFFFFF; }
  .d3 { background-color:#FFFFFF; }
  h1 { color:#e8195a; }
  h2 { color:#438ac9; }
  h3 { color:#2A2A2A; }
  h4 { color:#2A2A2A; }
  h5 { color:#2A2A2A; }
  h6 { color:#2A2A2A; }
  h1 a { text-decoration:underline;color:#e8195a !important; }
  h2 a { text-decoration:underline;color:#438ac9 !important; }
  h3 a { text-decoration:underline;color:#2A2A2A !important; }
  h4 a { text-decoration:underline;color:#2A2A2A !important; }
  h5 a { text-decoration:underline;color:#2A2A2A !important; }
  h6 a { text-decoration:underline;color:#2A2A2A !important; }
  h1, h1 a, h2, h2 a, h3, h3 a, h4, h4 a, h5, h5 a, h6, h6 a, ul, li, ol, p=
, p a { margin: 0;padding: 0; }
  h1 { font-family:'Arial',Helvetica,sans-serif;font-weight:Bold;font-size:=
36px;line-height:43px;padding-bottom:4px;padding-top:16px;mso-margin-top-al=
t:16px;mso-margin-bottom-alt:4px }
  h2 { font-family:'Arial',Helvetica,sans-serif;font-weight:Bold;font-size:=
24px;line-height:36px;padding-bottom:4px;padding-top:16px;mso-margin-top-al=
t:16px;mso-margin-bottom-alt:4px }
  h3 { font-family:'Arial',Helvetica,sans-serif;font-weight:Bold;font-size:=
20px;line-height:30px;padding-bottom:4px;padding-top:16px;mso-margin-top-al=
t:16px;mso-margin-bottom-alt:4px }
  h4 { font-family:'Trebuchet MS','Lucida Grande',Tahoma,sans-serif;font-we=
ight:Bold;font-size:18px;line-height:27px;padding-bottom:4px;padding-top:16=
px;mso-margin-top-alt:16px;mso-margin-bottom-alt:4px }
  h5 { font-family:'Trebuchet MS','Lucida Grande',Tahoma,sans-serif;font-we=
ight:normal;font-size:16px;line-height:24px;padding-bottom:4px;padding-top:=
16px;mso-margin-top-alt:16px;mso-margin-bottom-alt:4px }
  h6 { font-family:'Trebuchet MS','Lucida Grande',Tahoma,sans-serif;font-we=
ight:normal;font-size:14px;line-height:21px;padding-bottom:4px;padding-top:=
16px;mso-margin-top-alt:16px;mso-margin-bottom-alt:4px }
  p { font-family:'Helvetica',Arial,sans-serif;color:#2D2D2D;font-size:16px=
;line-height:24px;padding-bottom:12px;padding-top:12px;mso-margin-top-alt:1=
2px;mso-margin-bottom-alt:12px; }
  p a, .e a, ul a, li a  { word-break:break-word;color:#e8195a !important;t=
ext-decoration:underline;text-decoration-color:#e8195a;font-style:italic; }
  p a span, .e a span, ul a span, li a span { color: inherit }
  p .bold { font-weight:bold;color:#2D2D2D; }
  p span[style*=3D"font-size"] { line-height: 1.6; }
  .f p { font-size:12px;line-height:15px;color:#2D2D2D;padding:0; }
  .f p a { text-decoration:underline;color:#2D2D2D !important; }
  .g p { font-family:'Helvetica',Arial,sans-serif;font-size:14px;line-heigh=
t:20px;font-weight:normal;margin:0; }
  .g p a  { text-decoration: underline; }
  .i p { font-family:'Helvetica',Arial,sans-serif;line-height:23px;font-siz=
e:15px;color:#2D2D2D; }
  .i p a { text-decoration:underline;color:#2D2D2D !important; }
  .i2 p { font-family:'Helvetica',Arial,sans-serif;line-height:23px;font-si=
ze:15px;color:#2D2D2D; }
  .i2 p a { text-decoration:underline;color:#2D2D2D !important; }
  .i3 p { font-family:'Helvetica',Arial,sans-serif;line-height:43px;font-si=
ze:24px;color:#2D2D2D; }
  .i3 p a { text-decoration:underline;color:#2D2D2D !important; }
  .h p a { text-decoration:underline;color:#595959 !important; }
  .h2 p a { text-decoration:underline;color:#595959 !important; }
  .h3 p a { text-decoration:underline;color:#595959 !important; }
  .j { border-top:3px solid #DFD150; }
  .k p { padding-left:15px;padding-bottom:0px;padding-top:6px;mso-margin-to=
p-alt:6px;mso-margin-bottom-alt:0px;mso-margin-left-alt:15px; }
  .o { background-color:#FFFFFF;border:1px solid #F1F1F1;border-radius:5px;=
 }
  .o p { font-family:'Helvetica',Arial,sans-serif;padding:0px;margin:0px; }
  .l p,
  .l p a { font-size:14px;line-height:20px;font-weight: bold;color:#2D2D2D;=
padding-bottom:6px;mso-margin-bottom-alt:6px;text-decoration:none; }
  .m p,
  .m p a { font-size:13px;line-height:18px;font-weight:400;color:#2D2D2D;pa=
dding-bottom:6px;mso-margin-bottom-alt:6px;text-decoration:none; }
  .n p,
  .n p a { font-size:12px;line-height:17px;font-weight:400;color:#2D2D2D;pa=
dding-bottom:6px;mso-margin-bottom-alt:6px;text-decoration:none; }
  .p { background-color:#FFFFFF;max-width:520px;border:1px solid #E1E8ED;bo=
rder:1px solid rgba(80, 80, 80, 0.3);border-radius:5px; }
  .q { font-size:16px;font-family:Helvetica,Roboto,Calibri,sans-serif !impo=
rtant;border:1px solid #e1e8ed;border:1px solid rgba(80, 80, 80, 0.3);borde=
r-radius:5px;background-color:#FFFFFF; }
  .q p { font-size:16px;font-family:Helvetica,Roboto,Calibri,sans-serif !im=
portant;color:#222222; }
  .r { border:1px solid #E1E8ED !important;border-radius:5px; }
  .s p { font-size: 14px; line-height: 17px; font-weight: 400; color: #6978=
82; text-decoration: none; }
  .t p { font-family:'Helvetica',Arial,sans-serif;font-size:12px;line-heigh=
t:18px;font-weight:400;color:#000000;font-style:italic;padding:4px 0px 0px;=
}
  .v { border-radius:10px;border:solid 0px #438ac9;background-color:#bee0ff=
;font-family:'Arial',Helvetica,sans-serif;color:#155d9e; }
  .v a { text-decoration:none;display:block;color:#155d9e; }
  .w p { font-size:12px;line-height:15px;font-weight:400;color:#FFFFFF; }
  .w p a { text-decoration: underline !important;color:#FFFFFF !important; =
}
  ul { font-family:'Helvetica',Arial,sans-serif;margin:0px 0px 0px 25px !im=
portant;padding:0px !important;color:#2D2D2D;line-height:24px;list-style:di=
sc;font-size:16px; }
  ul li { font-family:'Helvetica',Arial,sans-serif;margin:10px 0px 0px 0px =
!important;padding: 0px 0px 0px 0px !important; color: #2D2D2D; list-style:=
disc; }
  ol { font-family:'Helvetica',Arial,sans-serif;margin: 0px 0px 0px 25px !i=
mportant;padding:0px !important;color:#2D2D2D;line-height:24px;list-style:d=
ecimal;font-size:16px; }
  ol li { font-family:'Helvetica',Arial,sans-serif;margin:10px 0px 0px 0px =
!important;padding: 0px 0px 0px 0px !important; color: #2D2D2D; list-style:=
decimal; }
  .e h3,
  .e p,
  .e span { padding-bottom:0px;padding-top:0px;mso-margin-top-alt:0px;mso-m=
argin-bottom-alt:0px; }
  .e span,
  .e li { font-family:'Helvetica',Arial,sans-serif;font-size:16px;color:#2D=
2D2D;line-height:24px; }
  .rec { font-family:  ui-sans-serif, system-ui, -apple-system, BlinkMacSys=
temFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-ser=
if, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color E=
moji" !important; }
  .rec__button:hover { background-color: #f9fafb !important; }
  .copyright a {color: inherit !important; text-decoration: none !important=
; font-size: inherit !important; font-family: inherit !important; font-weig=
ht: inherit !important; line-height: inherit !important;}
  .txt_social p { padding: 0; }
  .table, .table-c, .table-h { border: 1px solid #C0C0C0; }
  .table-c { padding:5px; background-color:#FFFFFF; }
  .table-c p { color: #2D2D2D; font-family:'Helvetica',Arial,sans-serif !im=
portant;overflow-wrap: break-word; }
  .table-h { padding:5px; background-color:#F1F1F1; }
  .table-h p { color: #2A2A2A; font-family:'Trebuchet MS','Lucida Grande',T=
ahoma,sans-serif !important;overflow-wrap: break-word; }
  @media only screen and (max-width:667px) {
    .aa { width: 100% !important; }
    .bb img { width: 100% !important; height: auto !important; max-width: n=
one !important; }
    .cc { padding: 0px 8px !important; }
    .ee { padding-top:10px !important;padding-bottom:10px !important; }
    .ff ul, .ff ol { margin: 0px 0px 0px 10px !important;padding: 0px !impo=
rtant; }
    .ff li { margin:10px 0px 0px 10px !important; }
    .r {height:140px !important;}
    .s p { font-size:13px !important;line-height:15px !important; }
    .mob-hide {display:none !important;}
    .mob-stack {display:block !important;width:100% !important;}
    .mob-w-full {width:100% !important;}
    .mob-block {display:block !important;}
    .embed-img {padding:0px 0px 12px 0px !important;}
    .socialShare {padding-top:15px !important;}
    .rec { padding-left:15px!important;padding-right:15px!important; }
    .bodyWrapper { padding:10px 4px 10px 4px !important; }
  }
  @media screen and (max-width: 480px) {
    u + .a .gg { width: 100% !important; width: 100vw !important; }
    .tok-heart { padding-top:75% !important; }
    .tok-play { padding-top: 250px !important; }
  }
  @media screen and (max-width: 320px) {
    .tok-heart { padding-top:65% !important; }
  }
  .u { border: 1px solid #CACACA !important; border-radius: 2px !important;=
 background-color: #ffffff !important; padding: 0px 13px 0px 13px !importan=
t; font-family:ui-sans-serif,system-ui,-apple-system,BlinkMacSystemFont,"Se=
goe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans",sans-serif !important;fon=
t-size: 12px !important; color: #767676 !important; }
  .u a { text-decoration: none; display: block !important; color: #767676 !=
important; margin: 0px !important; }
  .u span, .u img { color: #767676 !important;margin:0px !important; max-he=
ight:32px !important;background-color:#ffffff !important; }
</style><!--[if mso]><style type=3D"text/css">
    sup { font-size: 100% !important;vertical-align: .5em !important;mso-te=
xt-raise: -1.5% !important;line-height: 0 !important; }
    ul { margin-left:0px !important; margin-right:10px !important; margin-t=
op:20px !important; margin-bottom:20px !important; }
    ul li { margin-left: 0px !important; mso-special-format: decimal; }
    ol { margin-left:0px !important; margin-right:10px !important; margin-t=
op:20px !important; margin-bottom:20px !important; }
    ol li { margin-left: 0px !important; mso-special-format: decimal; }
    li.listItem { margin-left:15px !important; margin-top:0px !important; }
    .paddingDesktop { padding: 10px 0 !important; }
    .edm_outlooklist { margin-left: -20px !important; }
    .embedImage { display:none !important; }
  </style><![endif]--></head><head><meta charset=3D"utf-8"/><!--[if !mso]><=
!--><meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge"/><!--<![endi=
f]--><meta name=3D"viewport" content=3D"width=3Ddevice-width,initial-scale=
=3D1"/><meta name=3D"x-apple-disable-message-reformatting"/><meta name=3D"f=
ormat-detection" content=3D"telephone=3Dno,address=3Dno,email=3Dno,date=3Dn=
o,url=3Dno"/><meta name=3D"color-scheme" content=3D"light"/><meta name=3D"s=
upported-color-schemes" content=3D"light"/><title>SEED Conference 2024</tit=
le><!--[if mso]><xml><o:OfficeDocumentSettings><o:AllowPNG/><o:PixelsPerInc=
h>96</o:PixelsPerInch></o:OfficeDocumentSettings></xml><![endif]--><style>
  :root { color-scheme: light; supported-color-schemes: light; }
  body { margin: 0; padding: 0; min-width: 100%!important; -ms-text-size-ad=
just: 100% !important; -webkit-transform: scale(1) !important; -webkit-text=
-size-adjust: 100% !important; -webkit-font-smoothing: antialiased !importa=
nt; }
  .body { word-wrap: normal; word-spacing:normal; }
  table.mso { width: 100%; border-collapse: collapse; padding: 0; table-lay=
out: fixed; }
  img { border: 0; outline: none; }
  table {  mso-table-lspace: 0px; mso-table-rspace: 0px; }
  td, a, span {  mso-line-height-rule: exactly; }
  #root [x-apple-data-detectors=3Dtrue],
  a[x-apple-data-detectors=3Dtrue],
  #MessageViewBody a { color: inherit !important; text-decoration: inherit =
!important; font-size: inherit !important; font-family: inherit !important;=
 font-weight: inherit !important; line-height: inherit !important; }
  span.MsoHyperlink { color: inherit !important; mso-style-priority: 99 !im=
portant; }
  span.MsoHyperlinkFollowed { color: inherit !important; mso-style-priority=
: 99 !important; }
  .a { background-color:#f5f5f5; }
  .b { background-color:#438ac9; }
  .c  { background-color:#ffffff; }
  .d { background-color:#FFFCDD; }
  .d2 { background-color:#FFFFFF; }
  .d3 { background-color:#FFFFFF; }
  h1 { color:#e8195a; }
  h2 { color:#438ac9; }
  h3 { color:#2A2A2A; }
  h4 { color:#2A2A2A; }
  h5 { color:#2A2A2A; }
  h6 { color:#2A2A2A; }
  h1 a { text-decoration:underline;color:#e8195a !important; }
  h2 a { text-decoration:underline;color:#438ac9 !important; }
  h3 a { text-decoration:underline;color:#2A2A2A !important; }
  h4 a { text-decoration:underline;color:#2A2A2A !important; }
  h5 a { text-decoration:underline;color:#2A2A2A !important; }
  h6 a { text-decoration:underline;color:#2A2A2A !important; }
  h1, h1 a, h2, h2 a, h3, h3 a, h4, h4 a, h5, h5 a, h6, h6 a, ul, li, ol, p=
, p a { margin: 0;padding: 0; }
  h1 { font-family:'Arial',Helvetica,sans-serif;font-weight:Bold;font-size:=
36px;line-height:43px;padding-bottom:4px;padding-top:16px;mso-margin-top-al=
t:16px;mso-margin-bottom-alt:4px }
  h2 { font-family:'Arial',Helvetica,sans-serif;font-weight:Bold;font-size:=
24px;line-height:36px;padding-bottom:4px;padding-top:16px;mso-margin-top-al=
t:16px;mso-margin-bottom-alt:4px }
  h3 { font-family:'Arial',Helvetica,sans-serif;font-weight:Bold;font-size:=
20px;line-height:30px;padding-bottom:4px;padding-top:16px;mso-margin-top-al=
t:16px;mso-margin-bottom-alt:4px }
  h4 { font-family:'Trebuchet MS','Lucida Grande',Tahoma,sans-serif;font-we=
ight:Bold;font-size:18px;line-height:27px;padding-bottom:4px;padding-top:16=
px;mso-margin-top-alt:16px;mso-margin-bottom-alt:4px }
  h5 { font-family:'Trebuchet MS','Lucida Grande',Tahoma,sans-serif;font-we=
ight:normal;font-size:16px;line-height:24px;padding-bottom:4px;padding-top:=
16px;mso-margin-top-alt:16px;mso-margin-bottom-alt:4px }
  h6 { font-family:'Trebuchet MS','Lucida Grande',Tahoma,sans-serif;font-we=
ight:normal;font-size:14px;line-height:21px;padding-bottom:4px;padding-top:=
16px;mso-margin-top-alt:16px;mso-margin-bottom-alt:4px }
  p { font-family:'Helvetica',Arial,sans-serif;color:#2D2D2D;font-size:16px=
;line-height:24px;padding-bottom:12px;padding-top:12px;mso-margin-top-alt:1=
2px;mso-margin-bottom-alt:12px; }
  p a, .e a, ul a, li a  { word-break:break-word;color:#e8195a !important;t=
ext-decoration:underline;text-decoration-color:#e8195a;font-style:italic; }
  p a span, .e a span, ul a span, li a span { color: inherit }
  p .bold { font-weight:bold;color:#2D2D2D; }
  p span[style*=3D"font-size"] { line-height: 1.6; }
  .f p { font-size:12px;line-height:15px;color:#2D2D2D;padding:0; }
  .f p a { text-decoration:underline;color:#2D2D2D !important; }
  .g p { font-family:'Helvetica',Arial,sans-serif;font-size:14px;line-heigh=
t:20px;font-weight:normal;margin:0; }
  .g p a  { text-decoration: underline; }
  .i p { font-family:'Helvetica',Arial,sans-serif;line-height:23px;font-siz=
e:15px;color:#2D2D2D; }
  .i p a { text-decoration:underline;color:#2D2D2D !important; }
  .i2 p { font-family:'Helvetica',Arial,sans-serif;line-height:23px;font-si=
ze:15px;color:#2D2D2D; }
  .i2 p a { text-decoration:underline;color:#2D2D2D !important; }
  .i3 p { font-family:'Helvetica',Arial,sans-serif;line-height:43px;font-si=
ze:24px;color:#2D2D2D; }
  .i3 p a { text-decoration:underline;color:#2D2D2D !important; }
  .h p a { text-decoration:underline;color:#595959 !important; }
  .h2 p a { text-decoration:underline;color:#595959 !important; }
  .h3 p a { text-decoration:underline;color:#595959 !important; }
  .j { border-top:3px solid #DFD150; }
  .k p { padding-left:15px;padding-bottom:0px;padding-top:6px;mso-margin-to=
p-alt:6px;mso-margin-bottom-alt:0px;mso-margin-left-alt:15px; }
  .o { background-color:#FFFFFF;border:1px solid #F1F1F1;border-radius:5px;=
 }
  .o p { font-family:'Helvetica',Arial,sans-serif;padding:0px;margin:0px; }
  .l p,
  .l p a { font-size:14px;line-height:20px;font-weight: bold;color:#2D2D2D;=
padding-bottom:6px;mso-margin-bottom-alt:6px;text-decoration:none; }
  .m p,
  .m p a { font-size:13px;line-height:18px;font-weight:400;color:#2D2D2D;pa=
dding-bottom:6px;mso-margin-bottom-alt:6px;text-decoration:none; }
  .n p,
  .n p a { font-size:12px;line-height:17px;font-weight:400;color:#2D2D2D;pa=
dding-bottom:6px;mso-margin-bottom-alt:6px;text-decoration:none; }
  .p { background-color:#FFFFFF;max-width:520px;border:1px solid #E1E8ED;bo=
rder:1px solid rgba(80, 80, 80, 0.3);border-radius:5px; }
  .q { font-size:16px;font-family:Helvetica,Roboto,Calibri,sans-serif !impo=
rtant;border:1px solid #e1e8ed;border:1px solid rgba(80, 80, 80, 0.3);borde=
r-radius:5px;background-color:#FFFFFF; }
  .q p { font-size:16px;font-family:Helvetica,Roboto,Calibri,sans-serif !im=
portant;color:#222222; }
  .r { border:1px solid #E1E8ED !important;border-radius:5px; }
  .s p { font-size: 14px; line-height: 17px; font-weight: 400; color: #6978=
82; text-decoration: none; }
  .t p { font-family:'Helvetica',Arial,sans-serif;font-size:12px;line-heigh=
t:18px;font-weight:400;color:#000000;font-style:italic;padding:4px 0px 0px;=
}
  .v { border-radius:10px;border:solid 0px #438ac9;background-color:#bee0ff=
;font-family:'Arial',Helvetica,sans-serif;color:#155d9e; }
  .v a { text-decoration:none;display:block;color:#155d9e; }
  .w p { font-size:12px;line-height:15px;font-weight:400;color:#FFFFFF; }
  .w p a { text-decoration: underline !important;color:#FFFFFF !important; =
}
  ul { font-family:'Helvetica',Arial,sans-serif;margin:0px 0px 0px 25px !im=
portant;padding:0px !important;color:#2D2D2D;line-height:24px;list-style:di=
sc;font-size:16px; }
  ul li { font-family:'Helvetica',Arial,sans-serif;margin:10px 0px 0px 0px =
!important;padding: 0px 0px 0px 0px !important; color: #2D2D2D; list-style:=
disc; }
  ol { font-family:'Helvetica',Arial,sans-serif;margin: 0px 0px 0px 25px !i=
mportant;padding:0px !important;color:#2D2D2D;line-height:24px;list-style:d=
ecimal;font-size:16px; }
  ol li { font-family:'Helvetica',Arial,sans-serif;margin:10px 0px 0px 0px =
!important;padding: 0px 0px 0px 0px !important; color: #2D2D2D; list-style:=
decimal; }
  .e h3,
  .e p,
  .e span { padding-bottom:0px;padding-top:0px;mso-margin-top-alt:0px;mso-m=
argin-bottom-alt:0px; }
  .e span,
  .e li { font-family:'Helvetica',Arial,sans-serif;font-size:16px;color:#2D=
2D2D;line-height:24px; }
  .rec { font-family:  ui-sans-serif, system-ui, -apple-system, BlinkMacSys=
temFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-ser=
if, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color E=
moji" !important; }
  .rec__button:hover { background-color: #f9fafb !important; }
  .copyright a {color: inherit !important; text-decoration: none !important=
; font-size: inherit !important; font-family: inherit !important; font-weig=
ht: inherit !important; line-height: inherit !important;}
  .txt_social p { padding: 0; }
  .table, .table-c, .table-h { border: 1px solid #C0C0C0; }
  .table-c { padding:5px; background-color:#FFFFFF; }
  .table-c p { color: #2D2D2D; font-family:'Helvetica',Arial,sans-serif !im=
portant;overflow-wrap: break-word; }
  .table-h { padding:5px; background-color:#F1F1F1; }
  .table-h p { color: #2A2A2A; font-family:'Trebuchet MS','Lucida Grande',T=
ahoma,sans-serif !important;overflow-wrap: break-word; }
  @media only screen and (max-width:667px) {
    .aa { width: 100% !important; }
    .bb img { width: 100% !important; height: auto !important; max-width: n=
one !important; }
    .cc { padding: 0px 8px !important; }
    .ee { padding-top:10px !important;padding-bottom:10px !important; }
    .ff ul, .ff ol { margin: 0px 0px 0px 10px !important;padding: 0px !impo=
rtant; }
    .ff li { margin:10px 0px 0px 10px !important; }
    .r {height:140px !important;}
    .s p { font-size:13px !important;line-height:15px !important; }
    .mob-hide {display:none !important;}
    .mob-stack {display:block !important;width:100% !important;}
    .mob-w-full {width:100% !important;}
    .mob-block {display:block !important;}
    .embed-img {padding:0px 0px 12px 0px !important;}
    .socialShare {padding-top:15px !important;}
    .rec { padding-left:15px!important;padding-right:15px!important; }
    .bodyWrapper { padding:10px 4px 10px 4px !important; }
  }
  @media screen and (max-width: 480px) {
    u + .a .gg { width: 100% !important; width: 100vw !important; }
    .tok-heart { padding-top:75% !important; }
    .tok-play { padding-top: 250px !important; }
  }
  @media screen and (max-width: 320px) {
    .tok-heart { padding-top:65% !important; }
  }
  .u { border: 1px solid #CACACA !important; border-radius: 2px !important;=
 background-color: #ffffff !important; padding: 0px 13px 0px 13px !importan=
t; font-family:ui-sans-serif,system-ui,-apple-system,BlinkMacSystemFont,"Se=
goe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans",sans-serif !important;fon=
t-size: 12px !important; color: #767676 !important; }
  .u a { text-decoration: none; display: block !important; color: #767676 !=
important; margin: 0px !important; }
  .u span, .u img { color: #767676 !important;margin:0px !important; max-he=
ight:32px !important;background-color:#ffffff !important; }
</style><!--[if mso]><style type=3D"text/css">
    sup { font-size: 100% !important;vertical-align: .5em !important;mso-te=
xt-raise: -1.5% !important;line-height: 0 !important; }
    ul { margin-left:0px !important; margin-right:10px !important; margin-t=
op:20px !important; margin-bottom:20px !important; }
    ul li { margin-left: 0px !important; mso-special-format: decimal; }
    ol { margin-left:0px !important; margin-right:10px !important; margin-t=
op:20px !important; margin-bottom:20px !important; }
    ol li { margin-left: 0px !important; mso-special-format: decimal; }
    li.listItem { margin-left:15px !important; margin-top:0px !important; }
    .paddingDesktop { padding: 10px 0 !important; }
    .edm_outlooklist { margin-left: -20px !important; }
    .embedImage { display:none !important; }
  </style><![endif]--></head><body class=3D"a" style=3D"margin:0px auto;pad=
ding:0px;word-wrap:normal;word-spacing:normal;background-color:#f5f5f5;"><d=
iv role=3D"article" aria-roledescription=3D"email" aria-label=3D"email_name=
" lang=3Den style=3D"font-size:1rem"><div style=3D"display:none;max-height:=
0px;overflow:hidden;"> Join SEED &#39;24 & participate in 18 workshops! &#1=
60;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;=
&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#82=
04;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&=
#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#16=
0;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&=
#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#820=
4;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#=
8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160=
;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#=
160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204=
;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8=
204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;=
&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#1=
60;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;=
&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#82=
04;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&=
#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#16=
0;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&=
#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#820=
4;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#=
8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160=
;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#=
160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204=
;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8=
204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;=
&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#1=
60;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;=
&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#82=
04;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&=
#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#16=
0;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&=
#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#820=
4;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#=
8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160=
;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204; </div><table role=3D"none" =
width=3D"100%" border=3D"0" cellspacing=3D"0" align=3D"center" cellpadding=
=3D"0" class=3D"gg"><tr><td align=3D"center" valign=3D"top"><table role=3D"=
none" width=3D"670" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" class=
=3D"aa" style=3D"width:670px;table-layout:fixed;"><tr><td class=3D"bodyWrap=
per" align=3D"center" valign=3D"top" style=3D"padding:10px 5px 10px 5px;"><=
table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpaddi=
ng=3D"0" align=3D"center"><tr><td align=3D"center" valign=3D"top" style=3D"=
border:0px solid #FFFFFF;border-radius:10px;background-color:#ffffff;" clas=
s=3D"c"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" =
cellpadding=3D"0" align=3D"center"><tr><td class=3D"f" align=3D"right" vali=
gn=3D"top" style=3D"padding:20px 15px;"><p> April 22, 2024 &nbsp; | &nbsp; =
<a href=3D"https://link.mail.beehiiv.com/ss/c/u001.ja41VZAtR_qfVYIA2l6dByPc=
gm40JQbxLouneWPj9NO-QaAKU5v3Uihq7_J7Kxc8t6d4j3XtkHRy-MgDZN93o0w6bASuBxj9fnh=
Azdu96R45lLrxGn7Wce3844yyGk4H8Tqxx8n3FT8wuZQiS6GtMMrD9s7GgzrmFKdKHXFn2c9L34=
2rKAvdpRHhKckTddTa7qbkJKEYgPHPdHeNcDeA5ZfAljOGkYG-eg98j_oNpOzRzaU1dTEVuJcqW=
4X02ZGuyjjKX462w3ZSnrIdhJ7ExbycrDE2OJbuLRZ86oikOEBqUccrqEMXzCbCdzyQ7tDRQcAk=
eLp17ORqh5C10O8S_TvIFWr_BsfTHCS0kax2FKSsexvx3tsQrb0CuoTADXciaXQN_RGP-87UikO=
3oxRcDhOL_b64_-njtALil3nseKgtgVANM9TvjJ2GV2IEFV6hkB9QHljP7i41nzJOT9YfzCAnVd=
-mLR1dIko0iuzlgdmsnXj6nCL4aBQloJ4TAkZUwFFGtjQT_wX9Da2ajBvMrblGMJGZbJfydCk84=
ZUT3B154yKnNVpRtShDNus1os_eWh2Sit6xzA5vIVwWiGSQWfPNPU2Bb26iWYV2oGWk6PbFx47_=
9Nbw63_f97pmdDTSrFS88nXGSwk3O0rF6Waeo816D9BJ5VMRXT5vS9oPoz8/45q/673Y7OoOTMC=
-peplzn6Igg/h0/h001.8lYGyVJkfI9l6yM6Vdl8GQ8RyDzaXw2uFFAX0vAHfzU">Read Onlin=
e</a></p></td></tr><tr><td style=3D"height:0px;width:0px;"><div style=3D"he=
ight:1px;" data-open-tracking=3D"true"> <img src=3D"https://link.mail.beehi=
iv.com/ss/o/u001.76lOL-0293a1YMnLUs-4IA/45q/673Y7OoOTMC-peplzn6Igg/ho.gif" =
alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"height:1px !importa=
nt;width:1px !important;border-width:0 !important;margin-top:0 !important;m=
argin-bottom:0 !important;margin-right:0 !important;margin-left:0 !importan=
t;padding-top:0 !important;padding-bottom:0 !important;padding-right:0 !imp=
ortant;padding-left:0 !important;"/> </div></td></tr><tr id=3D"content-bloc=
ks"><td class=3D"email-card-body" align=3D"center" valign=3D"top" style=3D"=
padding-bottom:15px;"><table role=3D"none" width=3D"100%" border=3D"0" cell=
spacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td class=3D"dd" align=
=3D"center" style=3D"padding:0px 15px;text-align:center;word-break:break-wo=
rd;"><p></p></td></tr><tr><td align=3D"center" valign=3D"top" style=3D"padd=
ing: 0px 15px 0px; " class=3D"dd"><table role=3D"none" border=3D"0" cellspa=
cing=3D"0" cellpadding=3D"0" style=3D"margin:0 auto 0 auto;"><tr><td align=
=3D"center" valign=3D"top" style=3D"width:252px;"><a href=3D"https://link.m=
ail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad1LOGaFg=
9-6Ik4koUqS_adtppE6NmAHVhAcf_h8YchlOJaQ_TQg9QzMw_wdkLd6ezXe4B58ARO8CCLsXDtf=
qN35oJ8F7nGDK_XiN2ykpZMZAy4M3CZ3LJaRMpsrsWYTWr6Fs-K2afCXOK2lidEBwuQpxWsMJAo=
Iukpfkc3molJ3bA/45q/673Y7OoOTMC-peplzn6Igg/h1/h001.3TK2OU06g3IzHV0n8iWXr1Fz=
zOBxXlv0F7kAMY3Czbk" rel=3D"noopener noreferrer nofollow" style=3D"text-dec=
oration:none;" target=3D"_blank"><img src=3D"https://media.beehiiv.com/cdn-=
cgi/image/fit=3Dscale-down,format=3Dauto,onerror=3Dredirect,quality=3D80/up=
loads/asset/file/dcbc0422-e91e-4be2-9044-0744bbc94e07/6543f3704bcc1407f3339=
baf.png?t=3D1702884418" alt=3D"" height=3D"auto" width=3D"252" style=3D"dis=
play:block;width:100%;" border=3D"0"/></a></td></tr></table></td></tr><tr><=
td class=3D"dd" align=3D"center" valign=3D"top" style=3D"padding:0px 15px;t=
ext-align:center;"><h3><span style=3D"color:#438ac9;font-family:Arial;font-=
size:36px;"><b>Join SEED 2024 </b></span><span style=3D"color:rgb(67, 138, =
201);font-family:Arial;font-size:36px;"><b>& participate in 18 workshops</b=
></span><span style=3D"color:#438ac9;font-family:Arial;font-size:36px;">! <=
/span></h3></td></tr><tr><td class=3D"dd" align=3D"center" valign=3D"top" s=
tyle=3D"padding:0px 15px;text-align:center;"><h3><span style=3D"color:rgb(6=
7, 138, 201);font-family:Arial;font-size:24px;">Early registration until Ap=
ril 26th</span></h3></td></tr><tr><td class=3D"dd" align=3D"center" valign=
=3D"top" style=3D"padding:0px 15px;text-align:center;"><h3><span style=3D"c=
olor:rgb(232, 25, 90);font-family:Arial;font-size:36px;">Do not miss the op=
portunity to get your paper published in </span><span style=3D"color:rgb(23=
2, 25, 90);font-family:Arial;font-size:36px;"><b>WS05 GAME-SME</b></span><s=
pan style=3D"color:rgb(232, 25, 90);font-family:Arial;font-size:36px;">=C2=
=A0</span></h3></td></tr><tr><td align=3D"center" valign=3D"top" style=3D"p=
adding-bottom:14px;padding-left:15px;padding-right:15px;padding-top:14px;te=
xt-align:center;width:100%;word-break:break-word;" class=3D"dd"><table role=
=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"center"=
><tr><td class=3D"v" align=3D"center" valign=3D"middle" height=3D"52" style=
=3D"height:52px;"><a href=3D"https://link.mail.beehiiv.com/ss/c/u001.ja41VZ=
AtR_qfVYIA2l6dB_BAFYixoDqACV-_1l2bY7y6bIPyT91w9eu6ILPkYZqtTUcGdSu0lSzWabH4R=
IsKgnOW9bWdzTUTNWbxp9_r8smq3pRUiz9Kia0m8J3YlN97JqbtRfFbLP8xudBRBToNTcuGvWR2=
AFYzvUTswoxrZFEUiJQc70YPJksWc_LH9Yj42LuNR91lTHIQlznzuKooMiE0CGCWVhwhBgZM5yL=
XPds/45q/673Y7OoOTMC-peplzn6Igg/h2/h001.9tWQYtDTZFscGkvNSfiukXgyuiEPW1cjjPc=
O2Ek95fk" target=3D"_blank" rel=3D"noopener noreferrer nofollow" style=3D"c=
olor:#155d9e;font-size:18px;padding:0px 22px;text-decoration:none;"> Learn =
more </a></td></tr></table></td></tr><tr><td align=3D"center" valign=3D"top=
" style=3D"padding: 0px 15px 0px; " class=3D"dd"><table role=3D"none" borde=
r=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"margin:0 auto 0 auto;"=
><tr><td align=3D"center" valign=3D"top" style=3D"width:630px;"><a href=3D"=
https://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hV=
zFrpIad2S3JbPMGacTyZyB5EOQz_xp0aw93paP535UwgPq13Wo3HJXLKqW_RDfZnxIIfvHuoTno=
OM1Qi-GD0MJG7XoSBvCDoITof3IarWuUVzVUfK6P4-HXEdC4dTVz1rUJUFt5liXhrFn7ReTZLr2=
cRwdRvtxeZ5tS0S0BErb0GTgNJO8w/45q/673Y7OoOTMC-peplzn6Igg/h3/h001.6v4_qIGE8s=
_3mJLrdJXryMmh-gnKrT4JnihQXO5BYWk" rel=3D"noopener noreferrer nofollow" sty=
le=3D"text-decoration:none;" target=3D"_blank"><img src=3D"https://media.be=
ehiiv.com/cdn-cgi/image/fit=3Dscale-down,format=3Dauto,onerror=3Dredirect,q=
uality=3D80/uploads/asset/file/f762a9ae-0c08-459b-8512-c7a20132db56/hero-ws=
2.jpg?t=3D1713528165" alt=3D"" height=3D"auto" width=3D"630" style=3D"displ=
ay:block;width:100%;" border=3D"0"/></a></td></tr></table></td></tr><tr><td=
><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpad=
ding=3D"0" style=3D""><tr><td bgcolor=3D"#E8BEC7" style=3D"background-color=
:#E8BEC7;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" bord=
er=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=3D"=
center" valign=3D"top" style=3D"padding:0px 15px;text-align:center;"><h1><s=
pan style=3D"color:#e8195a;">In this newsletter:</span></h1></td></tr></tab=
le></td></tr></table></td></tr><tr><td><table role=3D"none" width=3D"100%" =
border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=
=3D"#E8BEC7" style=3D"background-color:#E8BEC7;padding:0px 0px 0px 0px;"><t=
able role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpaddin=
g=3D"0"><tr><td class=3D"dd" align=3D"center" style=3D"padding:0px 15px;tex=
t-align:center;word-break:break-word;"><p><span style=3D"color:#e8195a;">Cl=
ick on the Workshop below to read more:</span></p></td></tr></table></td></=
tr></table></td></tr><tr><td><table role=3D"none" width=3D"100%" border=3D"=
0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#E8BEC=
7" style=3D"background-color:#E8BEC7;padding:0px 0px 0px 0px;"><table role=
=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><=
tr><td class=3D"dd" align=3D"center" style=3D"padding:0px 15px;text-align:c=
enter;word-break:break-word;"><p><span style=3D"color:#e8195a;"><b><a class=
=3D"link" href=3D"#ws1" rel=3D"noopener noreferrer nofollow" clicktracking=
=3D"off"><span>WS01</span></a></b></span><span style=3D"color:#e8195a;"><b>=
 | </b></span><span style=3D"color:#e8195a;"><b><a class=3D"link" href=3D"#=
ws2" rel=3D"noopener noreferrer nofollow" clicktracking=3D"off"><span>WS02<=
/span></a></b></span><span style=3D"color:rgb(232, 25, 90);"><b> | </b></sp=
an><span style=3D"color:rgb(232, 25, 90);"><b><a class=3D"link" href=3D"#ws=
3" rel=3D"noopener noreferrer nofollow" clicktracking=3D"off"><span>WS03</s=
pan></a></b></span><span style=3D"color:rgb(232, 25, 90);"><b> | </b></span=
><span style=3D"color:rgb(232, 25, 90);"><b><a class=3D"link" href=3D"#ws4"=
 rel=3D"noopener noreferrer nofollow" clicktracking=3D"off"><span>WS04</spa=
n></a></b></span><span style=3D"color:rgb(232, 25, 90);"><b> | </b></span><=
span style=3D"color:rgb(232, 25, 90);"><b><a class=3D"link" href=3D"#ws5" r=
el=3D"noopener noreferrer nofollow" clicktracking=3D"off"><span>WS05</span>=
</a></b></span><span style=3D"color:rgb(232, 25, 90);"><b> | </b></span><sp=
an style=3D"color:rgb(232, 25, 90);"><b><a class=3D"link" href=3D"#ws6" rel=
=3D"noopener noreferrer nofollow" clicktracking=3D"off"><span>WS06</span></=
a></b></span><br><span style=3D"color:rgb(232, 25, 90);"><b><a class=3D"lin=
k" href=3D"#ws7" rel=3D"noopener noreferrer nofollow" clicktracking=3D"off"=
><span>WS07</span></a></b></span><span style=3D"color:rgb(232, 25, 90);"><b=
> | </b></span><span style=3D"color:rgb(232, 25, 90);"><b><a class=3D"link"=
 href=3D"#ws8" rel=3D"noopener noreferrer nofollow" clicktracking=3D"off"><=
span>WS08</span></a></b></span><span style=3D"color:rgb(232, 25, 90);"><b> =
| </b></span><span style=3D"color:rgb(232, 25, 90);"><b><a class=3D"link" h=
ref=3D"#ws9" rel=3D"noopener noreferrer nofollow" clicktracking=3D"off"><sp=
an>WS09</span></a></b></span><span style=3D"color:rgb(232, 25, 90);"><b> | =
</b></span><span style=3D"color:rgb(232, 25, 90);"><b><a class=3D"link" hre=
f=3D"#ws10" rel=3D"noopener noreferrer nofollow" clicktracking=3D"off"><spa=
n>WS10</span></a></b></span><span style=3D"color:rgb(232, 25, 90);"><b> | <=
/b></span><span style=3D"color:rgb(232, 25, 90);"><b><a class=3D"link" href=
=3D"#ws11" rel=3D"noopener noreferrer nofollow" clicktracking=3D"off"><span=
>WS11</span></a></b></span><span style=3D"color:rgb(232, 25, 90);"><b> | </=
b></span><span style=3D"color:rgb(232, 25, 90);"><b><a class=3D"link" href=
=3D"#ws12" rel=3D"noopener noreferrer nofollow" clicktracking=3D"off"><span=
>WS12</span></a></b></span><br><span style=3D"color:rgb(232, 25, 90);"><b><=
a class=3D"link" href=3D"#ws13" rel=3D"noopener noreferrer nofollow" clickt=
racking=3D"off"><span>WS13</span></a></b></span><span style=3D"color:rgb(23=
2, 25, 90);"><b> | </b></span><span style=3D"color:rgb(232, 25, 90);"><b><a=
 class=3D"link" href=3D"#ws14" rel=3D"noopener noreferrer nofollow" clicktr=
acking=3D"off"><span>WS14</span></a></b></span><span style=3D"color:rgb(232=
, 25, 90);"><b> | </b></span><span style=3D"color:rgb(232, 25, 90);"><b><a =
class=3D"link" href=3D"#ws15" rel=3D"noopener noreferrer nofollow" clicktra=
cking=3D"off"><span>WS15</span></a></b></span><span style=3D"color:rgb(232,=
 25, 90);"><b> | </b></span><span style=3D"color:rgb(232, 25, 90);"><b><a c=
lass=3D"link" href=3D"#ws16" rel=3D"noopener noreferrer nofollow" clicktrac=
king=3D"off"><span>WS16</span></a></b></span><span style=3D"color:rgb(232, =
25, 90);"><b> | </b></span><span style=3D"color:rgb(232, 25, 90);"><b><a cl=
ass=3D"link" href=3D"#ws17" rel=3D"noopener noreferrer nofollow" clicktrack=
ing=3D"off"><span>WS17</span></a></b></span><span style=3D"color:rgb(232, 2=
5, 90);"><b> | </b></span><span style=3D"color:rgb(232, 25, 90);"><b><a cla=
ss=3D"link" href=3D"#ws18" rel=3D"noopener noreferrer nofollow" clicktracki=
ng=3D"off"><span>WS18</span></a></b></span></p></td></tr></table></td></tr>=
</table></td></tr><tr><td><table id=3D"ws1" role=3D"none" width=3D"100%" bo=
rder=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=
=3D"transparent" style=3D"background-color:transparent;padding:0px 0px 0px =
0px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" ce=
llpadding=3D"0"><tr><td class=3D"dd" align=3D"center" valign=3D"top" style=
=3D"padding:0px 15px;text-align:center;"><h1><span style=3D"">WS01. Enablin=
g the flow of knowledge for the Energy and Hydrogen Transition</span></h1><=
/td></tr><tr><td class=3D"dd" align=3D"center" style=3D"padding:0px 15px;te=
xt-align:center;word-break:break-word;"><p><span style=3D"color:rgb(0, 0, 0=
);">In this workshop, we will share our good practices from The Netherlands=
, of which the proven method of Learning Communities. We will illustrate ho=
w research, education, and practical implementation of innovations can rein=
force each other and better tackling societal challenges like the energy tr=
ansition. Next, we would like to discuss the possibilities of an internatio=
nal network in which we can share learnings of proven and new concepts.</sp=
an></p></td></tr><tr><td align=3D"center" valign=3D"top" style=3D"padding-b=
ottom:14px;padding-left:15px;padding-right:15px;padding-top:14px;text-align=
:center;width:100%;word-break:break-word;" class=3D"dd"><table role=3D"none=
" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td=
 class=3D"v" align=3D"center" valign=3D"middle" height=3D"42" style=3D"heig=
ht:42px;"><a href=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ=
0InFUCEtII-f83mS9u8hVzFrpIad14hr7oMXwaREjCGwTDWZ3Yr2-cBt-iaZ4P3kIhKy9xW80Hc=
qUZDLTGfrnlk1dssW8R8FoNFKbgnfRBWkPmP6b8LOmVuzZB88eSFzk5z1PwZ24FI7-tpYbxzwDE=
VSLXYpMjsulRtIyMwmIdItt6aKAJHCdfNuTehCM5xclYs7q0-g/45q/673Y7OoOTMC-peplzn6I=
gg/h4/h001.anEp-C8HY1NjAlZAlm4SGfAGQjOUJHhLr8X58RhMuVc" target=3D"_blank" r=
el=3D"noopener noreferrer nofollow" style=3D"color:#155d9e;font-size:16px;p=
adding:0px 14px;text-decoration:none;"> Read more </a></td></tr></table></t=
d></tr></table></td></tr></table></td></tr><tr><td><table id=3D"ws2" role=
=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" s=
tyle=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:#EFF2F7;pad=
ding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" border=3D"0" cel=
lspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=3D"center" vali=
gn=3D"top" style=3D"padding:0px 15px;text-align:center;"><h1><span style=3D=
"">WS02. Sustainable Energy Education: Delivering the energy workforce of t=
he future</span></h1></td></tr><tr><td class=3D"dd" align=3D"center" style=
=3D"padding:0px 15px;text-align:center;word-break:break-word;"><p><span sty=
le=3D"color:rgb(0, 0, 0);">This workshop aims to address the evolving lands=
cape of the energy sector and the educational needs to deliver a skilled wo=
rk force that is ready to deliver clean energy access that is technological=
ly sound, economically feasible, and locally appropriate. Through a panel d=
iscussion and interactive session, this workshop will explore the role of e=
nergy education in cultivating a workforce that is capable of addressing th=
e multiple, complex challenges faced within the sector.</span></p></td></tr=
><tr><td align=3D"center" valign=3D"top" style=3D"padding-bottom:14px;paddi=
ng-left:15px;padding-right:15px;padding-top:14px;text-align:center;width:10=
0%;word-break:break-word;" class=3D"dd"><table role=3D"none" border=3D"0" c=
ellspacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td class=3D"v" ali=
gn=3D"center" valign=3D"middle" height=3D"42" style=3D"height:42px;"><a hre=
f=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS=
9u8hVzFrpIad35n8hCZE2kHba0yP4siU_de0TDKi_mUO9BNaZU_1wHb_8tt0GxWsofCNnaeJi3S=
ZD-8tDm9D5cAFKO4yFHf_xXVFtfWN2UPRY7mZq3Q0V9O-kldTwYbudJQAW_GczX4OIuedeN9WSW=
cQBp8RsJhTQMr7l2XgJ0hvE58fVJHFPrpw/45q/673Y7OoOTMC-peplzn6Igg/h5/h001.EtBQ0=
wmIXp8AHaGuDLWkcMuqYpSshSgV715_igKIeY4" target=3D"_blank" rel=3D"noopener n=
oreferrer nofollow" style=3D"color:#155d9e;font-size:16px;padding:0px 14px;=
text-decoration:none;"> Read more </a></td></tr></table></td></tr></table><=
/td></tr></table></td></tr><tr><td><table id=3D"ws3" role=3D"none" width=3D=
"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td =
bgcolor=3D"transparent" style=3D"background-color:transparent;padding:0px 0=
px 0px 0px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=3D"center" valign=3D"to=
p" style=3D"padding:0px 15px;text-align:center;"><h1><span style=3D"">WS03.=
 ESExNBS@NEB - Exploring Sustainable Education implementing the Nature-Base=
d Solution in the New European Bauhaus perspective</span></h1></td></tr><tr=
><td class=3D"dd" align=3D"center" style=3D"padding:0px 15px;text-align:cen=
ter;word-break:break-word;"><p><span style=3D"color:rgb(0, 0, 0);">New Euro=
pean Bauhaus (NEB) initiative aligns with the EU&#39;s goal of carbon neutr=
ality by 2050, integrating aesthetics and sustainability inspired by histor=
ic Bauhaus movement. This workshop explores the key concepts of NEB =E2=80=
=93 sustainability, inclusiveness, aesthetics and social engagement =E2=80=
=93 =E2=80=8B=E2=80=8Bidentifying crucial skills for upskilling the workfor=
ce in nature-based solutions (NBS) for urban regeneration. The workshop, us=
ing the World Caf=C3=A9 method, aims to devise effective teaching technique=
s, discovering skills essential to NEB&#39;s values =E2=80=8B=E2=80=8Band a=
ddressing environmental challenges. It brings together educators, professio=
nals and organizations for cross-sector collaboration, emphasizing communit=
y involvement and raising awareness about the potential of NBS in the NEB p=
erspective.</span></p></td></tr><tr><td align=3D"center" valign=3D"top" sty=
le=3D"padding-bottom:14px;padding-left:15px;padding-right:15px;padding-top:=
14px;text-align:center;width:100%;word-break:break-word;" class=3D"dd"><tab=
le role=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"=
center"><tr><td class=3D"v" align=3D"center" valign=3D"middle" height=3D"42=
" style=3D"height:42px;"><a href=3D"https://link.mail.beehiiv.com/ss/c/u001=
.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad3uzjQNhPONTz0OXKTKbeUaJDOLEB156A=
gx-YqDpUJ5lvqC8Xb9IPbLAmWgv_0CCxQSDVpx1eM3ocRTctvAu57WIYuSovJeNoG_tICkIfc4Q=
KOhaqaaubad4ZY4Qqy1X9Pr69H2DVSpfbjrtSRopzlzavYYUI1fMlpPo28BRSuRiA/45q/673Y7=
OoOTMC-peplzn6Igg/h6/h001.aqRpM-wMRcxhojNMasdo3U0INDsZJrjw9hoGp3sJ9AA" targ=
et=3D"_blank" rel=3D"noopener noreferrer nofollow" style=3D"color:#155d9e;f=
ont-size:16px;padding:0px 14px;text-decoration:none;"> Read more </a></td><=
/tr></table></td></tr></table></td></tr></table></td></tr><tr><td><table id=
=3D"ws4" role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpa=
dding=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"background-colo=
r:#EFF2F7;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" bor=
der=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=3D=
"center" valign=3D"top" style=3D"padding:0px 15px;text-align:center;"><h1><=
span style=3D"">WS04. MINDS =E2=80=93 Meaningful Immersive Narratives Drivi=
ng Sustainability</span></h1></td></tr><tr><td class=3D"dd" align=3D"center=
" style=3D"padding:0px 15px;text-align:center;word-break:break-word;"><p><s=
pan style=3D"color:rgb(0, 0, 0);">The MINDS project aims to change young pe=
ople&#39;s attitudes towards sustainability using Virtual Reality (VR) for =
immersive storytelling, marking a significant shift in sustainability educa=
tion. By making these complex issues more relatable and engaging, VR can he=
lp foster a deeper understanding and urgency for environmental matters. Thi=
s workshop shares experiences from the project&#39;s pilot, focusing on nar=
rative techniques in sustainability education, addressing educational chall=
enges, and enhancing skills in creating compelling environmental narratives=
. To ensure that the project=E2=80=99s outcomes are tailored to the needs a=
nd expectations of educators, we invite you to share your thoughts and chal=
lenges in sustainability education. </span></p></td></tr><tr><td align=3D"c=
enter" valign=3D"top" style=3D"padding-bottom:14px;padding-left:15px;paddin=
g-right:15px;padding-top:14px;text-align:center;width:100%;word-break:break=
-word;" class=3D"dd"><table role=3D"none" border=3D"0" cellspacing=3D"0" ce=
llpadding=3D"0" align=3D"center"><tr><td class=3D"v" align=3D"center" valig=
n=3D"middle" height=3D"42" style=3D"height:42px;"><a href=3D"https://link.m=
ail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad3v5YHnY=
r1vYAljlb2Ox0GzXUjq2V_FWtJMrl5O4MpvipkLw6bIHtWL7vU41B-dNZXVgUg7MfqlqCjSPu0K=
n9B0Xt3o44PegXj4FdzQhMUjLk9NghdQAaQj_D8q9kq5SMPshyfdcT8W4jr_yRs5kzzi9tqx8lh=
a0IXjaQ-z6KgNmw/45q/673Y7OoOTMC-peplzn6Igg/h7/h001.2FNT4ogSCXsBy2wcR-1zBM-j=
-kdb_V4HBT7jVNaE62Q" target=3D"_blank" rel=3D"noopener noreferrer nofollow"=
 style=3D"color:#155d9e;font-size:16px;padding:0px 14px;text-decoration:non=
e;"> Read more </a></td></tr></table></td></tr></table></td></tr></table></=
td></tr><tr><td><table id=3D"ws5" role=3D"none" width=3D"100%" border=3D"0"=
 cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#FFFFFF"=
 style=3D"background-color:#FFFFFF;padding:0px 0px 0px 0px;"><table role=3D=
"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr>=
<td class=3D"dd" align=3D"center" valign=3D"top" style=3D"padding:0px 15px;=
text-align:center;"><h1><span style=3D"">WS05. Game-based Learning for Sust=
ainability in Management Education (GAME-SME)</span></h1></td></tr><tr><td =
class=3D"dd" align=3D"center" style=3D"padding:0px 15px;text-align:center;w=
ord-break:break-word;"><p><span style=3D"color:rgb(0, 0, 0);">This workshop=
 aims to provide an interactive platform for participants to share and disc=
uss research findings, pedagogical strategies, and practical experiences in=
 utilizing business games as tools for teaching sustainability principles i=
n management courses. The primary objective is to explore the intersection =
of two dynamic streams of research and educational trends: the utilization =
of learning/experimental games and the incorporation of sustainability them=
es in management education. </span></p></td></tr><tr><td align=3D"center" v=
align=3D"top" style=3D"padding-bottom:14px;padding-left:15px;padding-right:=
15px;padding-top:14px;text-align:center;width:100%;word-break:break-word;" =
class=3D"dd"><table role=3D"none" border=3D"0" cellspacing=3D"0" cellpaddin=
g=3D"0" align=3D"center"><tr><td class=3D"v" align=3D"center" valign=3D"mid=
dle" height=3D"42" style=3D"height:42px;"><a href=3D"https://link.mail.beeh=
iiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad1lHmmqP5iOdZUm1=
f9JVYI2CO2SKs76ucV09PC1q4mVZpG_C6sO9X1hQNcdwxN3ywhQsgE0PU36mS36YWxk_GzZ9AO_=
pC4EOBjd6-xr0DPkn4XEwahxctaIL73y6pu5IBi5ormVTm7PUZz2PVI3-s8ugwBaJsM1UETIooG=
Srv7ADw/45q/673Y7OoOTMC-peplzn6Igg/h8/h001.yWxgx9VSbW8h7pcqBzzJSKuVBd8n-8Uz=
kGAlQy3sikM" target=3D"_blank" rel=3D"noopener noreferrer nofollow" style=
=3D"color:#155d9e;font-size:16px;padding:0px 14px;text-decoration:none;"> R=
ead more </a></td></tr></table></td></tr></table></td></tr></table></td></t=
r><tr><td><table id=3D"ws6" role=3D"none" width=3D"100%" border=3D"0" cells=
pacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7" style=
=3D"background-color:#EFF2F7;padding:0px 0px 0px 0px;"><table role=3D"none"=
 width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td cl=
ass=3D"dd" align=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-a=
lign:center;"><h1><span style=3D"">WS06. Empowering Through Education: T-Sh=
ore&#39;s Approach to Wind Turbine Technician Training (T-shoreEdu)</span><=
/h1></td></tr><tr><td class=3D"dd" align=3D"center" style=3D"padding:0px 15=
px;text-align:center;word-break:break-word;"><p><span style=3D"color:rgb(0,=
 0, 0);">Welcome to &quot;Empowering Through Education: T-Shore&#39;s Appro=
ach to Wind Turbine Technician Training,&quot; a workshop designed for educ=
ators, trainers, and professionals committed to the advancement of sustaina=
ble energy education. At the heart of our mission is the harmonisation of t=
raining programs across Europe, aiming to establish a standardised yet flex=
ible curriculum that meets the diverse needs of offshore wind technicians. =
This ambition confronts the intricate challenge of aligning educational pra=
ctices across five countries, each with its unique education system and cou=
rse programming methodologies.</span></p></td></tr><tr><td align=3D"center"=
 valign=3D"top" style=3D"padding-bottom:14px;padding-left:15px;padding-righ=
t:15px;padding-top:14px;text-align:center;width:100%;word-break:break-word;=
" class=3D"dd"><table role=3D"none" border=3D"0" cellspacing=3D"0" cellpadd=
ing=3D"0" align=3D"center"><tr><td class=3D"v" align=3D"center" valign=3D"m=
iddle" height=3D"42" style=3D"height:42px;"><a href=3D"https://link.mail.be=
ehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad2bbZFje0nmw6y=
Q-lrxSMYVu129vJq51CBgCzK1xVpexVcStGdrkPrpxw2VRs--7OOLHTeh9yZJkPb3Zhi3vQwheF=
rvqFJ256rzbvxKtFCPKqcep8U9d080tEWwOfY4UkUTjPwRucQY0wldg17a4r2vv0x6B9vtHvbGa=
1Vd60VQkA/45q/673Y7OoOTMC-peplzn6Igg/h9/h001.MEMbGg867XJaqywFyaRGEdhC7-eFxN=
rQhujzE6pmyUg" target=3D"_blank" rel=3D"noopener noreferrer nofollow" style=
=3D"color:#155d9e;font-size:16px;padding:0px 14px;text-decoration:none;"> R=
ead more </a></td></tr></table></td></tr></table></td></tr></table></td></t=
r><tr><td><table id=3D"ws7" role=3D"none" width=3D"100%" border=3D"0" cells=
pacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"transparent" s=
tyle=3D"background-color:transparent;padding:0px 0px 0px 0px;"><table role=
=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><=
tr><td class=3D"dd" align=3D"center" valign=3D"top" style=3D"padding:0px 15=
px;text-align:center;"><h1><span style=3D"">WS07. Build your own LEAF: Lear=
ning Ecosystem Taking Action for the Future</span></h1></td></tr><tr><td cl=
ass=3D"dd" align=3D"center" style=3D"padding:0px 15px;text-align:center;wor=
d-break:break-word;"><p><span style=3D"color:rgb(0, 0, 0);">The urgent sust=
ainability challenges that students are expected to solve or cope with in t=
he future require holistic interventions. We developed learning communities=
 as part of a wider ecosystem to offer our students the opportunity to coll=
aborate, learn and innovate on equal footing with all sorts of knowledge pa=
rtners. Involvement from applied sciences and vocational education students=
, as well as private sector, government, and citizens ensures that they exp=
erience the complexity of the real world. Our workshop consists of a simula=
tion game that walks participants through the process of setting up a learn=
ing ecosystem on climate action education.</span></p></td></tr><tr><td alig=
n=3D"center" valign=3D"top" style=3D"padding-bottom:14px;padding-left:15px;=
padding-right:15px;padding-top:14px;text-align:center;width:100%;word-break=
:break-word;" class=3D"dd"><table role=3D"none" border=3D"0" cellspacing=3D=
"0" cellpadding=3D"0" align=3D"center"><tr><td class=3D"v" align=3D"center"=
 valign=3D"middle" height=3D"42" style=3D"height:42px;"><a href=3D"https://=
link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad3=
g-nYS-am3PsP2WxhBJR2e9wI_R_XqUtr3ByeBjh1MFmJs6vh92PuSKhLKx7LKj6HE7t7hIQFjIm=
s3Oe6rBfGswNsV7NDD-xPX-_gDK38eT2QPs94rxI6OdS5ip50Ca8lWQDuTly8d9msAzyh3kWsYQ=
PdzPRPv8TPliZseiU42cg/45q/673Y7OoOTMC-peplzn6Igg/h10/h001._NQY41bzRjTs6-PZ5=
1kJ8VdrnIJM1tv72XDhgxAZOFo" target=3D"_blank" rel=3D"noopener noreferrer no=
follow" style=3D"color:#155d9e;font-size:16px;padding:0px 14px;text-decorat=
ion:none;"> Read more </a></td></tr></table></td></tr></table></td></tr></t=
able></td></tr><tr><td><table id=3D"ws8" role=3D"none" width=3D"100%" borde=
r=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#=
eef2f7" style=3D"background-color:#eef2f7;padding:0px 0px 0px 0px;"><table =
role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"=
0"><tr><td class=3D"dd" align=3D"center" valign=3D"top" style=3D"padding:0p=
x 15px;text-align:center;"><h1><span style=3D"">WS08. Sustainable Business =
Models in practice: a business game competition (BG-COMP)</span></h1></td><=
/tr><tr><td class=3D"dd" align=3D"center" style=3D"padding:0px 15px;text-al=
ign:center;word-break:break-word;"><p><span style=3D"color:rgb(0, 0, 0);">T=
he workshop immerses participants in a virtual clothing company, challengin=
g them to reevaluate traditional business models and achieve a sustainable =
balance between economic viability, environmental stewardship, and social r=
esponsibility. Through dynamic business game simulations, participants gain=
 practical experience, navigating real-world challenges and refining their =
decision making acumen. The workshop aims to foster an understanding of sus=
tainable business principles and their practical application in the fashion=
 industry. Participants are encouraged to integrate the triple bottom line =
framework into their decision-making processes. </span></p></td></tr><tr><t=
d align=3D"center" valign=3D"top" style=3D"padding-bottom:14px;padding-left=
:15px;padding-right:15px;padding-top:14px;text-align:center;width:100%;word=
-break:break-word;" class=3D"dd"><table role=3D"none" border=3D"0" cellspac=
ing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td class=3D"v" align=3D"c=
enter" valign=3D"middle" height=3D"42" style=3D"height:42px;"><a href=3D"ht=
tps://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzF=
rpIad2J7XBKXMD8XKWIhly8A38ITt-rV2we4VuFZub-Faq5ACn3-H3aql9I52h2G4Ls4gNvz24X=
wvjOwPhQUOdzMtD25gD7sPNT3ngE5ad7Z8cWtLpCgMfM3g0nofYU9egcDiUCZJat9TQkhf-WwsQ=
Mf4gxeXlECojCVZs2HcK6BIYtbg/45q/673Y7OoOTMC-peplzn6Igg/h11/h001.UUDy8IJ513X=
yi_XR7wlDUjzn-yluShFisumTazMVHAI" target=3D"_blank" rel=3D"noopener norefer=
rer nofollow" style=3D"color:#155d9e;font-size:16px;padding:0px 14px;text-d=
ecoration:none;"> Read more </a></td></tr></table></td></tr></table></td></=
tr></table></td></tr><tr><td><table id=3D"ws9" role=3D"none" width=3D"100%"=
 border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolo=
r=3D"transparent" style=3D"background-color:transparent;padding:0px 0px 0px=
 0px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" c=
ellpadding=3D"0"><tr><td class=3D"dd" align=3D"center" valign=3D"top" style=
=3D"padding:0px 15px;text-align:center;"><h1><span style=3D"">WS09. PROPOSA=
L OF A TRAINING WORKSHOP FOR THE SEED CONFERENCE</span></h1></td></tr><tr><=
td class=3D"dd" align=3D"center" style=3D"padding:0px 15px;text-align:cente=
r;word-break:break-word;"><p><span style=3D"color:rgb(0, 0, 0);">Europe and=
 Africa have to jointly promote a hydrogen transition to boost sustainable =
economic development and a decarbonization of their economic sector. Africa=
n green hydrogen transition could boost local economies development, that=
=E2=80=99s why it=E2=80=99s important that both EU and AU hydrogen policies=
 and development roadmaps have to be conceived in a cross-fertilizing way.<=
/span></p></td></tr><tr><td align=3D"center" valign=3D"top" style=3D"paddin=
g-bottom:14px;padding-left:15px;padding-right:15px;padding-top:14px;text-al=
ign:center;width:100%;word-break:break-word;" class=3D"dd"><table role=3D"n=
one" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"center"><tr>=
<td class=3D"v" align=3D"center" valign=3D"middle" height=3D"42" style=3D"h=
eight:42px;"><a href=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZ=
gnZ0InFUCEtII-f83mS9u8hVzFrpIad318-k_uEFhQwXXmy2KCANdJDFBQNSzjty4f1iv1Yb8iW=
_SjS5ptDQXLGyyPZviL_RWvh1qQDlrypKFfWyPN9BfQehPBHPb5Y3GjeV4b8eOQAtB62XpLeWQL=
8u4Wh2onOBMr_1yGssbZ5CRWHQeC_DfAW-dpsYvfUbtGNZEYIr9DA/45q/673Y7OoOTMC-peplz=
n6Igg/h12/h001.1osQoajJpRwMggiS2aA6lDd_0vCwT-lxQRvEDzMiqKI" target=3D"_blan=
k" rel=3D"noopener noreferrer nofollow" style=3D"color:#155d9e;font-size:16=
px;padding:0px 14px;text-decoration:none;"> Read more </a></td></tr></table=
></td></tr></table></td></tr></table></td></tr><tr><td><table id=3D"ws10" r=
ole=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0=
" style=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:#EFF2F7;=
padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" border=3D"0" =
cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=3D"center" v=
align=3D"top" style=3D"padding:0px 15px;text-align:center;"><h1><span style=
=3D"">WS10. Unveiling Training and Skill Requirements for Driving the Adopt=
ion of Emerging Technologies in the Renewable Energy field. - RE-SKILLS Wor=
kshop</span></h1></td></tr><tr><td class=3D"dd" align=3D"center" style=3D"p=
adding:0px 15px;text-align:center;word-break:break-word;"><p><span style=3D=
"color:rgb(0, 0, 0);">The RE-SKILLS workshop aims to address the demand for=
 skilled professionals capable of implementing cutting-edge technological p=
roposals in the dynamic landscape of the energy sector. With a focus on nov=
el technological concepts, the event will bring together industry experts, =
academia, and professionals to identify essential skills and capabilities r=
equired for successful integration.</span></p></td></tr><tr><td align=3D"ce=
nter" valign=3D"top" style=3D"padding-bottom:14px;padding-left:15px;padding=
-right:15px;padding-top:14px;text-align:center;width:100%;word-break:break-=
word;" class=3D"dd"><table role=3D"none" border=3D"0" cellspacing=3D"0" cel=
lpadding=3D"0" align=3D"center"><tr><td class=3D"v" align=3D"center" valign=
=3D"middle" height=3D"42" style=3D"height:42px;"><a href=3D"https://link.ma=
il.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad3vONXJ1I=
zhwhLChX2LjQZMNlzyiMeXYZDILNhcsZ0mp8jtYcACUlE_s7c2h2LDr5OugDzqHEQpmKfsArCDw=
9beaY-isjFOSnicBCLAc9eEboYPXwSG4OYNP9jwRrwyzLNvRN1PU7tV4qrSsO0uMpBjrZ5EZXqA=
0zyLHIFPleOvOg/45q/673Y7OoOTMC-peplzn6Igg/h13/h001.9Me8zRocASXhuRIxtWuhD3W1=
hzWSIZEjDOR_A6SvZqE" target=3D"_blank" rel=3D"noopener noreferrer nofollow"=
 style=3D"color:#155d9e;font-size:16px;padding:0px 14px;text-decoration:non=
e;"> Read more </a></td></tr></table></td></tr></table></td></tr></table></=
td></tr><tr><td><table id=3D"ws11" role=3D"none" width=3D"100%" border=3D"0=
" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"transpa=
rent" style=3D"background-color:transparent;padding:0px 0px 0px 0px;"><tabl=
e role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0"><tr><td class=3D"dd" align=3D"center" valign=3D"top" style=3D"paddin=
g:0px 15px;text-align:center;"><h1><span style=3D"">WS11. Attract and train=
 European technicians in Energy Transition</span></h1></td></tr><tr><td cla=
ss=3D"dd" align=3D"center" style=3D"padding:0px 15px;text-align:center;word=
-break:break-word;"><p><span style=3D"">In Europe, the shift towards sustai=
nable energy faces a chagenge: a shortage of skilled technicians. Studies s=
how a need for maintenance and operational experts, with around 1.5 million=
 individuals requiring training yearly. For this reasson, a workshop, build=
ing upon the Erasmus+ GreenTech project (2022-2024) focusing on renewable e=
nergy training, seeks to exchange insights and best practices.</span></p></=
td></tr><tr><td class=3D"dd" align=3D"center" style=3D"padding:0px 15px;tex=
t-align:center;word-break:break-word;"><p><span style=3D"">Core discussions=
 revolve around improving training attractivity understanding industry dema=
nds, evaluating current and future training schemes, and spreading practica=
l courses. The workshop aims to promote collaboration on regional, national=
, and international levels to tackle Europe&#39;s technician deficit and ac=
hieve carbon neutrality and energy transition.</span></p></td></tr><tr><td =
align=3D"center" valign=3D"top" style=3D"padding-bottom:14px;padding-left:1=
5px;padding-right:15px;padding-top:14px;text-align:center;width:100%;word-b=
reak:break-word;" class=3D"dd"><table role=3D"none" border=3D"0" cellspacin=
g=3D"0" cellpadding=3D"0" align=3D"center"><tr><td class=3D"v" align=3D"cen=
ter" valign=3D"middle" height=3D"42" style=3D"height:42px;"><a href=3D"http=
s://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrp=
Iad0BQ1dc2LHWElEAyyRiasAD25-ZEt02kBowHMwRv1giuLX4JWQJec27vhiVgJnaqWi5r0qItZ=
LMpsmhWLCr-8Nn1VtbjmtbR5g0rof0Ogu12TgxkizR9OAd9BsUU23M9uaFVXVRmkcfgAamOZi1-=
T9Q6TK6wyO5VOVRejuQuXzYbQ/45q/673Y7OoOTMC-peplzn6Igg/h14/h001.9VWkVErgYGF0Q=
GZAiDXdCeBkTPltzbph1-sjlNCJq9E" target=3D"_blank" rel=3D"noopener noreferre=
r nofollow" style=3D"color:#155d9e;font-size:16px;padding:0px 14px;text-dec=
oration:none;"> Read more </a></td></tr></table></td></tr></table></td></tr=
></table></td></tr><tr><td><table id=3D"ws12" role=3D"none" width=3D"100%" =
border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=
=3D"#EFF2F7" style=3D"background-color:#EFF2F7;padding:0px 0px 0px 0px;"><t=
able role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpaddin=
g=3D"0"><tr><td class=3D"dd" align=3D"center" valign=3D"top" style=3D"paddi=
ng:0px 15px;text-align:center;"><h1><span style=3D"">WS12. Transforming Sus=
tainable Energy Education (TranSEED)</span></h1></td></tr><tr><td class=3D"=
dd" align=3D"center" style=3D"padding:0px 15px;text-align:center;word-break=
:break-word;"><p><span style=3D"color:rgb(0, 0, 0);">In this workshop we in=
vite you to experience a technology demonstration and subsequently help us =
to transform traditional mono-disciplinary technology education into transd=
isciplinary and multilevel challenge-based education. You will gain insight=
s in two interesting technology applications and will have the opportunity =
to enrich your and our perspectives on transdisciplinary, multilevel and ch=
allenge-based education.</span></p></td></tr><tr><td align=3D"center" valig=
n=3D"top" style=3D"padding-bottom:14px;padding-left:15px;padding-right:15px=
;padding-top:14px;text-align:center;width:100%;word-break:break-word;" clas=
s=3D"dd"><table role=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D=
"0" align=3D"center"><tr><td class=3D"v" align=3D"center" valign=3D"middle"=
 height=3D"42" style=3D"height:42px;"><a href=3D"https://link.mail.beehiiv.=
com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad03s2UdVRXT4QYQ5oyiT=
S0r5NIXzkEovPwF4kJ_yJj7YHIQaWcsf5aI75SHp5kcbFtCFBrvXgR3MZk7-98v2gJdtA0OeXsL=
PAj65s7AcSu-QbuD5O5oBB2KYBWoLpUXYT1UwBa_F4Br5ruZ3i6qszCsPFkJ98wVx1bjBqPu7wq=
6uA/45q/673Y7OoOTMC-peplzn6Igg/h15/h001.HAfiEqmrKEwDAf5645YA1NSNUMfp3m1SGL1=
-msNt-d4" target=3D"_blank" rel=3D"noopener noreferrer nofollow" style=3D"c=
olor:#155d9e;font-size:16px;padding:0px 14px;text-decoration:none;"> Read m=
ore </a></td></tr></table></td></tr></table></td></tr></table></td></tr><tr=
><td><table id=3D"ws13" role=3D"none" width=3D"100%" border=3D"0" cellspaci=
ng=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"transparent" style=
=3D"background-color:transparent;padding:0px 0px 0px 0px;"><table role=3D"n=
one" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><t=
d class=3D"dd" align=3D"center" valign=3D"top" style=3D"padding:0px 15px;te=
xt-align:center;"><h1><span style=3D"">WS13. Applied and Innovative Researc=
h within VET Education for the Energy transition</span></h1></td></tr><tr><=
td class=3D"dd" align=3D"center" style=3D"padding:0px 15px;text-align:cente=
r;word-break:break-word;"><p><span style=3D"color:rgb(0, 0, 0);">Research l=
earning to enhance innovation in cooperation with SME, industries and vocat=
ion training facilitators is a crucial way for the sustainable and digital =
transformation in all areas of the society. One of the outcomes of the AIRi=
nVET Project (</span><span style=3D"color:rgb(0, 0, 0);"><a class=3D"link" =
href=3D"https://link.mail.beehiiv.com/ss/c/u001.o98ZmFoeX17ibF2OqvnWIxI6P7j=
eHjZhoDGFpIirc_yAZ4cKTVW7zgBY7YhSm1O0I5vIhcaaOEUBAgiae_KiIhOzKHWR3Z795sOq7L=
kQrZaLBteEl6vb85IreTZ_tC96US6B2HiJZtEPWCR9SlzXNB-x9TSMXiLa-ZdT5YA1TpsAJbbCL=
sYbGO4uQ2l5zIZc/45q/673Y7OoOTMC-peplzn6Igg/h16/h001.7Yth0NY9mIGB6hCekjuk2oH=
r6GzVisiDdcPEkEsc6x8" target=3D"_blank" rel=3D"noopener noreferrer nofollow=
"><span>https://airnvet.eu</span></a></span><span style=3D"color:rgb(0, 0, =
0);">) is a mapping of applied research activities in vocational education =
and Training. The workshop will show and discuss approaches as well as resu=
lts of the AIRinVET Project and give best practice from Germany and The Net=
herlands on how to design cooperative curricula and research learning progr=
ams with the private sector for a successful implementation of sustainable =
energy education.</span></p></td></tr><tr><td align=3D"center" valign=3D"to=
p" style=3D"padding-bottom:14px;padding-left:15px;padding-right:15px;paddin=
g-top:14px;text-align:center;width:100%;word-break:break-word;" class=3D"dd=
"><table role=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" ali=
gn=3D"center"><tr><td class=3D"v" align=3D"center" valign=3D"middle" height=
=3D"42" style=3D"height:42px;"><a href=3D"https://link.mail.beehiiv.com/ss/=
c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad0OGvyvqDFNShBzjBgWsnOtMcy-=
EeLw1HIlO7CV4zPpndTr6R0wi0SlJt_mcRYiXCfLNiZxRM9OaN-GjWs7hOndqLmH76iBaWedmAT=
bnPlZlzV9qxLVp_Q92KS61WmI_5ayXFn7ZszoY6C-puGLJcvsZ72t_h_BtsqrDVcOF_Srug/45q=
/673Y7OoOTMC-peplzn6Igg/h17/h001.OFoUXF7g8zCyfv-iOXJhLX44myGfc32Gtt5Y7MccW7=
E" target=3D"_blank" rel=3D"noopener noreferrer nofollow" style=3D"color:#1=
55d9e;font-size:16px;padding:0px 14px;text-decoration:none;"> Read more </a=
></td></tr></table></td></tr></table></td></tr></table></td></tr><tr><td><t=
able id=3D"ws14" role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0=
" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"backgro=
und-color:#EFF2F7;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"1=
00%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" =
align=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-align:center=
;"><h1><span style=3D"">WS14. H2 VIRTUAL TRAINING</span></h1></td></tr><tr>=
<td class=3D"dd" align=3D"center" style=3D"padding:0px 15px;text-align:cent=
er;word-break:break-word;"><p><span style=3D"color:rgb(0, 0, 0);">H2 VIRTUA=
L TRAINING is a digital training program developed at the University of Tou=
louse which addresses safety issues during maintenance operations on hydrog=
en vehicles</span></p></td></tr><tr><td align=3D"center" valign=3D"top" sty=
le=3D"padding-bottom:14px;padding-left:15px;padding-right:15px;padding-top:=
14px;text-align:center;width:100%;word-break:break-word;" class=3D"dd"><tab=
le role=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"=
center"><tr><td class=3D"v" align=3D"center" valign=3D"middle" height=3D"42=
" style=3D"height:42px;"><a href=3D"https://link.mail.beehiiv.com/ss/c/u001=
.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad3QFxjMtK0Pmim-MW4teUJMcsSGuwfZvr=
IggR1Z-TXl5isD-KnK_xT8UhfwDXIreaPiUH8XFKQEIXEeQwYlcXmnSQyYfnAggg4JyQvXaimSH=
1P2hoOyNSvCoL0gmjenKZyGYD80iI0h9xr9yApdRQ1PvvlztZ8CN_xyGnWwHaajxw/45q/673Y7=
OoOTMC-peplzn6Igg/h18/h001.XYXf2J9lHf4YDy1yax2F6F5Tkwtr_Dq0HSg-tjqQmZk" tar=
get=3D"_blank" rel=3D"noopener noreferrer nofollow" style=3D"color:#155d9e;=
font-size:16px;padding:0px 14px;text-decoration:none;"> Read more </a></td>=
</tr></table></td></tr></table></td></tr></table></td></tr><tr><td><table i=
d=3D"ws15" role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cell=
padding=3D"0" style=3D""><tr><td bgcolor=3D"transparent" style=3D"backgroun=
d-color:transparent;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D=
"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd=
" align=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-align:cent=
er;"><h1><span style=3D"">WS15. Facilitating upliftings in solar energy sto=
rage (FUSES)</span></h1></td></tr><tr><td class=3D"dd" align=3D"center" sty=
le=3D"padding:0px 15px;text-align:center;word-break:break-word;"><p><span s=
tyle=3D"">The workshop is designed to be dynamic and interactive, offering =
participants a comprehensive learning experience in the field of solar ener=
gy storage. The session commences with an introductory overview of Ampere E=
nergy products, which optimize the solar self-consumption and maximize savi=
ngs on the electricity bill.</span></p></td></tr><tr><td class=3D"dd" align=
=3D"center" style=3D"padding:0px 15px;text-align:center;word-break:break-wo=
rd;"><p><span style=3D"">Next, there is a specific focus on the algorithmic=
s of the Smart Energy Management System to transition into a presentation o=
f real-world successful solar self-consumption case studies. Installations =
that incorporate PV panels and smart batteries are presented in residential=
, industrial, and energy communities locations that have achieved remarkabl=
e economic, ecological and grid energy savings.</span></p></td></tr><tr><td=
 align=3D"center" valign=3D"top" style=3D"padding-bottom:14px;padding-left:=
15px;padding-right:15px;padding-top:14px;text-align:center;width:100%;word-=
break:break-word;" class=3D"dd"><table role=3D"none" border=3D"0" cellspaci=
ng=3D"0" cellpadding=3D"0" align=3D"center"><tr><td class=3D"v" align=3D"ce=
nter" valign=3D"middle" height=3D"42" style=3D"height:42px;"><a href=3D"htt=
ps://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFr=
pIad3vYVr6HfdpfBeDZOZfgHzCXq5p60xQoA20xZrmCF7pvYBRihuXEAMcCWiwln-tzHhircOQ3=
LZNplvbaJGNQw67zK7sfs8GlWhPVVWQ8lUq-3QtDtcwIsvx1LOmnVFLseCZ9yowkpOiD6suQWLK=
Xi5DhS9SHLtqNgVx3mGvvSJaSw/45q/673Y7OoOTMC-peplzn6Igg/h19/h001.o_1uV0iCGtlf=
4sX1k1dHV6xz5sjVGkXWmJC0ioDzakc" target=3D"_blank" rel=3D"noopener noreferr=
er nofollow" style=3D"color:#155d9e;font-size:16px;padding:0px 14px;text-de=
coration:none;"> Read more </a></td></tr></table></td></tr></table></td></t=
r></table></td></tr><tr><td><table id=3D"ws16" role=3D"none" width=3D"100%"=
 border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolo=
r=3D"#EFF2F7" style=3D"background-color:#EFF2F7;padding:0px 0px 0px 0px;"><=
table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpaddi=
ng=3D"0"><tr><td class=3D"dd" align=3D"center" valign=3D"top" style=3D"padd=
ing:0px 15px;text-align:center;"><h1><span style=3D"">WS16. Challenges of I=
nternational Master Degree Courses in Renewable Energy Systems</span></h1><=
/td></tr><tr><td class=3D"dd" align=3D"center" style=3D"padding:0px 15px;te=
xt-align:center;word-break:break-word;"><p><span style=3D"color:rgb(0, 0, 0=
);">Many universities worldwide offer Master degree courses in renewable en=
ergy systems. As English has become the generally accepted language in a gl=
obalized world, courses being taught in English are attended by students co=
ming from all over the world. Although we live in a globalized world and th=
e international Master degree is a product representing it, not necessarily=
 there are valid global energy solutions. The aim of the proposed workshop =
is to shed light on the technical challenges of these Master courses and fi=
nd solutions which suit teachers and students alike.</span></p></td></tr><t=
r><td align=3D"center" valign=3D"top" style=3D"padding-bottom:14px;padding-=
left:15px;padding-right:15px;padding-top:14px;text-align:center;width:100%;=
word-break:break-word;" class=3D"dd"><table role=3D"none" border=3D"0" cell=
spacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td class=3D"v" align=
=3D"center" valign=3D"middle" height=3D"42" style=3D"height:42px;"><a href=
=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9=
u8hVzFrpIad3fXOkr4GgB-7XO21rmThoJGJ4X-n3S2CrJ-MpGpRKu7vf8YLrwyZwJRzHcGf2gmd=
kmELBQ8UtwoHQboQTPkEXZAX6UxUhEex6oNtbIedumn2oL46Kj4a239llgG--v-BbCoxJrLkyf7=
ZdKFGsYrj4Ej2lPqOEROILTb27Vmip_mw/45q/673Y7OoOTMC-peplzn6Igg/h20/h001.NGAR2=
I1He8ghogJ8XrqPnC1FOE6K7A97cVLspwhAPZI" target=3D"_blank" rel=3D"noopener n=
oreferrer nofollow" style=3D"color:#155d9e;font-size:16px;padding:0px 14px;=
text-decoration:none;"> Read more </a></td></tr></table></td></tr></table><=
/td></tr></table></td></tr><tr><td><table id=3D"ws17" role=3D"none" width=
=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><=
td bgcolor=3D"transparent" style=3D"background-color:transparent;padding:0p=
x 0px 0px 0px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacin=
g=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=3D"center" valign=3D"t=
op" style=3D"padding:0px 15px;text-align:center;"><h1><span style=3D"">WS17=
. Explore integration of sustainability in education from a reflexive, SDG =
and entrepreneurship perspective</span></h1></td></tr><tr><td class=3D"dd" =
align=3D"center" style=3D"padding:0px 15px;text-align:center;word-break:bre=
ak-word;"><p><span style=3D"color:rgb(0, 0, 0);">In this inspirational work=
shop you will explore three approaches to integrate sustainability in educa=
tion from three perspectives: reflexive, SDGs in education and the relevanc=
e of entrepreneurial skills. You will review the three approaches and find =
out how you can apply the three different perspectives to your own educatio=
n or in your institute.</span></p></td></tr><tr><td align=3D"center" valign=
=3D"top" style=3D"padding-bottom:14px;padding-left:15px;padding-right:15px;=
padding-top:14px;text-align:center;width:100%;word-break:break-word;" class=
=3D"dd"><table role=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"=
0" align=3D"center"><tr><td class=3D"v" align=3D"center" valign=3D"middle" =
height=3D"42" style=3D"height:42px;"><a href=3D"https://link.mail.beehiiv.c=
om/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad1AX2yZzg6Bk7H9sSPBu-=
tnnwL1bWuMiWMzvIIvUVAexk6p4FYftz-dua3PbTTpTuF0JzD2__b595Xd_8HnW6n0l7ovounhZ=
Seg-mXY_GQ0Hgc5FY_GJan3HRd2iHAmBwWvNH9UOY29fgor-TkT0wJQhYW-UDXrXXr42QEoLWky=
UQ/45q/673Y7OoOTMC-peplzn6Igg/h21/h001.RFvDysnnYzLBUN3BtLCYqwspishkzO-VkvAf=
2vW5E6U" target=3D"_blank" rel=3D"noopener noreferrer nofollow" style=3D"co=
lor:#155d9e;font-size:16px;padding:0px 14px;text-decoration:none;"> Read mo=
re </a></td></tr></table></td></tr></table></td></tr></table></td></tr><tr>=
<td><table id=3D"ws18" role=3D"none" width=3D"100%" border=3D"0" cellspacin=
g=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"b=
ackground-color:#EFF2F7;padding:0px 0px 0px 0px;"><table role=3D"none" widt=
h=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=
=3D"dd" align=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-alig=
n:center;"><h1><span style=3D"">WS18. Accelerate matchmaking in a network: =
what can we learn from trees and computers?</span></h1></td></tr><tr><td cl=
ass=3D"dd" align=3D"center" style=3D"padding:0px 15px;text-align:center;wor=
d-break:break-word;"><p><span style=3D"">Experience the strength of network=
s in solving needs and demands on multiple themes outside and inside the ma=
in theme of cooperation.</span></p></td></tr><tr><td style=3D"padding-botto=
m:12px;padding-left:37px;padding-right:27px;padding-top:12px;" class=3D"ee"=
><div style=3D"margin-left:0px;" class=3D"edm_outlooklist"><ul style=3D"lis=
t-style-type:disc;margin:0px 0px;padding:0px 0px 0px 0px;"><li class=3D"lis=
tItem ultext"><p style=3D"padding:0px;text-align:left;word-break:break-word=
;"><span style=3D"">Build on your skills to be effective in cooperation wit=
h colleagues and peer professionals.</span></p></li><li class=3D"listItem u=
ltext"><p style=3D"padding:0px;text-align:left;word-break:break-word;"><spa=
n style=3D"">Experience how to be effective in expressing your needs, talen=
ts and propositions inspired by examples in nature and IT technology.</span=
></p></li><li class=3D"listItem ultext"><p style=3D"padding:0px;text-align:=
left;word-break:break-word;"><span style=3D"">Experience how to evaluate va=
lue propositions on their effective communication approaches.</span></p></l=
i><li class=3D"listItem ultext"><p style=3D"padding:0px;text-align:left;wor=
d-break:break-word;"><span style=3D"">Experience the power of connections o=
n a personal level within the professional arena.</span></p></li></ul></div=
></td></tr><tr><td align=3D"center" valign=3D"top" style=3D"padding-bottom:=
14px;padding-left:15px;padding-right:15px;padding-top:14px;text-align:cente=
r;width:100%;word-break:break-word;" class=3D"dd"><table role=3D"none" bord=
er=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td class=
=3D"v" align=3D"center" valign=3D"middle" height=3D"42" style=3D"height:42p=
x;"><a href=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUC=
EtII-f83mS9u8hVzFrpIad38d6CKfeFKQMZHtfRVVnTPkLgA3SKEpOsSWe12pq0gduL_quILhro=
ca11oUMv1CB0O3NqAPhAl7A2STgUzp-0UUKgsWCzVyDlHpGWpBa8j3AEzxoCXQhxKucxSnzGBwC=
R6dEEaVfUaOvcib7rjh0we4-xOd3le5NUft5fqMWfTrg/45q/673Y7OoOTMC-peplzn6Igg/h22=
/h001.9q6EFoBXmkfWTX5e-X8kebGNACNxyqGZUJenL54YmMw" target=3D"_blank" rel=3D=
"noopener noreferrer nofollow" style=3D"color:#155d9e;font-size:16px;paddin=
g:0px 14px;text-decoration:none;"> Read more </a></td></tr></table></td></t=
r></table></td></tr></table></td></tr><tr><td class=3D"dd" align=3D"left" s=
tyle=3D"padding:0px 15px;text-align:left;word-break:break-word;"><p></p></t=
d></tr></table></td></tr><tr><td class=3D"b" align=3D"center" valign=3D"top=
" bgcolor=3D"#438ac9" style=3D"padding:0px;border-bottom-left-radius:10px;b=
order-bottom-right-radius:10px;"><table role=3D"none" width=3D"100%" border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td align=
=3D"center" valign=3D"top" bgcolor=3D"#fbbb16" style=3D"padding:12px"><tabl=
e role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" align=3D"center"><tr><td><span style=3D"padding-left:1px;"></span></=
td><td align=3D"center" valign=3D"middle" width=3D"75" style=3D"width:75px;=
"><a href=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEr=
wqFgNAb4LwukZDHa9syLjlXR5k_hL4aVj-QsuNNcaTrW9X-OCZytN_rlLxGmtarJrPihUsOEYG6=
CzoujJeg8gJwmabIzRDd80oSc3RYFJ7T1znJuBpfBPfTT-WD02VKKxIrgpfIMC9-QJtTq-kY9mF=
S4h67bDL_SP68WxGrLL3zjtKHD2_mG-FoNsDQojjsw/45q/673Y7OoOTMC-peplzn6Igg/h23/h=
001.BT4YLAbFbD-yRE02tqXqlH7REsupw0fmv1WoJqCi3Xg" style=3D"text-decoration:n=
one;"><img width=3D"22" alt=3D"fb" border=3D"0" style=3D"display:block;max-=
width:22px;" src=3D"https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-dow=
n,format=3Dauto,onerror=3Dredirect,quality=3D80/static_assets/facebook_ligh=
t.png"/></a></td><td align=3D"center" valign=3D"middle" width=3D"75" style=
=3D"width:75px;"><a href=3D"https://link.mail.beehiiv.com/ss/c/u001.DkovfOe=
42zeF8J2PGc-l9JWeF4Fr-3YAtmHtZ2Sv9HWS82eIFxttnHWrIIQXrZT6ByPO9IaiKIb6411H-Y=
1F-xyZ_4h5YgpQ3H-yLh09RU6dbr-kgaHQmZgGeq_2XPiG0E5j02gLVyKm8dfBSZ7QQL0Xy_RG-=
r4TPmZwWrf84TXd_jmaFyIrFTPwo9rbYNAW5luZ9DqeN36wDQcWOMqHuuvsJWgGMfNGPVYCIUcP=
FfNuQCPOOSSqjwg644g5q0LQ/45q/673Y7OoOTMC-peplzn6Igg/h24/h001.rJAFAfRsyvHT8a=
VhWHFoILWYzxJsrPNI1UDdFlIFr48" style=3D"text-decoration:none;"><img width=
=3D"22" alt=3D"tw" border=3D"0" style=3D"display:block;max-width:22px;" src=
=3D"https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,format=3Dauto,=
onerror=3Dredirect,quality=3D80/static_assets/x_light.png"/></a></td><td al=
ign=3D"center" valign=3D"middle" width=3D"75" style=3D"width:75px;"><a href=
=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEgQL3fCPI0U=
GohOuyW2ouphYybemeBB4ZMDoBTQY0JS0bHFoVLDfCyK6TRiAhZmKE6XTaXy-999lEhk2imgQvO=
uzPswMMxEn0-Ae0fy6E7YW3KwXYEOfSdQS_wIVUWzHj5I41vyJKDDIExM4w_OPd40H9qGi5yATl=
AI-PBaXMc8COoeUlRQZzypy4dKKamX2xA/45q/673Y7OoOTMC-peplzn6Igg/h25/h001.BxTYn=
Sdc5rJeuAolVv3VPsO0S_VVzIlmD4AKG4xjsJk" style=3D"text-decoration:none;"><im=
g width=3D"22" alt=3D"ig" border=3D"0" style=3D"display:block;max-width:22p=
x;" src=3D"https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,format=
=3Dauto,onerror=3Dredirect,quality=3D80/static_assets/instagram_light.png"/=
></a></td><td align=3D"center" valign=3D"middle" width=3D"75" style=3D"widt=
h:75px;"><a href=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0=
InFUCEm2dDc-sVKPd-Sw1-4Z05tGknkZ8i31iC4ZoYOXs_yCE1KJniN4EfcFzIiiGROI_JwEUnQ=
0pN4BlSU7SPgGWrNSbLvNcLsCNrWQ3wikzNdA6HfwYwAPSLNtwtwIC-dx8CbuGIPn-NhWmo1zut=
t916G9mhs302RkyNoeApon7PMJU0eTsIeu2o6mqgRJbbv7NmYYv9ijLDu920wiCYDUsCT8/45q/=
673Y7OoOTMC-peplzn6Igg/h26/h001.0Hgzy6ZtfrnjkcjNxkydLWni8gv6VoPowyo2mHMQyZE=
" style=3D"text-decoration:none;"><img width=3D"22" alt=3D"in" border=3D"0"=
 style=3D"display:block;max-width:22px;" src=3D"https://media.beehiiv.com/c=
dn-cgi/image/fit=3Dscale-down,format=3Dauto,onerror=3Dredirect,quality=3D80=
/static_assets/linkedin_light.png"/></a></td><td><span style=3D"padding-lef=
t:1px;"></span></td></tr></table></td></tr><tr><td height=3D"10" style=3D"l=
ine-height:1px;font-size:1px;height:10px;"> &nbsp; </td></tr><tr><td class=
=3D"w" align=3D"center" valign=3D"top" style=3D"padding:15px;"><table role=
=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" a=
lign=3D"center"><tr><td align=3D"center" valign=3D"top"><p style=3D"font-fa=
mily:'Arial',Helvetica,sans-serif;color:#FFFFFF!important;"> Update your em=
ail preferences or unsubscribe <a class=3D"link" href=3D"https://link.mail.=
beehiiv.com/ss/c/u001.ja41VZAtR_qfVYIA2l6dByPcgm40JQbxLouneWPj9NO-QaAKU5v3U=
ihq7_J7Kxc8CRkPHlRsPxG4L_kuCxBsVGrbkPKGltLEZdYurEEZe0ohH7Q9oOYjXpBsdF9f1Xjr=
N0F-xqwnBuAa_i-kaVYEO8cjZBYqwQ4e-miYY71Jp8OeJgYufeIfrl_zx4W_rYgY0okLgfu1_1v=
2v9TMl97LzsneREPT0jDNl6sOPcgsk0JfCX42P0Himnib21HR6vqBQGr-FoR5CL51U6hXzufMsr=
2DWGXQYGgA4YgDSy1yeQuAQqlQlvVRvoIQWV3-PfZk-qa9QX7XyRb1qWIAYX6pREeMnWVgCiifr=
DFGNgxumeVaeVGNLfHkEyUL650SpzOIvYgiLWwuAuhH_4UtJaw-vPzAbBFcEIu36tKe595MvRNp=
BknOo3MR8M_vCudR-ikN4RVWWXj6uYXgtnINJDffzCz5KVfqFP8nOWEW_DD0rxARDrsWqzVFdv-=
FfepWCDTT_2XAVt4mu_ZW7UeQeDQ99PEkIGgBMtJu0Pb9wajydKf39TFyRVDZiVuoH9AtQRYWkG=
xsYMvzYZ7-s6ZjjpyfQ_YlbZAaP79kDk8Ns8fk6aFQorhsBu_RsffHZVXZtaiB3xLCkIVg3Fni9=
frXIkLfSWdvEfFVqxq2SCFyzh1aU00_8iYHcAFTURukfOgky6BPvy2lSDQw9k8qO3kdBt__Nw/4=
5q/673Y7OoOTMC-peplzn6Igg/h27/h001.EW_JN2CUJH2GKSzG5E7m2gs-2N63KOZ8pttd6voh=
EKs" style=3D"text-decoration:underline;text-decoration-color:#FFFFFF!impor=
tant;color:#FFFFFF!important;"> here</a></p><p class=3D"copyright" style=3D=
"font-family:'Arial',Helvetica,sans-serif;color:#FFFFFF!important;"> &copy;=
 2024 SEED Conference 2024 - Valencia </p><p style=3D"font-family:'Arial',H=
elvetica,sans-serif;color:#FFFFFF!important;"> Universitat Polit=C3=A8cnica=
 de Val=C3=A8ncia Camino de Vera<br>Valencia, Comunidad Valenciana 46022 , =
Spain </p></td></tr><tr style=3D"display: table-row !important;"><td align=
=3D"center" valign=3D"top" style=3D"padding-top:20px;" style=3D"display:tab=
le-cell !important;"><table role=3D"none" border=3D"0" cellspacing=3D"0" ce=
llpadding=3D"0" align=3D"center" style=3D"display:table !important;"><tr st=
yle=3D"display:table-row !important;"><td class=3D"u" align=3D"center" vali=
gn=3D"middle" height=3D"32" style=3D"height:32px;display:table-cell !import=
ant; max-height: 32px !important;margin:0px !important;"><a style=3D"line-h=
eight:32px !important;text-decoration:none;display:block !important;" href=
=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEjmoJcSnOYa=
aJNeZkZa1HU2RZacsw34amF4ZOvNGw-1HPkc9i_22XpLCt7fsjo1g88LyyhmWFydraPKMurXgI-=
7fqqpNuB5tbUuylk54Z0RDJxyZwyOIxDItp1YEu-iP0YM1KwcWFdHD51cImU-1IQDiDgKfISiZk=
f-PDMQE0phJ4Qxxva0mbbR2H93_OwKcQg/45q/673Y7OoOTMC-peplzn6Igg/h28/h001.JSINC=
S9LIPqwFXubDPbzuwLznaKqef_9PE66ro_oWrQ"><img src=3D"https://media.beehiiv.c=
om/output-onlinepngtools.png" width=3D"16" alt=3D"beehiiv logo" style=3D"di=
splay:inline-block !important;max-width:16px !important; vertical-align:-3p=
x !important;width: 16px !important;" border=3D"0"/><span style=3D"padding-=
left:11px !important;display: inline-block !important;">Powered by beehiiv<=
/span></a></td></tr></table></td></tr></table></td></tr></table></td></tr><=
/table></td></tr></table></td></tr></table></td></tr></table></div></body><=
/html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/EqOXcTjNRxiUVNUgwbyc1w%40geopod-ismtpd-13?utm_medi=
um=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailhouse=
-dev/EqOXcTjNRxiUVNUgwbyc1w%40geopod-ismtpd-13</a>.<br />

--1e7f5921563e81fe116f0acd0eaa30ea7f87231cb578f9fc2a26e95a895a--
