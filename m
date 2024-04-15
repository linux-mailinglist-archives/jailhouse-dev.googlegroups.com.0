Return-Path: <jailhouse-dev+bncBCDLVQP2RIKBBH4U6SYAMGQENXCKW7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x63c.google.com (mail-pl1-x63c.google.com [IPv6:2607:f8b0:4864:20::63c])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C0B8A4D4D
	for <lists+jailhouse-dev@lfdr.de>; Mon, 15 Apr 2024 13:06:10 +0200 (CEST)
Received: by mail-pl1-x63c.google.com with SMTP id d9443c01a7336-1e417e43c13sf37156345ad.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 15 Apr 2024 04:06:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1713179169; cv=pass;
        d=google.com; s=arc-20160816;
        b=oMpFEP6RgwJ4KWogO+9srl/SaE3Ca6p6McXD+OyCNiXzJu/qmW574adqtLIUNdflX2
         WGvMB2EEuzncneCtSP4KhCLz9qwSKlW2gRFoA8/XfQ7fjqP4Hw2LPMQpDwUfX7B/Sh9M
         thJxbrcurFLDVhQIg9wwAZrTmYm7XBP8YxcQ6tXtATn6qSJuC1ilXbDRJYpVueMlvJdS
         rhbuuWIJSD552ymUpdT2VG0Rjld3UbWAp0xsmfPmnLk5V4wzM/+hFbUxbY8uqcGZ2u0Q
         +WuiVbCYFQ7tgmvkY0xr6zGKB/pcontWO3WdHcivCriXkAz/a/NIoTWt6AwjQ+fY2JxF
         V4cg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:to:sid:list-unsubscribe:feedback-id
         :reply-to:subject:message-id:mime-version:from:date:dkim-signature;
        bh=S+t5O/SbRFoYYC+7T/Ir4jl7F2Ygnh441pw3OTxjFgU=;
        fh=ATNrkqXPhHpKV5XyNRXiiYPuIpvXApvm6CMd/6pBBHk=;
        b=WKi55uz3G0Tb2kTzQprp7rTKnSGkOa+0twK4ZCHyRJutBreqflvoKwox9n4gdQqc6G
         5OAJSO5RujbhUECTwi4FEKUy3VKaaotoP7LGoAmbR0ruOzhbe6mmHnXHm6xCHnxdYahV
         jBEbwBE5YjgC3hHCUeG0N9h73V3UyJFYbw3hCG2hfc5aHgaC7yy4uC6fYXnV5E2qnV6r
         8A1fC16t2xuFDTlVSghB0pghm/BSuuZeFLJQvwlnTAEaKqdlYc7yymlt0A1SRfUxTO4B
         ow5Xydoo7n0UwxXXO4htUmkimF/oS/akbEwj/Le2eb1YyQnB5+Ga82/c9V0JOTW0+g0Y
         QnYQ==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@mail.beehiiv.com header.s=s1 header.b=hh2cFwiy;
       spf=pass (google.com: domain of bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com designates 149.72.163.231 as permitted sender) smtp.mailfrom="bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=beehiiv.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1713179169; x=1713783969; darn=lfdr.de;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:sid:list-unsubscribe:feedback-id:reply-to
         :subject:message-id:mime-version:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+t5O/SbRFoYYC+7T/Ir4jl7F2Ygnh441pw3OTxjFgU=;
        b=IAMLBWHPvS86M4h5WlkMpeeBaj5tDXoOqUBDP/X9SSM7OXTrmjfNjUzEtLBAaMcEdj
         LAk9FWZsSvJYwKHX5/Sd+2zmE658Sx6SW1Y6dDTBDfWlJbuozhYNyuRByDmO0Kt5L2gC
         dyOVuV3+IiOgB9ZIIjkgVjcDroXUrP6DBMgoFqei6bEdKGE26F0Ti848SSDFLDytq0GI
         lXFTirJVVY84kZ6g3cwI3sClGi7b8sXSGvGtiqvYVKXHc4aJ3gRIXPg/XskCUpLzUfln
         pPAOlDQFaLHjx+jMfzJEVrbkhT8fGHuq+ZFsaCxG9nEfWp0wiefIlCwkFYfhjF00dlvN
         mjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713179169; x=1713783969;
        h=list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:to:sid
         :list-unsubscribe:feedback-id:reply-to:subject:message-id
         :mime-version:from:date:x-beenthere:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S+t5O/SbRFoYYC+7T/Ir4jl7F2Ygnh441pw3OTxjFgU=;
        b=c35rGdA6AqSQecxIhr945axphqYBpOdWMen+ZKrEvJRfwwQO5w3QMdu+LgYixEEnj9
         Qqhos3ucoTL4tExcmcCAjIn8I0amuggAdH0D1yJuXjVZ3Mlo4xMAZkm+I4gTfKYGpaP1
         2YtC0Dp8utgjsoNyZSFMcTg0n8RL/+Vmr746b9zRN9XP6m6vLPErsLCetLJB4BzJWAxx
         jCRC3D+21JxVnR7q8KWCPWBR+zHYafbsgpvaSt8Fkk/EGR53h6dAFBDVZ1wg69UqFAaB
         KqeumOf9mu34sAYKHPkA/vQhyAsMaqp7ssSbEINhyZs7UzZuiVW6KRakjIqlMtXCUDmq
         9duw==
X-Forwarded-Encrypted: i=2; AJvYcCU2Ttpl9+TIEtZRBipH1Z2xR18ukTLThVJUydt9027X5f+v1Nl27kbPQEsPrDp4xGtCPnI2hB39EwZwQd19m2c4PB8HfPkcTTUEIEk=
X-Gm-Message-State: AOJu0Yw7YnKt5ZgHST8rirFpqcU4Zo02pauFyXUS+3uFqV3oFViWXQaq
	1WC96NBSMVMAUiW1hDlXgke338+k7uUh2v3A1Vn8CbdLI4QgZFEK
X-Google-Smtp-Source: AGHT+IHNlrZuigQTMe/Az/IsHOY2wiP2yipvKBcKDaEVtPUEPZKt+fo/Uip0g9WihZx3nyrlPaQNCw==
X-Received: by 2002:a17:903:1206:b0:1e6:766c:6a26 with SMTP id l6-20020a170903120600b001e6766c6a26mr2908979plh.12.1713179168699;
        Mon, 15 Apr 2024 04:06:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:903:2303:b0:1e2:306e:bcec with SMTP id
 d3-20020a170903230300b001e2306ebcecls1092985plh.0.-pod-prod-03-us; Mon, 15
 Apr 2024 04:06:07 -0700 (PDT)
X-Received: by 2002:a17:902:a3cc:b0:1e5:caba:7fbd with SMTP id q12-20020a170902a3cc00b001e5caba7fbdmr9273141plb.44.1713179166850;
        Mon, 15 Apr 2024 04:06:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713179166; cv=none;
        d=google.com; s=arc-20160816;
        b=EugTGjwNzTZFUhqC6ac4/ZEa0HskpVPN+rNzZ9I0a5bmFFvdGYBlQUjyl+fjDbVJXS
         /oVAzBo+QEruxUhefeiT+AhpF+A9KmohtyNOUNf6t51YocBGRXLI4rHN6Psk4JfoOQ0+
         o6ZsXB8oLwy9C3McQ8YVnS071DMMFKIQSEu3iN+YjoSj+PMbC7Z+ER4ocd0k7AkrQxcC
         KOaK5Jf1bdVvTi22pyxFmOB0NLJebpXN2JfIwESaDZknixitG4l1n0+6YQlLArsErGq/
         3jEmd+xMPRs8gNxsapkpv0QLNT5xV4f6HXUhLsDsCXUlN2Ih0W4u8nNBJaAVGtWojoZR
         Zy3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:sid:list-unsubscribe:feedback-id:reply-to:subject:message-id
         :mime-version:from:date:dkim-signature;
        bh=ffe6VnYhy//15ZuUeVS8JnRcErxKUds+eesMmQYwyaU=;
        fh=gxv6KPRH6O+Oq3mqvhuXuTetS01385E93D+NhmqUcp4=;
        b=RaWdQ43O2u+pDsx2ghxX3qvmj3/Ubg7fBNE6okaDdsfTUxUody87CxYKEiCGHPdCVS
         lYI0tLwTjua5IqQw+Y/2z7olvVprJJk67ZJox6/kfXby3Q6x0kshC3+Vvh92pSYZFwlW
         5B2ljMHiXpDKjJwiQAP++dctmgBLLsC9ixj1zXS1TS76GMswju1zvL519Pnh3cJ+TRFX
         DPyMl7CNqNlfb2kDemUt5WmRBoa+ekG7OJJpoMwGNjA+WFlf9Pq87HLwts2EH+MtiJ8j
         oo897/Z5avTBgJztwE6Qeo2PpMK2PR9bxuZbftbtEGIl4Jr2T7l5IlHRTxSyZKzt6XtZ
         u8SA==;
        dara=google.com
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@mail.beehiiv.com header.s=s1 header.b=hh2cFwiy;
       spf=pass (google.com: domain of bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com designates 149.72.163.231 as permitted sender) smtp.mailfrom="bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=beehiiv.com
Received: from wrqvxpzt.outbound-mail.sendgrid.net (wrqvxpzt.outbound-mail.sendgrid.net. [149.72.163.231])
        by gmr-mx.google.com with ESMTPS id ld15-20020a170902facf00b001e24b3e3be3si557163plb.4.2024.04.15.04.06.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 04:06:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com designates 149.72.163.231 as permitted sender) client-ip=149.72.163.231;
Received: by filterdrecv-77bb5d9655-9xpfd with SMTP id filterdrecv-77bb5d9655-9xpfd-1-661D09FD-189
        2024-04-15 11:05:33.69564778 +0000 UTC m=+220568.286409965
Received: from NDAzNDMyOTY (unknown)
	by geopod-ismtpd-2 (SG) with HTTP
	id Z6rk0s2wQIqJvKFvrCQBXg
	Mon, 15 Apr 2024 11:05:33.614 +0000 (UTC)
Content-Type: multipart/alternative; boundary=4d9a6178a51e9a4735e19c2191048d146d2fbe66991027fbdc59e37405fc
Date: Mon, 15 Apr 2024 11:06:04 +0000 (UTC)
From: "'SEED Conference' via Jailhouse" <jailhouse-dev@googlegroups.com>
Mime-Version: 1.0
Message-ID: <Z6rk0s2wQIqJvKFvrCQBXg@geopod-ismtpd-2>
Subject: SEED Conference 2024
Reply-To: SEED Conference <seedconf@upv.es>
x-beehiiv-ids: =?us-ascii?Q?{=22account=5Fname=22=3A=22https=3A=2F=2Fseed-conference-valencia=2Ebeehiiv=2Ecom=2F?=
 =?us-ascii?Q?=22=2C=22campaign=5Fid=22=3A=22a2f4ba95-7f61-4d7c-a15?=
 =?us-ascii?Q?5-67449ddfdf3e=22=2C=22category=22=3A=22newsletter=22?=
 =?us-ascii?Q?=2C=22email=5Fgenerated=5Fat=22=3A1713179133=2C=22user=5F?=
 =?us-ascii?Q?id=22=3A=2271fc7e6d-cd28-47c6-aa1e-5d673d88c2?=
 =?us-ascii?Q?8e=22}?=
x-newsletter-id: https://seed-conference-valencia.beehiiv.com/
x-newsletter-signup: https://seed-conference-valencia.beehiiv.com/subscribe
Feedback-ID: =?us-ascii?Q?a2f4ba95-7f61-4d7c-a155-67449ddfdf3e=3Anewsletter=3A71fc7e6d-cd28-?=
 =?us-ascii?Q?47c6-aa1e-5d673d88c28e=3A73c7af638dd0cac?=
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
x-beehiiv-type: newsletter
sId: 71fc7e6d-cd28-47c6-aa1e-5d673d88c28e
x-list-id: 71fc7e6d-cd28-47c6-aa1e-5d673d88c28e
x-newsletter: https://seed-conference-valencia.beehiiv.com/p/seed-conference-13042024
x-list-owner: <mailto:seedconf@upv.es>
X-SG-EID: =?us-ascii?Q?u001=2EMt=2FpfclHn1+UMtV8LJLhNNy4mEHVvqc1hZQ2Olx3PhEx8x0AjXbaNLDVr?=
 =?us-ascii?Q?pzjLLk3hXXJDPZv5bNMhpkmvRjphJxDILoXEE4z?=
 =?us-ascii?Q?Yuf6F8BgxpnAkrfk942i4DZkzqTUWQoEgDfDCOj?=
 =?us-ascii?Q?vK5FxG8oDbscfjA4Yn5NvbwV0O+OXs9WR4q5bYX?=
 =?us-ascii?Q?FAuBmszFHmgY79UX2ak=2FRNjL=2FFOxu2v3BsDLsPi?=
 =?us-ascii?Q?I09txwZI2S+JC5Xy8A9hSxS6uID1mCaLq=2FLIe3R?=
 =?us-ascii?Q?KgANlnrmfSgEWjE7CS1yaXd64kO18GtqozlBSvR?=
 =?us-ascii?Q?R6SG7b4g=3D?=
X-SG-ID: =?us-ascii?Q?u001=2ESdBcvi+Evd=2FbQef8eZF3BpTL9BgbK5wfSJMJGMsmprAVgeiC8iaV7rEmQ?=
 =?us-ascii?Q?+cYi2k7CGCXKomt4zOOzEECGIuDeaguMIdnXMsW?=
 =?us-ascii?Q?JP+wqlRrjDf=2FhDdqdzcLBoDzn2etuBhs5yX0xn8?=
 =?us-ascii?Q?pqz8URM5YJxoZvM4ge1GGEp3TQ7Hidn5uhlgcfV?=
 =?us-ascii?Q?3GvzUdhwfub5l53+nes0nmSRUoQzT9M1ZUSdvHk?=
 =?us-ascii?Q?iozsXHLRZs3gCfyTpG+zr2Q=2Fid6cFAGwUQk2nEU?=
 =?us-ascii?Q?wzKZ0A1eZoKHEJ=2FOg3RcDpqT8A=3D=3D?=
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
X-Entity-ID: u001.GINWaumzpjWck0y5/PF8TQ==
X-Original-Sender: seed-conference-valencia@mail.beehiiv.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@mail.beehiiv.com header.s=s1 header.b=hh2cFwiy;       spf=pass
 (google.com: domain of bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com
 designates 149.72.163.231 as permitted sender) smtp.mailfrom="bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com";
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

--4d9a6178a51e9a4735e19c2191048d146d2fbe66991027fbdc59e37405fc
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0

View image: (https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,forma=
t=3Dauto,onerror=3Dredirect,quality=3D80/uploads/asset/file/dcbc0422-e91e-4=
be2-9044-0744bbc94e07/6543f3704bcc1407f3339baf.png?t=3D1702884418)
Follow image link: (https://www.seedconference.eu/)
Caption:=20

### **Join SEED 2024**!=20

### Do not miss the opportunity to participate in any of the exciting **18 =
SEED Workshops**!=20

### July 3 - 5, 2024. Valencia, Spain

Visit seedconference.eu (https://www.seedconference.eu/)

View image: (https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,forma=
t=3Dauto,onerror=3Dredirect,quality=3D80/uploads/asset/file/811d6ad0-9236-4=
fe5-a7c1-066902dc92b1/hero-ws.jpg?t=3D1713016859)
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
**[WS07](#ws7)****    |    **[**WS08**](#ws8)**    |    **[**WS09**](#ws9)*=
*    |    **[**WS10**](#ws10)**    |    **[**WS11**](#ws11)**   |    **[**W=
S12**](#ws12)
**[WS13](#ws13)****    |    ****[WS14](#ws14)****    |    ****[WS15](#ws15)=
****   |    ****[WS16](#ws16)****    |    ****[WS17](#ws17)****    |    ***=
*[WS18](#ws18)**


--------------------
# WS01

In this workshop, we will share our good practices from The Netherlands, of=
 which the proven method of Learning Communities. We will illustrate how re=
search, education, and practical implementation of innovations can reinforc=
e each other and better tackling societal challenges like the energy transi=
tion. Next, we would like to discuss the possibilities of an international =
network in which we can share learnings of proven and new concepts.

Read more (https://www.seedconference.eu/ws1)


--------------------
# WS02

In this workshop, we will share our good practices from The Netherlands, of=
 which the proven method of Learning Communities. We will illustrate how re=
search, education, and practical implementation of innovations can reinforc=
e each other and better tackling societal challenges like the energy transi=
tion. Next, we would like to discuss the possibilities of an international =
network in which we can share learnings of proven and new concepts.

Read more (https://www.seedconference.eu/ws2)


--------------------
# WS03

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
# WS04

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
# WS05

This workshop aims to provide an interactive platform for participants to s=
hare and discuss research findings, pedagogical strategies, and practical e=
xperiences in utilizing business games as tools for teaching sustainability=
 principles in management courses. The primary objective is to explore the =
intersection of two dynamic streams of research and educational trends: the=
 utilization of learning/experimental games and the incorporation of sustai=
nability themes in management education.=20

Read more (https://www.seedconference.eu/ws5)


--------------------
# WS06

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
# WS07

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
# WS08

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
# WS09

Europe and Africa have to jointly promote a hydrogen transition to boost su=
stainable economic development and a decarbonization of their economic sect=
or. African green hydrogen transition could boost local economies developme=
nt, that=E2=80=99s why it=E2=80=99s important that both EU and AU hydrogen =
policies and development roadmaps have to be conceived in a cross-fertilizi=
ng way.

Read more (https://www.seedconference.eu/ws9)


--------------------
# WS10

The RE-SKILLS workshop aims to address the demand for skilled professionals=
 capable of implementing cutting-edge technological proposals in the dynami=
c landscape of the energy sector. With a focus on novel technological conce=
pts, the event will bring together industry experts, academia, and professi=
onals to identify essential skills and capabilities required for successful=
 integration.

Read more (https://www.seedconference.eu/ws10)


--------------------
# WS11

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
# WS12

In this workshop we invite you to experience a technology demonstration and=
 subsequently help us to transform traditional mono-disciplinary technology=
 education into transdisciplinary and multilevel challenge-based education.=
 You will gain insights in two interesting technology applications and will=
 have the opportunity to enrich your and our perspectives on transdisciplin=
ary, multilevel and challenge-based education.

Read more (https://www.seedconference.eu/ws12)


--------------------
# WS13

Research learning to enhance innovation in cooperation with SME, industries=
 and vocation training facilitators is a crucial way for the sustainable an=
d digital transformation in all areas of the society. One of the outcomes o=
f the AIRinVET Project ([https://airnvet.eu](https://airnvet.eu)) is a mapp=
ing of applied research activities in vocational education and Training. Th=
e workshop will show and discuss approaches as well as results of the AIRin=
VET Project and give best practice from Germany and The Netherlands on how =
to design cooperative curricula and research learning programs with the pri=
vate sector for a successful implementation of sustainable energy education=
.

Read more (https://www.seedconference.eu/ws13)


--------------------
# WS14

H2 VIRTUAL TRAINING is a digital training program developed at the Universi=
ty of Toulouse which addresses safety issues during maintenance operations =
on hydrogen vehicles

Read more (https://www.seedconference.eu/ws14)


--------------------
# WS15

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
# WS16

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
# WS17

In this inspirational workshop you will explore three approaches to integra=
te sustainability in education from three perspectives: reflexive, SDGs in =
education and the relevance of entrepreneurial skills. You will review the =
three approaches and find out how you can apply the three different perspec=
tives to your own education or in your institute.

Read more (https://www.seedconference.eu/ws17)


--------------------
# WS18

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

DaElp


=E2=80=94=E2=80=94=E2=80=94

You are reading a plain text version of this post. For the best experience,=
 copy and paste this link in your browser to view the post online:
https://seed-conference-valencia.beehiiv.com/p/seed-conference-13042024

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/Z6rk0s2wQIqJvKFvrCQBXg%40geopod-ismtpd-2.

--4d9a6178a51e9a4735e19c2191048d146d2fbe66991027fbdc59e37405fc
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
36px;line-height:54px;padding-bottom:4px;padding-top:16px;mso-margin-top-al=
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
  .v { border-radius:10px;border:solid 0px #438ac9;background-color:#438ac9=
;font-family:'Arial',Helvetica,sans-serif;color:#FFFFFF; }
  .v a { text-decoration:none;display:block;color:#FFFFFF; }
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
36px;line-height:54px;padding-bottom:4px;padding-top:16px;mso-margin-top-al=
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
  .v { border-radius:10px;border:solid 0px #438ac9;background-color:#438ac9=
;font-family:'Arial',Helvetica,sans-serif;color:#FFFFFF; }
  .v a { text-decoration:none;display:block;color:#FFFFFF; }
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
0px;overflow:hidden;"> 18 exciting workshops are waiting for you! &#160;&#8=
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
4;&#160;&#8204;&#160;&#8204;&#160;&#8204; </div><table role=3D"none" width=
=3D"100%" border=3D"0" cellspacing=3D"0" align=3D"center" cellpadding=3D"0"=
 class=3D"gg"><tr><td align=3D"center" valign=3D"top"><table role=3D"none" =
width=3D"670" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" class=3D"aa"=
 style=3D"width:670px;table-layout:fixed;"><tr><td class=3D"bodyWrapper" al=
ign=3D"center" valign=3D"top" style=3D"padding:10px 5px 10px 5px;"><table r=
ole=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0=
" align=3D"center"><tr><td align=3D"center" valign=3D"top" style=3D"border:=
0px solid #FFFFFF;border-radius:10px;background-color:#ffffff;" class=3D"c"=
><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpad=
ding=3D"0" align=3D"center"><tr><td class=3D"f" align=3D"right" valign=3D"t=
op" style=3D"padding:20px 15px;"><p> April 15, 2024 &nbsp; | &nbsp; <a href=
=3D"https://link.mail.beehiiv.com/ss/c/u001.ja41VZAtR_qfVYIA2l6dByPcgm40JQb=
xLouneWPj9NO-QaAKU5v3Uihq7_J7Kxc8t6d4j3XtkHRy-MgDZN93o_OkfCZZN8YKEp4rcLtP0p=
684V0gpO-vE_4hWaYbxtuwXTTu09_qYdHkRUtv17HQsN2d_KOaQbHKteIOnGh9tv-8J2FZiAYtA=
OxZFkXlNFjEwjGLUcDs1atEuW7hezYJKdY4KWe1XzF6tn-GdbtXr4vyDI6rWjdbMsM_h2s40BnZ=
dIGQ1GbBL6jAoSR7hHDCd-lUIGaxTVz8WbEv8fePr7FLi2si6giE-gAHnq6kBZTcvzldXRyhfda=
LXzJSDavYKn785zBnZrrpsJTQOosifJSv-c6_9pK1pa2xpsq77wqITHMdJBHYl2nlcjGfF3oT4E=
rGRpL5lY3j0WZ0EI7_xwiVPctJn47ktbBhxU3BkHbKvGO1r3QueipcFTwpAqOFTlqDfxZ2HtkoJ=
shu6Ju_CqLlt3mfzRZV7CTZwkDIogRjw9aEevCZs8ao-a0NBhlrOCsiX1R9knUpMwssevAWLY8y=
0gvHaiwYAWJsEwCv4bsE2CkQq5BGbELHVTmdkm8qPC4bn6hmiDQz7EbvUMeq-KvfoLy-2Qkp7GB=
7HPhI2_7v7T_KkZJ5Dt0l6i3F_Uo89LFFHvuIjcVqTsOHsI8oppE/45j/2FA_5WcLRpunFHaTyA=
h3JA/h0/h001.zPyy0gI9EGohI0I34LbBh8Yp79Z8K-fWUt3X1Z2yvfY">Read Online</a></=
p></td></tr><tr><td style=3D"height:0px;width:0px;"><div style=3D"height:1p=
x;" data-open-tracking=3D"true"> <img src=3D"https://link.mail.beehiiv.com/=
ss/o/u001.76lOL-0293a1YMnLUs-4IA/45j/2FA_5WcLRpunFHaTyAh3JA/ho.gif" alt=3D"=
" width=3D"1" height=3D"1" border=3D"0" style=3D"height:1px !important;widt=
h:1px !important;border-width:0 !important;margin-top:0 !important;margin-b=
ottom:0 !important;margin-right:0 !important;margin-left:0 !important;paddi=
ng-top:0 !important;padding-bottom:0 !important;padding-right:0 !important;=
padding-left:0 !important;"/> </div></td></tr><tr id=3D"content-blocks"><td=
 class=3D"email-card-body" align=3D"center" valign=3D"top" style=3D"padding=
-bottom:15px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0" align=3D"center"><tr><td class=3D"dd" align=3D"cen=
ter" style=3D"padding:0px 15px;text-align:center;word-break:break-word;"><p=
></p></td></tr><tr><td align=3D"center" valign=3D"top" style=3D"padding: 0p=
x 15px 0px; " class=3D"dd"><table role=3D"none" border=3D"0" cellspacing=3D=
"0" cellpadding=3D"0" style=3D"margin:0 auto 0 auto;"><tr><td align=3D"cent=
er" valign=3D"top" style=3D"width:252px;"><a href=3D"https://link.mail.beeh=
iiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad1LOGaFg9-6Ik4ko=
UqS_adtppE6NmAHVhAcf_h8YchlOJaQ_TQg9QzMw_wdkLd6ezXe4B58ARO8CCLsXDtfqN35oJ8F=
7nGDK_XiN2ykpZMZAy4M3CZ3LJaRMpsrsWYTWr5jhovGd8hk28ovRUe7UzfaoTBMcAPKWRagbhg=
UqkSsIA/45j/2FA_5WcLRpunFHaTyAh3JA/h1/h001.7uHTgqWznvchLjtvo2pUjUaQPTUVWZ-F=
CNJzSgDRFp4" rel=3D"noopener noreferrer nofollow" style=3D"text-decoration:=
none;" target=3D"_blank"><img src=3D"https://media.beehiiv.com/cdn-cgi/imag=
e/fit=3Dscale-down,format=3Dauto,onerror=3Dredirect,quality=3D80/uploads/as=
set/file/dcbc0422-e91e-4be2-9044-0744bbc94e07/6543f3704bcc1407f3339baf.png?=
t=3D1702884418" alt=3D"" height=3D"auto" width=3D"252" style=3D"display:blo=
ck;width:100%;" border=3D"0"/></a></td></tr></table></td></tr><tr><td class=
=3D"dd" align=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-alig=
n:center;"><h3><span style=3D"color:#438ac9;font-family:Arial;font-size:36p=
x;"><b>Join SEED 2024</b></span><span style=3D"color:#438ac9;font-family:Ar=
ial;font-size:36px;">! </span></h3></td></tr><tr><td class=3D"dd" align=3D"=
center" valign=3D"top" style=3D"padding:0px 15px;text-align:center;"><h3><s=
pan style=3D"color:rgb(232, 25, 90);font-family:Arial;font-size:36px;">Do n=
ot miss the opportunity to participate in any of the exciting </span><span =
style=3D"color:rgb(232, 25, 90);font-family:Arial;font-size:36px;"><b>18 SE=
ED Workshops</b></span><span style=3D"color:rgb(232, 25, 90);font-family:Ar=
ial;font-size:36px;">! </span></h3></td></tr><tr><td class=3D"dd" align=3D"=
center" valign=3D"top" style=3D"padding:0px 15px;text-align:center;"><h3><s=
pan style=3D"color:rgb(67, 138, 201);font-family:Arial;font-size:24px;">Jul=
y 3 - 5, 2024. Valencia, Spain</span></h3></td></tr><tr><td align=3D"center=
" valign=3D"top" style=3D"padding-bottom:14px;padding-left:15px;padding-rig=
ht:15px;padding-top:14px;text-align:center;width:100%;word-break:break-word=
;" class=3D"dd"><table role=3D"none" border=3D"0" cellspacing=3D"0" cellpad=
ding=3D"0" align=3D"center"><tr><td class=3D"v" align=3D"center" valign=3D"=
middle" height=3D"52" style=3D"height:52px;"><a href=3D"https://link.mail.b=
eehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad1LOGaFg9-6Ik=
4koUqS_adtppE6NmAHVhAcf_h8YchlOJaQ_TQg9QzMw_wdkLd6ezXe4B58ARO8CCLsXDtfqN35o=
J8F7nGDK_XiN2ykpZMZAy4M3CZ3LJaRMpsrsWYTWr5jhovGd8hk28ovRUe7UzfaoTBMcAPKWRag=
bhgUqkSsIA/45j/2FA_5WcLRpunFHaTyAh3JA/h2/h001.tekbtbRPUBCZ4wSVRhXOdGZEAcXS0=
U1_TPTRjrvWYNU" target=3D"_blank" rel=3D"noopener noreferrer nofollow" styl=
e=3D"color:#FFFFFF;font-size:18px;padding:0px 22px;text-decoration:none;"> =
Visit seedconference.eu </a></td></tr></table></td></tr><tr><td align=3D"ce=
nter" valign=3D"top" style=3D"padding: 0px 15px 0px; " class=3D"dd"><table =
role=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"mar=
gin:0 auto 0 auto;"><tr><td align=3D"center" valign=3D"top" style=3D"width:=
630px;"><a href=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0I=
nFUCEtII-f83mS9u8hVzFrpIad2S3JbPMGacTyZyB5EOQz_xp0aw93paP535UwgPq13Wo3HJXLK=
qW_RDfZnxIIfvHuoTnoOM1Qi-GD0MJG7XoSBvCDoITof3IarWuUVzVUfK6P4-HXEdC4dTVz1rUJ=
UFt5liXhrFn7ReTZLr2cRwdRvtW2CsbCpC79Ivo_XCRBowIFvpl0jGCYGC9PR75EmsJMY/45j/2=
FA_5WcLRpunFHaTyAh3JA/h3/h001.iQT0bH9AOojEv0d4123VNYeenILkDp5CWeCiQOoL_Gg" =
rel=3D"noopener noreferrer nofollow" style=3D"text-decoration:none;" target=
=3D"_blank"><img src=3D"https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale=
-down,format=3Dauto,onerror=3Dredirect,quality=3D80/uploads/asset/file/811d=
6ad0-9236-4fe5-a7c1-066902dc92b1/hero-ws.jpg?t=3D1713016859" alt=3D"" heigh=
t=3D"auto" width=3D"630" style=3D"display:block;width:100%;" border=3D"0"/>=
</a></td></tr></table></td></tr><tr><td><table role=3D"none" width=3D"100%"=
 border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolo=
r=3D"#E8BEC7" style=3D"background-color:#E8BEC7;padding:0px 0px 0px 0px;"><=
table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpaddi=
ng=3D"0"><tr><td class=3D"dd" align=3D"center" valign=3D"top" style=3D"padd=
ing:0px 15px;text-align:center;"><h1><span style=3D"color:#e8195a;">In this=
 newsletter:</span></h1></td></tr></table></td></tr></table></td></tr><tr><=
td><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellp=
adding=3D"0" style=3D""><tr><td bgcolor=3D"#E8BEC7" style=3D"background-col=
or:#E8BEC7;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" bo=
rder=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=
=3D"center" style=3D"padding:0px 15px;text-align:center;word-break:break-wo=
rd;"><p><span style=3D"color:#e8195a;">Click on the Workshop below to read =
more:</span></p></td></tr></table></td></tr></table></td></tr><tr><td><tabl=
e role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" style=3D""><tr><td bgcolor=3D"#E8BEC7" style=3D"background-color:#E8=
BEC7;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=3D"ce=
nter" style=3D"padding:0px 15px;text-align:center;word-break:break-word;"><=
p><span style=3D"color:#e8195a;"><b><a class=3D"link" href=3D"#ws1" rel=3D"=
noopener noreferrer nofollow" clicktracking=3D"off">WS01</a></b></span><spa=
n style=3D"color:#e8195a;"><b> | </b></span><span style=3D"color:#e8195a;">=
<b><a class=3D"link" href=3D"#ws2" rel=3D"noopener noreferrer nofollow" cli=
cktracking=3D"off">WS02</a></b></span><span style=3D"color:rgb(232, 25, 90)=
;"><b> | </b></span><span style=3D"color:rgb(232, 25, 90);"><b><a class=3D"=
link" href=3D"#ws3" rel=3D"noopener noreferrer nofollow" clicktracking=3D"o=
ff">WS03</a></b></span><span style=3D"color:rgb(232, 25, 90);"><b> | </b></=
span><span style=3D"color:rgb(232, 25, 90);"><b><a class=3D"link" href=3D"#=
ws4" rel=3D"noopener noreferrer nofollow" clicktracking=3D"off">WS04</a></b=
></span><span style=3D"color:rgb(232, 25, 90);"><b> | </b></span><span styl=
e=3D"color:rgb(232, 25, 90);"><b><a class=3D"link" href=3D"#ws5" rel=3D"noo=
pener noreferrer nofollow" clicktracking=3D"off">WS05</a></b></span><span s=
tyle=3D"color:rgb(232, 25, 90);"><b> | </b></span><span style=3D"color:rgb(=
232, 25, 90);"><b><a class=3D"link" href=3D"#ws6" rel=3D"noopener noreferre=
r nofollow" clicktracking=3D"off">WS06</a></b></span><br><span style=3D"col=
or:rgb(232, 25, 90);"><b><a class=3D"link" href=3D"#ws7" rel=3D"noopener no=
referrer nofollow" clicktracking=3D"off">WS07</a></b></span><span style=3D"=
color:rgb(232, 25, 90);"><b> | </b></span><span style=3D"color:rgb(232, 25,=
 90);"><a class=3D"link" href=3D"#ws8" rel=3D"noopener noreferrer nofollow"=
 clicktracking=3D"off"><b>WS08</b></a></span><span style=3D"color:rgb(232, =
25, 90);"><b> | </b></span><span style=3D"color:rgb(232, 25, 90);"><a class=
=3D"link" href=3D"#ws9" rel=3D"noopener noreferrer nofollow" clicktracking=
=3D"off"><b>WS09</b></a></span><span style=3D"color:rgb(232, 25, 90);"><b> =
| </b></span><span style=3D"color:rgb(232, 25, 90);"><a class=3D"link" href=
=3D"#ws10" rel=3D"noopener noreferrer nofollow" clicktracking=3D"off"><b>WS=
10</b></a></span><span style=3D"color:rgb(232, 25, 90);"><b> | </b></span><=
span style=3D"color:rgb(232, 25, 90);"><a class=3D"link" href=3D"#ws11" rel=
=3D"noopener noreferrer nofollow" clicktracking=3D"off"><b>WS11</b></a></sp=
an><span style=3D"color:rgb(232, 25, 90);"><b> | </b></span><span style=3D"=
color:rgb(232, 25, 90);"><a class=3D"link" href=3D"#ws12" rel=3D"noopener n=
oreferrer nofollow" clicktracking=3D"off"><b>WS12</b></a></span><br><span s=
tyle=3D"color:rgb(232, 25, 90);"><b><a class=3D"link" href=3D"#ws13" rel=3D=
"noopener noreferrer nofollow" clicktracking=3D"off">WS13</a></b></span><sp=
an style=3D"color:rgb(232, 25, 90);"><b> | </b></span><span style=3D"color:=
rgb(232, 25, 90);"><b><a class=3D"link" href=3D"#ws14" rel=3D"noopener nore=
ferrer nofollow" clicktracking=3D"off">WS14</a></b></span><span style=3D"co=
lor:rgb(232, 25, 90);"><b> | </b></span><span style=3D"color:rgb(232, 25, 9=
0);"><b><a class=3D"link" href=3D"#ws15" rel=3D"noopener noreferrer nofollo=
w" clicktracking=3D"off">WS15</a></b></span><span style=3D"color:rgb(232, 2=
5, 90);"><b> | </b></span><span style=3D"color:rgb(232, 25, 90);"><b><a cla=
ss=3D"link" href=3D"#ws16" rel=3D"noopener noreferrer nofollow" clicktracki=
ng=3D"off">WS16</a></b></span><span style=3D"color:rgb(232, 25, 90);"><b> |=
 </b></span><span style=3D"color:rgb(232, 25, 90);"><b><a class=3D"link" hr=
ef=3D"#ws17" rel=3D"noopener noreferrer nofollow" clicktracking=3D"off">WS1=
7</a></b></span><span style=3D"color:rgb(232, 25, 90);"><b> | </b></span><s=
pan style=3D"color:rgb(232, 25, 90);"><b><a class=3D"link" href=3D"#ws18" r=
el=3D"noopener noreferrer nofollow" clicktracking=3D"off">WS18</a></b></spa=
n></p></td></tr></table></td></tr></table></td></tr><tr><td><table id=3D"ws=
1" role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" style=3D""><tr><td bgcolor=3D"transparent" style=3D"background-color=
:transparent;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" =
border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=
=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-align:center;"><h=
1><span style=3D"">WS01</span></h1></td></tr><tr><td class=3D"dd" align=3D"=
center" style=3D"padding:0px 15px;text-align:center;word-break:break-word;"=
><p><span style=3D"color:rgb(0, 0, 0);font-family:Aptos Narrow, Calibri, sa=
ns-serif, Mongolian Baiti, Microsoft Yi Baiti, Javanese Text, Yu Gothic;">I=
n this workshop, we will share our good practices from The Netherlands, of =
which the proven method of Learning Communities. We will illustrate how res=
earch, education, and practical implementation of innovations can reinforce=
 each other and better tackling societal challenges like the energy transit=
ion. Next, we would like to discuss the possibilities of an international n=
etwork in which we can share learnings of proven and new concepts.</span></=
p></td></tr><tr><td align=3D"center" valign=3D"top" style=3D"padding-bottom=
:14px;padding-left:15px;padding-right:15px;padding-top:14px;text-align:cent=
er;width:100%;word-break:break-word;" class=3D"dd"><table role=3D"none" bor=
der=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td clas=
s=3D"v" align=3D"center" valign=3D"middle" height=3D"42" style=3D"height:42=
px;"><a href=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFU=
CEtII-f83mS9u8hVzFrpIad14hr7oMXwaREjCGwTDWZ3Yr2-cBt-iaZ4P3kIhKy9xW80HcqUZDL=
TGfrnlk1dssW8R8FoNFKbgnfRBWkPmP6b8LOmVuzZB88eSFzk5z1PwZ24FI7-tpYbxzwDEVSLXY=
pOw85ZZW0FwXusPQHvNsTpYbyjVCtAvf_lUxLoH-ZO_NA/45j/2FA_5WcLRpunFHaTyAh3JA/h4=
/h001.7iBFsMvrtzGgAZdsZNa8vhKg6_7sX3yVQUEJdPoaBlk" target=3D"_blank" rel=3D=
"noopener noreferrer nofollow" style=3D"color:#FFFFFF;font-size:16px;paddin=
g:0px 14px;text-decoration:none;"> Read more </a></td></tr></table></td></t=
r></table></td></tr></table></td></tr><tr><td><table id=3D"ws2" role=3D"non=
e" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D=
""><tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:#EFF2F7;padding:0p=
x 0px 0px 0px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacin=
g=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=3D"center" valign=3D"t=
op" style=3D"padding:0px 15px;text-align:center;"><h1><span style=3D"">WS02=
</span></h1></td></tr><tr><td class=3D"dd" align=3D"center" style=3D"paddin=
g:0px 15px;text-align:center;word-break:break-word;"><p><span style=3D"colo=
r:rgb(0, 0, 0);font-family:Aptos Narrow, Calibri, sans-serif, Mongolian Bai=
ti, Microsoft Yi Baiti, Javanese Text, Yu Gothic;">In this workshop, we wil=
l share our good practices from The Netherlands, of which the proven method=
 of Learning Communities. We will illustrate how research, education, and p=
ractical implementation of innovations can reinforce each other and better =
tackling societal challenges like the energy transition. Next, we would lik=
e to discuss the possibilities of an international network in which we can =
share learnings of proven and new concepts.</span></p></td></tr><tr><td ali=
gn=3D"center" valign=3D"top" style=3D"padding-bottom:14px;padding-left:15px=
;padding-right:15px;padding-top:14px;text-align:center;width:100%;word-brea=
k:break-word;" class=3D"dd"><table role=3D"none" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0" align=3D"center"><tr><td class=3D"v" align=3D"cent=
er" valign=3D"middle" height=3D"42" style=3D"height:42px;"><a href=3D"https=
://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpI=
ad35n8hCZE2kHba0yP4siU_de0TDKi_mUO9BNaZU_1wHb_8tt0GxWsofCNnaeJi3SZD-8tDm9D5=
cAFKO4yFHf_xXVFtfWN2UPRY7mZq3Q0V9O-kldTwYbudJQAW_GczX4OIQQYV6n4DzoDHVkmui-M=
mY86Zi13uKWew74m51mTaVFA/45j/2FA_5WcLRpunFHaTyAh3JA/h5/h001.bTfGQ-VnsbMhmx6=
TXtshVgMTdBjpC77VTh8avl38zXo" target=3D"_blank" rel=3D"noopener noreferrer =
nofollow" style=3D"color:#FFFFFF;font-size:16px;padding:0px 14px;text-decor=
ation:none;"> Read more </a></td></tr></table></td></tr></table></td></tr><=
/table></td></tr><tr><td><table id=3D"ws3" role=3D"none" width=3D"100%" bor=
der=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D=
"transparent" style=3D"background-color:transparent;padding:0px 0px 0px 0px=
;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellp=
adding=3D"0"><tr><td class=3D"dd" align=3D"center" valign=3D"top" style=3D"=
padding:0px 15px;text-align:center;"><h1><span style=3D"">WS03</span></h1><=
/td></tr><tr><td class=3D"dd" align=3D"center" style=3D"padding:0px 15px;te=
xt-align:center;word-break:break-word;"><p><span style=3D"color:rgb(0, 0, 0=
);font-family:Aptos Narrow, Calibri, sans-serif, Mongolian Baiti, Microsoft=
 Yi Baiti, Javanese Text, Yu Gothic;">New European Bauhaus (NEB) initiative=
 aligns with the EU&#39;s goal of carbon neutrality by 2050, integrating ae=
sthetics and sustainability inspired by historic Bauhaus movement. This wor=
kshop explores the key concepts of NEB =E2=80=93 sustainability, inclusiven=
ess, aesthetics and social engagement =E2=80=93 =E2=80=8B=E2=80=8Bidentifyi=
ng crucial skills for upskilling the workforce in nature-based solutions (N=
BS) for urban regeneration. The workshop, using the World Caf=C3=A9 method,=
 aims to devise effective teaching techniques, discovering skills essential=
 to NEB&#39;s values =E2=80=8B=E2=80=8Band addressing environmental challen=
ges. It brings together educators, professionals and organizations for cros=
s-sector collaboration, emphasizing community involvement and raising aware=
ness about the potential of NBS in the NEB perspective.</span></p></td></tr=
><tr><td align=3D"center" valign=3D"top" style=3D"padding-bottom:14px;paddi=
ng-left:15px;padding-right:15px;padding-top:14px;text-align:center;width:10=
0%;word-break:break-word;" class=3D"dd"><table role=3D"none" border=3D"0" c=
ellspacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td class=3D"v" ali=
gn=3D"center" valign=3D"middle" height=3D"42" style=3D"height:42px;"><a hre=
f=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS=
9u8hVzFrpIad3uzjQNhPONTz0OXKTKbeUaJDOLEB156Agx-YqDpUJ5lvqC8Xb9IPbLAmWgv_0CC=
xQSDVpx1eM3ocRTctvAu57WIYuSovJeNoG_tICkIfc4QKOhaqaaubad4ZY4Qqy1X9PqTEJtmvmV=
qMQzTXNg5ALXxy-GnU7itpPBbM4LAPnzCw/45j/2FA_5WcLRpunFHaTyAh3JA/h6/h001.Rw25W=
19WggWUluCVBagSWZrmS-WoFu_7jJtewsf5OYE" target=3D"_blank" rel=3D"noopener n=
oreferrer nofollow" style=3D"color:#FFFFFF;font-size:16px;padding:0px 14px;=
text-decoration:none;"> Read more </a></td></tr></table></td></tr></table><=
/td></tr></table></td></tr><tr><td><table id=3D"ws4" role=3D"none" width=3D=
"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td =
bgcolor=3D"#EFF2F7" style=3D"background-color:#EFF2F7;padding:0px 0px 0px 0=
px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cel=
lpadding=3D"0"><tr><td class=3D"dd" align=3D"center" valign=3D"top" style=
=3D"padding:0px 15px;text-align:center;"><h1><span style=3D"">WS04</span></=
h1></td></tr><tr><td class=3D"dd" align=3D"center" style=3D"padding:0px 15p=
x;text-align:center;word-break:break-word;"><p><span style=3D"color:rgb(0, =
0, 0);font-family:Aptos Narrow, Calibri, sans-serif, Mongolian Baiti, Micro=
soft Yi Baiti, Javanese Text, Yu Gothic;">The MINDS project aims to change =
young people&#39;s attitudes towards sustainability using Virtual Reality (=
VR) for immersive storytelling, marking a significant shift in sustainabili=
ty education. By making these complex issues more relatable and engaging, V=
R can help foster a deeper understanding and urgency for environmental matt=
ers. This workshop shares experiences from the project&#39;s pilot, focusin=
g on narrative techniques in sustainability education, addressing education=
al challenges, and enhancing skills in creating compelling environmental na=
rratives. To ensure that the project=E2=80=99s outcomes are tailored to the=
 needs and expectations of educators, we invite you to share your thoughts =
and challenges in sustainability education. </span></p></td></tr><tr><td al=
ign=3D"center" valign=3D"top" style=3D"padding-bottom:14px;padding-left:15p=
x;padding-right:15px;padding-top:14px;text-align:center;width:100%;word-bre=
ak:break-word;" class=3D"dd"><table role=3D"none" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0" align=3D"center"><tr><td class=3D"v" align=3D"cent=
er" valign=3D"middle" height=3D"42" style=3D"height:42px;"><a href=3D"https=
://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpI=
ad3v5YHnYr1vYAljlb2Ox0GzXUjq2V_FWtJMrl5O4MpvipkLw6bIHtWL7vU41B-dNZXVgUg7Mfq=
lqCjSPu0Kn9B0Xt3o44PegXj4FdzQhMUjLk9NghdQAaQj_D8q9kq5SMNj78GHgMpAf46586yicp=
2voQnp9HjkzYmhDFdb1fmbCQ/45j/2FA_5WcLRpunFHaTyAh3JA/h7/h001.D5ozCiqRY5txbo0=
a7IQce3r554PtYpELOpwbBnxWKYU" target=3D"_blank" rel=3D"noopener noreferrer =
nofollow" style=3D"color:#FFFFFF;font-size:16px;padding:0px 14px;text-decor=
ation:none;"> Read more </a></td></tr></table></td></tr></table></td></tr><=
/table></td></tr><tr><td><table id=3D"ws5" role=3D"none" width=3D"100%" bor=
der=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D=
"#FFFFFF" style=3D"background-color:#FFFFFF;padding:0px 0px 0px 0px;"><tabl=
e role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0"><tr><td class=3D"dd" align=3D"center" valign=3D"top" style=3D"paddin=
g:0px 15px;text-align:center;"><h1><span style=3D"">WS05</span></h1></td></=
tr><tr><td class=3D"dd" align=3D"center" style=3D"padding:0px 15px;text-ali=
gn:center;word-break:break-word;"><p><span style=3D"color:rgb(0, 0, 0);font=
-family:Aptos Narrow, Calibri, sans-serif, Mongolian Baiti, Microsoft Yi Ba=
iti, Javanese Text, Yu Gothic;">This workshop aims to provide an interactiv=
e platform for participants to share and discuss research findings, pedagog=
ical strategies, and practical experiences in utilizing business games as t=
ools for teaching sustainability principles in management courses. The prim=
ary objective is to explore the intersection of two dynamic streams of rese=
arch and educational trends: the utilization of learning/experimental games=
 and the incorporation of sustainability themes in management education. </=
span></p></td></tr><tr><td align=3D"center" valign=3D"top" style=3D"padding=
-bottom:14px;padding-left:15px;padding-right:15px;padding-top:14px;text-ali=
gn:center;width:100%;word-break:break-word;" class=3D"dd"><table role=3D"no=
ne" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><=
td class=3D"v" align=3D"center" valign=3D"middle" height=3D"42" style=3D"he=
ight:42px;"><a href=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZg=
nZ0InFUCEtII-f83mS9u8hVzFrpIad1lHmmqP5iOdZUm1f9JVYI2CO2SKs76ucV09PC1q4mVZpG=
_C6sO9X1hQNcdwxN3ywhQsgE0PU36mS36YWxk_GzZ9AO_pC4EOBjd6-xr0DPkn4XEwahxctaIL7=
3y6pu5IBgkSB1NdNzxPP5BRSDCqp2FszVE0NciVK6CstK_ni7kkQ/45j/2FA_5WcLRpunFHaTyA=
h3JA/h8/h001.LNAUV7tbhJtYa8zmd3GarM9tN4q0x-3btH4n4wpW9qU" target=3D"_blank"=
 rel=3D"noopener noreferrer nofollow" style=3D"color:#FFFFFF;font-size:16px=
;padding:0px 14px;text-decoration:none;"> Read more </a></td></tr></table><=
/td></tr></table></td></tr></table></td></tr><tr><td><table id=3D"ws6" role=
=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" s=
tyle=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:#EFF2F7;pad=
ding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" border=3D"0" cel=
lspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=3D"center" vali=
gn=3D"top" style=3D"padding:0px 15px;text-align:center;"><h1><span style=3D=
"">WS06</span></h1></td></tr><tr><td class=3D"dd" align=3D"center" style=3D=
"padding:0px 15px;text-align:center;word-break:break-word;"><p><span style=
=3D"color:rgb(0, 0, 0);font-family:Aptos Narrow, Calibri, sans-serif, Mongo=
lian Baiti, Microsoft Yi Baiti, Javanese Text, Yu Gothic;">Welcome to &quot=
;Empowering Through Education: T-Shore&#39;s Approach to Wind Turbine Techn=
ician Training,&quot; a workshop designed for educators, trainers, and prof=
essionals committed to the advancement of sustainable energy education. At =
the heart of our mission is the harmonisation of training programs across E=
urope, aiming to establish a standardised yet flexible curriculum that meet=
s the diverse needs of offshore wind technicians. This ambition confronts t=
he intricate challenge of aligning educational practices across five countr=
ies, each with its unique education system and course programming methodolo=
gies.</span></p></td></tr><tr><td align=3D"center" valign=3D"top" style=3D"=
padding-bottom:14px;padding-left:15px;padding-right:15px;padding-top:14px;t=
ext-align:center;width:100%;word-break:break-word;" class=3D"dd"><table rol=
e=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"center=
"><tr><td class=3D"v" align=3D"center" valign=3D"middle" height=3D"42" styl=
e=3D"height:42px;"><a href=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjL=
yNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad2bbZFje0nmw6yQ-lrxSMYVu129vJq51CBgCzK1=
xVpexVcStGdrkPrpxw2VRs--7OOLHTeh9yZJkPb3Zhi3vQwheFrvqFJ256rzbvxKtFCPKqcep8U=
9d080tEWwOfY4UkWrylgH2MK29lrq5fDaGV77vBQGo4QErunFqlCS8ZGeTw/45j/2FA_5WcLRpu=
nFHaTyAh3JA/h9/h001.mZISrt9i1mW4oz4TmCSW1cAOgQ1X3Du7i1ZEvmQcm4A" target=3D"=
_blank" rel=3D"noopener noreferrer nofollow" style=3D"color:#FFFFFF;font-si=
ze:16px;padding:0px 14px;text-decoration:none;"> Read more </a></td></tr></=
table></td></tr></table></td></tr></table></td></tr><tr><td><table id=3D"ws=
7" role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" style=3D""><tr><td bgcolor=3D"transparent" style=3D"background-color=
:transparent;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" =
border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=
=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-align:center;"><h=
1><span style=3D"">WS07</span></h1></td></tr><tr><td class=3D"dd" align=3D"=
center" style=3D"padding:0px 15px;text-align:center;word-break:break-word;"=
><p><span style=3D"color:rgb(0, 0, 0);font-family:Aptos Narrow, Calibri, sa=
ns-serif, Mongolian Baiti, Microsoft Yi Baiti, Javanese Text, Yu Gothic;">T=
he urgent sustainability challenges that students are expected to solve or =
cope with in the future require holistic interventions. We developed learni=
ng communities as part of a wider ecosystem to offer our students the oppor=
tunity to collaborate, learn and innovate on equal footing with all sorts o=
f knowledge partners. Involvement from applied sciences and vocational educ=
ation students, as well as private sector, government, and citizens ensures=
 that they experience the complexity of the real world. Our workshop consis=
ts of a simulation game that walks participants through the process of sett=
ing up a learning ecosystem on climate action education.</span></p></td></t=
r><tr><td align=3D"center" valign=3D"top" style=3D"padding-bottom:14px;padd=
ing-left:15px;padding-right:15px;padding-top:14px;text-align:center;width:1=
00%;word-break:break-word;" class=3D"dd"><table role=3D"none" border=3D"0" =
cellspacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td class=3D"v" al=
ign=3D"center" valign=3D"middle" height=3D"42" style=3D"height:42px;"><a hr=
ef=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83m=
S9u8hVzFrpIad3g-nYS-am3PsP2WxhBJR2e9wI_R_XqUtr3ByeBjh1MFmJs6vh92PuSKhLKx7LK=
j6HE7t7hIQFjIms3Oe6rBfGswNsV7NDD-xPX-_gDK38eT2QPs94rxI6OdS5ip50Ca8nx7vLS7HZ=
5hKbgihUNX_NknDk2l0KqJgRMHL4EoKAKpw/45j/2FA_5WcLRpunFHaTyAh3JA/h10/h001.Gcu=
5G5flL4sCEh9hkI1urURn-BlDAgicWnXGXklMorI" target=3D"_blank" rel=3D"noopener=
 noreferrer nofollow" style=3D"color:#FFFFFF;font-size:16px;padding:0px 14p=
x;text-decoration:none;"> Read more </a></td></tr></table></td></tr></table=
></td></tr></table></td></tr><tr><td><table id=3D"ws8" role=3D"none" width=
=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><=
td bgcolor=3D"#eef2f7" style=3D"background-color:#eef2f7;padding:0px 0px 0p=
x 0px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" =
cellpadding=3D"0"><tr><td class=3D"dd" align=3D"center" valign=3D"top" styl=
e=3D"padding:0px 15px;text-align:center;"><h1><span style=3D"">WS08</span><=
/h1></td></tr><tr><td class=3D"dd" align=3D"center" style=3D"padding:0px 15=
px;text-align:center;word-break:break-word;"><p><span style=3D"color:rgb(0,=
 0, 0);font-family:Aptos Narrow, Calibri, sans-serif, Mongolian Baiti, Micr=
osoft Yi Baiti, Javanese Text, Yu Gothic;">The workshop immerses participan=
ts in a virtual clothing company, challenging them to reevaluate traditiona=
l business models and achieve a sustainable balance between economic viabil=
ity, environmental stewardship, and social responsibility. Through dynamic =
business game simulations, participants gain practical experience, navigati=
ng real-world challenges and refining their decision making acumen. The wor=
kshop aims to foster an understanding of sustainable business principles an=
d their practical application in the fashion industry. Participants are enc=
ouraged to integrate the triple bottom line framework into their decision-m=
aking processes. </span></p></td></tr><tr><td align=3D"center" valign=3D"to=
p" style=3D"padding-bottom:14px;padding-left:15px;padding-right:15px;paddin=
g-top:14px;text-align:center;width:100%;word-break:break-word;" class=3D"dd=
"><table role=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" ali=
gn=3D"center"><tr><td class=3D"v" align=3D"center" valign=3D"middle" height=
=3D"42" style=3D"height:42px;"><a href=3D"https://link.mail.beehiiv.com/ss/=
c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad2J7XBKXMD8XKWIhly8A38ITt-r=
V2we4VuFZub-Faq5ACn3-H3aql9I52h2G4Ls4gNvz24XwvjOwPhQUOdzMtD25gD7sPNT3ngE5ad=
7Z8cWtLpCgMfM3g0nofYU9egcDiVod8xvsDT6F4Qbm85xd1bDLBMtlmjhUoKqbp-KQ9HrOA/45j=
/2FA_5WcLRpunFHaTyAh3JA/h11/h001.1HQQ5p1M2ISQ8QvP9JoRzpUZwYhVeam3jec3TvpLqI=
4" target=3D"_blank" rel=3D"noopener noreferrer nofollow" style=3D"color:#F=
FFFFF;font-size:16px;padding:0px 14px;text-decoration:none;"> Read more </a=
></td></tr></table></td></tr></table></td></tr></table></td></tr><tr><td><t=
able id=3D"ws9" role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0"=
 cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"transparent" style=3D"back=
ground-color:transparent;padding:0px 0px 0px 0px;"><table role=3D"none" wid=
th=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=
=3D"dd" align=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-alig=
n:center;"><h1><span style=3D"">WS09</span></h1></td></tr><tr><td class=3D"=
dd" align=3D"center" style=3D"padding:0px 15px;text-align:center;word-break=
:break-word;"><p><span style=3D"color:rgb(0, 0, 0);font-family:Aptos Narrow=
, Calibri, sans-serif, Mongolian Baiti, Microsoft Yi Baiti, Javanese Text, =
Yu Gothic;">Europe and Africa have to jointly promote a hydrogen transition=
 to boost sustainable economic development and a decarbonization of their e=
conomic sector. African green hydrogen transition could boost local economi=
es development, that=E2=80=99s why it=E2=80=99s important that both EU and =
AU hydrogen policies and development roadmaps have to be conceived in a cro=
ss-fertilizing way.</span></p></td></tr><tr><td align=3D"center" valign=3D"=
top" style=3D"padding-bottom:14px;padding-left:15px;padding-right:15px;padd=
ing-top:14px;text-align:center;width:100%;word-break:break-word;" class=3D"=
dd"><table role=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" a=
lign=3D"center"><tr><td class=3D"v" align=3D"center" valign=3D"middle" heig=
ht=3D"42" style=3D"height:42px;"><a href=3D"https://link.mail.beehiiv.com/s=
s/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad318-k_uEFhQwXXmy2KCANdJD=
FBQNSzjty4f1iv1Yb8iW_SjS5ptDQXLGyyPZviL_RWvh1qQDlrypKFfWyPN9BfQehPBHPb5Y3Gj=
eV4b8eOQAtB62XpLeWQL8u4Wh2onOD1yTCFzNhtzNsSNwB8FhnBQ05EHQCagEhGV-w5eFUjxg/4=
5j/2FA_5WcLRpunFHaTyAh3JA/h12/h001.zki2V4dheF5Xa80L6E6QNtcvoZI7Vd60IhWPTYZ3=
2To" target=3D"_blank" rel=3D"noopener noreferrer nofollow" style=3D"color:=
#FFFFFF;font-size:16px;padding:0px 14px;text-decoration:none;"> Read more <=
/a></td></tr></table></td></tr></table></td></tr></table></td></tr><tr><td>=
<table id=3D"ws10" role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D=
"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"backg=
round-color:#EFF2F7;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D=
"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd=
" align=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-align:cent=
er;"><h1><span style=3D"">WS10</span></h1></td></tr><tr><td class=3D"dd" al=
ign=3D"center" style=3D"padding:0px 15px;text-align:center;word-break:break=
-word;"><p><span style=3D"color:rgb(0, 0, 0);font-family:Aptos Narrow, Cali=
bri, sans-serif, Mongolian Baiti, Microsoft Yi Baiti, Javanese Text, Yu Got=
hic;">The RE-SKILLS workshop aims to address the demand for skilled profess=
ionals capable of implementing cutting-edge technological proposals in the =
dynamic landscape of the energy sector. With a focus on novel technological=
 concepts, the event will bring together industry experts, academia, and pr=
ofessionals to identify essential skills and capabilities required for succ=
essful integration.</span></p></td></tr><tr><td align=3D"center" valign=3D"=
top" style=3D"padding-bottom:14px;padding-left:15px;padding-right:15px;padd=
ing-top:14px;text-align:center;width:100%;word-break:break-word;" class=3D"=
dd"><table role=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" a=
lign=3D"center"><tr><td class=3D"v" align=3D"center" valign=3D"middle" heig=
ht=3D"42" style=3D"height:42px;"><a href=3D"https://link.mail.beehiiv.com/s=
s/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad3vONXJ1IzhwhLChX2LjQZMNl=
zyiMeXYZDILNhcsZ0mp8jtYcACUlE_s7c2h2LDr5OugDzqHEQpmKfsArCDw9beaY-isjFOSnicB=
CLAc9eEboYPXwSG4OYNP9jwRrwyzLMZNoDiD-nhfAUViIdZtOl18ZSOXI5wWcIOhj3IS9JWTg/4=
5j/2FA_5WcLRpunFHaTyAh3JA/h13/h001.g91e-EJK_5glJWYjZ7tezrSHpjtD3MlbOAvSJc4b=
a9g" target=3D"_blank" rel=3D"noopener noreferrer nofollow" style=3D"color:=
#FFFFFF;font-size:16px;padding:0px 14px;text-decoration:none;"> Read more <=
/a></td></tr></table></td></tr></table></td></tr></table></td></tr><tr><td>=
<table id=3D"ws11" role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D=
"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"transparent" style=3D"b=
ackground-color:transparent;padding:0px 0px 0px 0px;"><table role=3D"none" =
width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td cla=
ss=3D"dd" align=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-al=
ign:center;"><h1><span style=3D"">WS11</span></h1></td></tr><tr><td class=
=3D"dd" align=3D"center" style=3D"padding:0px 15px;text-align:center;word-b=
reak:break-word;"><p><span style=3D"">In Europe, the shift towards sustaina=
ble energy faces a chagenge: a shortage of skilled technicians. Studies sho=
w a need for maintenance and operational experts, with around 1.5 million i=
ndividuals requiring training yearly. For this reasson, a workshop, buildin=
g upon the Erasmus+ GreenTech project (2022-2024) focusing on renewable ene=
rgy training, seeks to exchange insights and best practices.</span></p></td=
></tr><tr><td class=3D"dd" align=3D"center" style=3D"padding:0px 15px;text-=
align:center;word-break:break-word;"><p><span style=3D"">Core discussions r=
evolve around improving training attractivity understanding industry demand=
s, evaluating current and future training schemes, and spreading practical =
courses. The workshop aims to promote collaboration on regional, national, =
and international levels to tackle Europe&#39;s technician deficit and achi=
eve carbon neutrality and energy transition.</span></p></td></tr><tr><td al=
ign=3D"center" valign=3D"top" style=3D"padding-bottom:14px;padding-left:15p=
x;padding-right:15px;padding-top:14px;text-align:center;width:100%;word-bre=
ak:break-word;" class=3D"dd"><table role=3D"none" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0" align=3D"center"><tr><td class=3D"v" align=3D"cent=
er" valign=3D"middle" height=3D"42" style=3D"height:42px;"><a href=3D"https=
://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpI=
ad0BQ1dc2LHWElEAyyRiasAD25-ZEt02kBowHMwRv1giuLX4JWQJec27vhiVgJnaqWi5r0qItZL=
MpsmhWLCr-8Nn1VtbjmtbR5g0rof0Ogu12TgxkizR9OAd9BsUU23M9uY1_DSnIopDujy5eLRywn=
I3NsD9Xh4qnmuxIGrPyG3Xew/45j/2FA_5WcLRpunFHaTyAh3JA/h14/h001.68GymTXYedYSET=
ZxkvyxyRfe_X55MK6B42HxrJAtn5k" target=3D"_blank" rel=3D"noopener noreferrer=
 nofollow" style=3D"color:#FFFFFF;font-size:16px;padding:0px 14px;text-deco=
ration:none;"> Read more </a></td></tr></table></td></tr></table></td></tr>=
</table></td></tr><tr><td><table id=3D"ws12" role=3D"none" width=3D"100%" b=
order=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=
=3D"#EFF2F7" style=3D"background-color:#EFF2F7;padding:0px 0px 0px 0px;"><t=
able role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpaddin=
g=3D"0"><tr><td class=3D"dd" align=3D"center" valign=3D"top" style=3D"paddi=
ng:0px 15px;text-align:center;"><h1><span style=3D"">WS12</span></h1></td><=
/tr><tr><td class=3D"dd" align=3D"center" style=3D"padding:0px 15px;text-al=
ign:center;word-break:break-word;"><p><span style=3D"color:rgb(0, 0, 0);fon=
t-family:Aptos Narrow, Calibri, sans-serif, Mongolian Baiti, Microsoft Yi B=
aiti, Javanese Text, Yu Gothic;font-size:14.6667px;">In this workshop we in=
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
PAj65s7AcSu-QbuD5O5oBB2KYBWoLpUXYT2I26A851yZhP4av-0T7CVcwoEzOXumvLCT1DyT8-C=
GFw/45j/2FA_5WcLRpunFHaTyAh3JA/h15/h001.IP_BK2NLey3iIb_o2USukT77xsRc1A3UISU=
RfcMaXu8" target=3D"_blank" rel=3D"noopener noreferrer nofollow" style=3D"c=
olor:#FFFFFF;font-size:16px;padding:0px 14px;text-decoration:none;"> Read m=
ore </a></td></tr></table></td></tr></table></td></tr></table></td></tr><tr=
><td><table id=3D"ws13" role=3D"none" width=3D"100%" border=3D"0" cellspaci=
ng=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"transparent" style=
=3D"background-color:transparent;padding:0px 0px 0px 0px;"><table role=3D"n=
one" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><t=
d class=3D"dd" align=3D"center" valign=3D"top" style=3D"padding:0px 15px;te=
xt-align:center;"><h1><span style=3D"">WS13</span></h1></td></tr><tr><td cl=
ass=3D"dd" align=3D"center" style=3D"padding:0px 15px;text-align:center;wor=
d-break:break-word;"><p><span style=3D"color:rgb(0, 0, 0);font-family:Aptos=
 Narrow, Calibri, sans-serif, Mongolian Baiti, Microsoft Yi Baiti, Javanese=
 Text, Yu Gothic;font-size:14.6667px;">Research learning to enhance innovat=
ion in cooperation with SME, industries and vocation training facilitators =
is a crucial way for the sustainable and digital transformation in all area=
s of the society. One of the outcomes of the AIRinVET Project (</span><span=
 style=3D"color:rgb(0, 0, 0);font-family:Aptos Narrow, Calibri, sans-serif,=
 Mongolian Baiti, Microsoft Yi Baiti, Javanese Text, Yu Gothic;font-size:14=
.6667px;"><a class=3D"link" href=3D"https://link.mail.beehiiv.com/ss/c/u001=
.o98ZmFoeX17ibF2OqvnWI0TLEH9wL5h71mwqwFdBKv_pXfR-Ug1a9VCDMd_ywh4oYMxWZk3n6Z=
qcjFJyGZMK07w5d37n4OF7fn9z5MmgPTRLXIaC2iTZ7rMWk9ml4ZKQX3sIvd6yaVk1uGvUtm4Rd=
NJ6yJVpXH5zR18_iL4TYXs_ttBkNZOjhgy22bF6Bd5e/45j/2FA_5WcLRpunFHaTyAh3JA/h16/=
h001.MPSpFjH4CBoJDzJnRWo-dNcpNlRwI_8zJa4w4noXpaE" target=3D"_blank" rel=3D"=
noopener noreferrer nofollow">https://airnvet.eu</a></span><span style=3D"c=
olor:rgb(0, 0, 0);font-family:Aptos Narrow, Calibri, sans-serif, Mongolian =
Baiti, Microsoft Yi Baiti, Javanese Text, Yu Gothic;font-size:14.6667px;">)=
 is a mapping of applied research activities in vocational education and Tr=
aining. The workshop will show and discuss approaches as well as results of=
 the AIRinVET Project and give best practice from Germany and The Netherlan=
ds on how to design cooperative curricula and research learning programs wi=
th the private sector for a successful implementation of sustainable energy=
 education.</span></p></td></tr><tr><td align=3D"center" valign=3D"top" sty=
le=3D"padding-bottom:14px;padding-left:15px;padding-right:15px;padding-top:=
14px;text-align:center;width:100%;word-break:break-word;" class=3D"dd"><tab=
le role=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"=
center"><tr><td class=3D"v" align=3D"center" valign=3D"middle" height=3D"42=
" style=3D"height:42px;"><a href=3D"https://link.mail.beehiiv.com/ss/c/u001=
.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad0OGvyvqDFNShBzjBgWsnOtMcy-EeLw1H=
IlO7CV4zPpndTr6R0wi0SlJt_mcRYiXCfLNiZxRM9OaN-GjWs7hOndqLmH76iBaWedmATbnPlZl=
zV9qxLVp_Q92KS61WmI_5bygyxhnq27q7oVZGKhZUdZguZ_QBaC_b5Mhll8k3xuJw/45j/2FA_5=
WcLRpunFHaTyAh3JA/h17/h001.BVaeTtl5Dnbvrokz2dSPG9rpMjtoKilYjLp2NhJbuU4" tar=
get=3D"_blank" rel=3D"noopener noreferrer nofollow" style=3D"color:#FFFFFF;=
font-size:16px;padding:0px 14px;text-decoration:none;"> Read more </a></td>=
</tr></table></td></tr></table></td></tr></table></td></tr><tr><td><table i=
d=3D"ws14" role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cell=
padding=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"background-co=
lor:#EFF2F7;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" b=
order=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=
=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-align:center;"><h=
1><span style=3D"">WS14</span></h1></td></tr><tr><td class=3D"dd" align=3D"=
center" style=3D"padding:0px 15px;text-align:center;word-break:break-word;"=
><p><span style=3D"color:rgb(0, 0, 0);font-family:Aptos Narrow, Calibri, sa=
ns-serif, Mongolian Baiti, Microsoft Yi Baiti, Javanese Text, Yu Gothic;fon=
t-size:14.6667px;">H2 VIRTUAL TRAINING is a digital training program develo=
ped at the University of Toulouse which addresses safety issues during main=
tenance operations on hydrogen vehicles</span></p></td></tr><tr><td align=
=3D"center" valign=3D"top" style=3D"padding-bottom:14px;padding-left:15px;p=
adding-right:15px;padding-top:14px;text-align:center;width:100%;word-break:=
break-word;" class=3D"dd"><table role=3D"none" border=3D"0" cellspacing=3D"=
0" cellpadding=3D"0" align=3D"center"><tr><td class=3D"v" align=3D"center" =
valign=3D"middle" height=3D"42" style=3D"height:42px;"><a href=3D"https://l=
ink.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad3Q=
FxjMtK0Pmim-MW4teUJMcsSGuwfZvrIggR1Z-TXl5isD-KnK_xT8UhfwDXIreaPiUH8XFKQEIXE=
eQwYlcXmnSQyYfnAggg4JyQvXaimSH1P2hoOyNSvCoL0gmjenKZyUXsTymHLkecSohKCq6FEVsj=
5Rwc_xFiqZ65tJ9ECfew/45j/2FA_5WcLRpunFHaTyAh3JA/h18/h001.8eJGATAZMGmyZnij9E=
ubgbOF6ObQbHxJsa65pau1o1Q" target=3D"_blank" rel=3D"noopener noreferrer nof=
ollow" style=3D"color:#FFFFFF;font-size:16px;padding:0px 14px;text-decorati=
on:none;"> Read more </a></td></tr></table></td></tr></table></td></tr></ta=
ble></td></tr><tr><td><table id=3D"ws15" role=3D"none" width=3D"100%" borde=
r=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"t=
ransparent" style=3D"background-color:transparent;padding:0px 0px 0px 0px;"=
><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpad=
ding=3D"0"><tr><td class=3D"dd" align=3D"center" valign=3D"top" style=3D"pa=
dding:0px 15px;text-align:center;"><h1><span style=3D"">WS15</span></h1></t=
d></tr><tr><td class=3D"dd" align=3D"center" style=3D"padding:0px 15px;text=
-align:center;word-break:break-word;"><p><span style=3D"">The workshop is d=
esigned to be dynamic and interactive, offering participants a comprehensiv=
e learning experience in the field of solar energy storage. The session com=
mences with an introductory overview of Ampere Energy products, which optim=
ize the solar self-consumption and maximize savings on the electricity bill=
.</span></p></td></tr><tr><td class=3D"dd" align=3D"center" style=3D"paddin=
g:0px 15px;text-align:center;word-break:break-word;"><p><span style=3D"">Ne=
xt, there is a specific focus on the algorithmics of the Smart Energy Manag=
ement System to transition into a presentation of real-world successful sol=
ar self-consumption case studies. Installations that incorporate PV panels =
and smart batteries are presented in residential, industrial, and energy co=
mmunities locations that have achieved remarkable economic, ecological and =
grid energy savings.</span></p></td></tr><tr><td align=3D"center" valign=3D=
"top" style=3D"padding-bottom:14px;padding-left:15px;padding-right:15px;pad=
ding-top:14px;text-align:center;width:100%;word-break:break-word;" class=3D=
"dd"><table role=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" =
align=3D"center"><tr><td class=3D"v" align=3D"center" valign=3D"middle" hei=
ght=3D"42" style=3D"height:42px;"><a href=3D"https://link.mail.beehiiv.com/=
ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad3vYVr6HfdpfBeDZOZfgHzCX=
q5p60xQoA20xZrmCF7pvYBRihuXEAMcCWiwln-tzHhircOQ3LZNplvbaJGNQw67zK7sfs8GlWhP=
VVWQ8lUq-3QtDtcwIsvx1LOmnVFLseBz32Fi14-lbu8YclFKyzUM2ceG1uhshh-qw5RNi0Cs2w/=
45j/2FA_5WcLRpunFHaTyAh3JA/h19/h001.evtDDFwNDDGaM_ExyvgrSWRBMh8PuSOO66v7wQe=
dqKU" target=3D"_blank" rel=3D"noopener noreferrer nofollow" style=3D"color=
:#FFFFFF;font-size:16px;padding:0px 14px;text-decoration:none;"> Read more =
</a></td></tr></table></td></tr></table></td></tr></table></td></tr><tr><td=
><table id=3D"ws16" role=3D"none" width=3D"100%" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"ba=
ckground-color:#EFF2F7;padding:0px 0px 0px 0px;"><table role=3D"none" width=
=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D=
"dd" align=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-align:c=
enter;"><h1><span style=3D"">WS16</span></h1></td></tr><tr><td class=3D"dd"=
 align=3D"center" style=3D"padding:0px 15px;text-align:center;word-break:br=
eak-word;"><p><span style=3D"color:rgb(0, 0, 0);font-family:Aptos Narrow, C=
alibri, sans-serif, Mongolian Baiti, Microsoft Yi Baiti, Javanese Text, Yu =
Gothic;font-size:14.6667px;">Many universities worldwide offer Master degre=
e courses in renewable energy systems. As English has become the generally =
accepted language in a globalized world, courses being taught in English ar=
e attended by students coming from all over the world. Although we live in =
a globalized world and the international Master degree is a product represe=
nting it, not necessarily there are valid global energy solutions. The aim =
of the proposed workshop is to shed light on the technical challenges of th=
ese Master courses and find solutions which suit teachers and students alik=
e.</span></p></td></tr><tr><td align=3D"center" valign=3D"top" style=3D"pad=
ding-bottom:14px;padding-left:15px;padding-right:15px;padding-top:14px;text=
-align:center;width:100%;word-break:break-word;" class=3D"dd"><table role=
=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"center"=
><tr><td class=3D"v" align=3D"center" valign=3D"middle" height=3D"42" style=
=3D"height:42px;"><a href=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjLy=
NeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad3fXOkr4GgB-7XO21rmThoJGJ4X-n3S2CrJ-MpGp=
RKu7vf8YLrwyZwJRzHcGf2gmdkmELBQ8UtwoHQboQTPkEXZAX6UxUhEex6oNtbIedumn2oL46Kj=
4a239llgG--v-BY4m9yQeJAWcb5gToMYWRE_Yj5x6kFZiHrlnwzWKgo9cw/45j/2FA_5WcLRpun=
FHaTyAh3JA/h20/h001.We-GIuQQkWkzdJZBoRUdKV3-XECvYK0cQdxD42eF1A0" target=3D"=
_blank" rel=3D"noopener noreferrer nofollow" style=3D"color:#FFFFFF;font-si=
ze:16px;padding:0px 14px;text-decoration:none;"> Read more </a></td></tr></=
table></td></tr></table></td></tr></table></td></tr><tr><td><table id=3D"ws=
17" role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" style=3D""><tr><td bgcolor=3D"transparent" style=3D"background-color=
:transparent;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" =
border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=
=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-align:center;"><h=
1><span style=3D"">WS17</span></h1></td></tr><tr><td class=3D"dd" align=3D"=
center" style=3D"padding:0px 15px;text-align:center;word-break:break-word;"=
><p><span style=3D"color:rgb(0, 0, 0);font-family:Aptos Narrow, Calibri, sa=
ns-serif, Mongolian Baiti, Microsoft Yi Baiti, Javanese Text, Yu Gothic;fon=
t-size:14.6667px;">In this inspirational workshop you will explore three ap=
proaches to integrate sustainability in education from three perspectives: =
reflexive, SDGs in education and the relevance of entrepreneurial skills. Y=
ou will review the three approaches and find out how you can apply the thre=
e different perspectives to your own education or in your institute.</span>=
</p></td></tr><tr><td align=3D"center" valign=3D"top" style=3D"padding-bott=
om:14px;padding-left:15px;padding-right:15px;padding-top:14px;text-align:ce=
nter;width:100%;word-break:break-word;" class=3D"dd"><table role=3D"none" b=
order=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td cl=
ass=3D"v" align=3D"center" valign=3D"middle" height=3D"42" style=3D"height:=
42px;"><a href=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0In=
FUCEtII-f83mS9u8hVzFrpIad1AX2yZzg6Bk7H9sSPBu-tnnwL1bWuMiWMzvIIvUVAexk6p4FYf=
tz-dua3PbTTpTuF0JzD2__b595Xd_8HnW6n0l7ovounhZSeg-mXY_GQ0Hgc5FY_GJan3HRd2iHA=
mBwWHLeKn0ssaZnljlrVN1LRstq4MT4kPyYYuh3-eqTxeDA/45j/2FA_5WcLRpunFHaTyAh3JA/=
h21/h001.JavxaOLTAuDZ0eERbGUoIMQ-Z_Pg0zFXBuYi41PD0AU" target=3D"_blank" rel=
=3D"noopener noreferrer nofollow" style=3D"color:#FFFFFF;font-size:16px;pad=
ding:0px 14px;text-decoration:none;"> Read more </a></td></tr></table></td>=
</tr></table></td></tr></table></td></tr><tr><td><table id=3D"ws18" role=3D=
"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" styl=
e=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:#EFF2F7;paddin=
g:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" border=3D"0" cellsp=
acing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=3D"center" valign=
=3D"top" style=3D"padding:0px 15px;text-align:center;"><h1><span style=3D""=
>WS18</span></h1></td></tr><tr><td class=3D"dd" align=3D"center" style=3D"p=
adding:0px 15px;text-align:center;word-break:break-word;"><p><span style=3D=
"">Experience the strength of networks in solving needs and demands on mult=
iple themes outside and inside the main theme of cooperation.</span></p></t=
d></tr><tr><td style=3D"padding-bottom:12px;padding-left:37px;padding-right=
:27px;padding-top:12px;" class=3D"ee"><div style=3D"margin-left:0px;" class=
=3D"edm_outlooklist"><ul style=3D"list-style-type:disc;margin:0px 0px;paddi=
ng:0px 0px 0px 0px;"><li class=3D"listItem ultext"><p style=3D"padding:0px;=
text-align:left;word-break:break-word;"><span style=3D"">Build on your skil=
ls to be effective in cooperation with colleagues and peer professionals.</=
span></p></li><li class=3D"listItem ultext"><p style=3D"padding:0px;text-al=
ign:left;word-break:break-word;"><span style=3D"">Experience how to be effe=
ctive in expressing your needs, talents and propositions inspired by exampl=
es in nature and IT technology.</span></p></li><li class=3D"listItem ultext=
"><p style=3D"padding:0px;text-align:left;word-break:break-word;"><span sty=
le=3D"">Experience how to evaluate value propositions on their effective co=
mmunication approaches.</span></p></li><li class=3D"listItem ultext"><p sty=
le=3D"padding:0px;text-align:left;word-break:break-word;"><span style=3D"">=
Experience the power of connections on a personal level within the professi=
onal arena.</span></p></li></ul></div></td></tr><tr><td align=3D"center" va=
lign=3D"top" style=3D"padding-bottom:14px;padding-left:15px;padding-right:1=
5px;padding-top:14px;text-align:center;width:100%;word-break:break-word;" c=
lass=3D"dd"><table role=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" align=3D"center"><tr><td class=3D"v" align=3D"center" valign=3D"midd=
le" height=3D"42" style=3D"height:42px;"><a href=3D"https://link.mail.beehi=
iv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad38d6CKfeFKQMZHtf=
RVVnTPkLgA3SKEpOsSWe12pq0gduL_quILhroca11oUMv1CB0O3NqAPhAl7A2STgUzp-0UUKgsW=
CzVyDlHpGWpBa8j3AEzxoCXQhxKucxSnzGBwCRZoPW9aW7CdOWYMZe076af4GbeCXacbUou6WZ0=
ao5Zdg/45j/2FA_5WcLRpunFHaTyAh3JA/h22/h001.fXgTj3Bt5irZBrZCRvKePt4b8fN_BsYm=
1aLfb-kpp0E" target=3D"_blank" rel=3D"noopener noreferrer nofollow" style=
=3D"color:#FFFFFF;font-size:16px;padding:0px 14px;text-decoration:none;"> R=
ead more </a></td></tr></table></td></tr></table></td></tr></table></td></t=
r><tr><td class=3D"dd" align=3D"left" style=3D"padding:0px 15px;text-align:=
left;word-break:break-word;"><p></p></td></tr><tr><td class=3D"dd" align=3D=
"left" style=3D"padding:0px 15px;text-align:left;word-break:break-word;"><p=
> DaElp </p></td></tr></table></td></tr><tr><td class=3D"b" align=3D"center=
" valign=3D"top" bgcolor=3D"#438ac9" style=3D"padding:0px;border-bottom-lef=
t-radius:10px;border-bottom-right-radius:10px;"><table role=3D"none" width=
=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"center"=
><tr><td align=3D"center" valign=3D"top" bgcolor=3D"#fbbb16" style=3D"paddi=
ng:12px"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0"=
 cellpadding=3D"0" align=3D"center"><tr><td><span style=3D"padding-left:1px=
;"></span></td><td align=3D"center" valign=3D"middle" width=3D"75" style=3D=
"width:75px;"><a href=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiH=
ZgnZ0InFUCErwqFgNAb4LwukZDHa9syLjlXR5k_hL4aVj-QsuNNcaTrW9X-OCZytN_rlLxGmtar=
JrPihUsOEYG6CzoujJeg8gJwmabIzRDd80oSc3RYFJ7T1znJuBpfBPfTT-WD02VKKxIrgpfIMC9=
-QJtTq-kY9mFS4h67bDL_SP68WxGrLL3Of06clmq-b9jMiv-YKBSPQ/45j/2FA_5WcLRpunFHaT=
yAh3JA/h23/h001.E_KW316r_qZqwb9RL9-5_srF0vrGugive5XT_H9FF7M" style=3D"text-=
decoration:none;"><img width=3D"22" alt=3D"fb" border=3D"0" style=3D"displa=
y:block;max-width:22px;" src=3D"https://media.beehiiv.com/cdn-cgi/image/fit=
=3Dscale-down,format=3Dauto,onerror=3Dredirect,quality=3D80/static_assets/f=
acebook_light.png"/></a></td><td align=3D"center" valign=3D"middle" width=
=3D"75" style=3D"width:75px;"><a href=3D"https://link.mail.beehiiv.com/ss/c=
/u001.DkovfOe42zeF8J2PGc-l9JWeF4Fr-3YAtmHtZ2Sv9HWS82eIFxttnHWrIIQXrZT6ByPO9=
IaiKIb6411H-Y1F-xyZ_4h5YgpQ3H-yLh09RU6dbr-kgaHQmZgGeq_2XPiG0E5j02gLVyKm8dfB=
SZ7QQL0Xy_RG-r4TPmZwWrf84TXd_jmaFyIrFTPwo9rbYNAW5luZ9DqeN36wDQcWOMqHuuvsJWg=
GMfNGPVYCIUcPFfO83SlWSQQL2_k8gpbycapY/45j/2FA_5WcLRpunFHaTyAh3JA/h24/h001.l=
q7NFEtfuUDOXOLmqsHqcKd5692yKAgZCsOCL1C1BUo" style=3D"text-decoration:none;"=
><img width=3D"22" alt=3D"tw" border=3D"0" style=3D"display:block;max-width=
:22px;" src=3D"https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,for=
mat=3Dauto,onerror=3Dredirect,quality=3D80/static_assets/x_light.png"/></a>=
</td><td align=3D"center" valign=3D"middle" width=3D"75" style=3D"width:75p=
x;"><a href=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUC=
EgQL3fCPI0UGohOuyW2ouphYybemeBB4ZMDoBTQY0JS0bHFoVLDfCyK6TRiAhZmKE6XTaXy-999=
lEhk2imgQvOuzPswMMxEn0-Ae0fy6E7YW3KwXYEOfSdQS_wIVUWzHj5I41vyJKDDIExM4w_OPd4=
0H9qGi5yATlAI-PBaXMc8CjQfcRV97r9_LxIt0ZOfQ5A/45j/2FA_5WcLRpunFHaTyAh3JA/h25=
/h001.OX9jN6-2iz7bcNRtqnx_aRHi8ZW2Si66lj7HSgiUxVQ" style=3D"text-decoration=
:none;"><img width=3D"22" alt=3D"ig" border=3D"0" style=3D"display:block;ma=
x-width:22px;" src=3D"https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-d=
own,format=3Dauto,onerror=3Dredirect,quality=3D80/static_assets/instagram_l=
ight.png"/></a></td><td align=3D"center" valign=3D"middle" width=3D"75" sty=
le=3D"width:75px;"><a href=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjL=
yNeiHZgnZ0InFUCEm2dDc-sVKPd-Sw1-4Z05tGknkZ8i31iC4ZoYOXs_yCE1KJniN4EfcFzIiiG=
ROI_JwEUnQ0pN4BlSU7SPgGWrNSbLvNcLsCNrWQ3wikzNdA6HfwYwAPSLNtwtwIC-dx8CbuGIPn=
-NhWmo1zutt916G9mhs302RkyNoeApon7PMJU6SFGHWfBP6tnflhqDbVSVPZ13Er5lBdmKt5oHX=
5ZfMU/45j/2FA_5WcLRpunFHaTyAh3JA/h26/h001.2IcWGzNSwDajh4cphm2Hr7FmdSubYwHX6=
Ryk7sFSsXM" style=3D"text-decoration:none;"><img width=3D"22" alt=3D"in" bo=
rder=3D"0" style=3D"display:block;max-width:22px;" src=3D"https://media.bee=
hiiv.com/cdn-cgi/image/fit=3Dscale-down,format=3Dauto,onerror=3Dredirect,qu=
ality=3D80/static_assets/linkedin_light.png"/></a></td><td><span style=3D"p=
adding-left:1px;"></span></td></tr></table></td></tr><tr><td height=3D"10" =
style=3D"line-height:1px;font-size:1px;height:10px;"> &nbsp; </td></tr><tr>=
<td class=3D"w" align=3D"center" valign=3D"top" style=3D"padding:15px;"><ta=
ble role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" align=3D"center"><tr><td align=3D"center" valign=3D"top"><p style=3D=
"font-family:'Arial',Helvetica,sans-serif;color:#FFFFFF!important;"> Update=
 your email preferences or unsubscribe <a class=3D"link" href=3D"https://li=
nk.mail.beehiiv.com/ss/c/u001.ja41VZAtR_qfVYIA2l6dByPcgm40JQbxLouneWPj9NO-Q=
aAKU5v3Uihq7_J7Kxc8CRkPHlRsPxG4L_kuCxBsVGrbkPKGltLEZdYurEEZe0ohH7Q9oOYjXpBs=
dF9f1XjrN0F-xqwnBuAa_i-kaVYEO8cjZBYqwQ4e-miYY71Jp8P2ItrT_-tvSHmy6iH30gRIdTS=
UjQE4iIL6clXfYvXqU9HqFn1jmQMa8OdT-RElIX6NzwZUynUYpo301-TXL3bUW2XonLtDRIz7vB=
sHRyCiTLbOj31BLgpPRXAa0A7znE9JD0F566MbR7cQcSZPv6j755CWn-snb8ypxhzE8tmEz2Ngd=
lASqqABLV6EoYaLcmePWCX9h3K9ziJbRPETcrcz9KQff8SIugv1q5t7IQOW1VpBjrb9EhC3oB45=
Fs1IznrjXw1UngBXFFuXzPU9v6Q_ikx_QdQZfmN-ROxtv07wMuuFRf8ReHw1WcVjHKuuPf4KWlH=
SS2uPoeSXZKz07Va5NAgjimosEH-nDX7TlTiOAHo5wBNFJuJyeg_F5jZOPOjjX0pwnfWRF3tXrf=
iTHkV5gwAQEu7l5wvfsVRJnqS_9ikgylEt85oLiy30XcNMFQ-SXb3wd9i3rFoIg_gqrAoXZjeMh=
yPB_9SUb86KD7GkbUPV3mQtGtKo6yDEspYhhEuSqqkUZDcB6fKPlddCix-XdiJY8x5BoksIce1V=
a_DT3A/45j/2FA_5WcLRpunFHaTyAh3JA/h27/h001.9p0x82ej_exM01ZMwebzwaPotHDgXeD2=
191IxGNUlfk" style=3D"text-decoration:underline;text-decoration-color:#FFFF=
FF!important;color:#FFFFFF!important;"> here</a></p><p class=3D"copyright" =
style=3D"font-family:'Arial',Helvetica,sans-serif;color:#FFFFFF!important;"=
> &copy; 2024 SEED Conference 2024 - Valencia </p><p style=3D"font-family:'=
Arial',Helvetica,sans-serif;color:#FFFFFF!important;"> Universitat Polit=C3=
=A8cnica de Val=C3=A8ncia Camino de Vera<br>Valencia, Comunidad Valenciana =
46022 , Spain </p></td></tr><tr style=3D"display: table-row !important;"><t=
d align=3D"center" valign=3D"top" style=3D"padding-top:20px;" style=3D"disp=
lay:table-cell !important;"><table role=3D"none" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0" align=3D"center" style=3D"display:table !important=
;"><tr style=3D"display:table-row !important;"><td class=3D"u" align=3D"cen=
ter" valign=3D"middle" height=3D"32" style=3D"height:32px;display:table-cel=
l !important; max-height: 32px !important;margin:0px !important;"><a style=
=3D"line-height:32px !important;text-decoration:none;display:block !importa=
nt;" href=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEj=
moJcSnOYaaJNeZkZa1HU3UIQjsnP9DhjOO8YOrNIC3GjM26ZvFffn8Owei81a2rXUR8OsB2hLfd=
srgcXwb4N45m7uNYVNbrNPXUfkLW5KuQ9LPBKloK0V0agsKyumBnFGL9b84ukLarXR3repZ-MW7=
5URQHVESDp5sQijgjtN3nsBzSB130kt4LbRiE3J7Dg/45j/2FA_5WcLRpunFHaTyAh3JA/h28/h=
001.FoEAUqsJCzrr1-MYhokeEUDm4uhyf7dCLxD78RSG3a4"><img src=3D"https://media.=
beehiiv.com/output-onlinepngtools.png" width=3D"16" alt=3D"beehiiv logo" st=
yle=3D"display:inline-block !important;max-width:16px !important; vertical-=
align:-3px !important;width: 16px !important;" border=3D"0"/><span style=3D=
"padding-left:11px !important;display: inline-block !important;">Powered by=
 beehiiv</span></a></td></tr></table></td></tr></table></td></tr></table></=
td></tr></table></td></tr></table></td></tr></table></td></tr></table></div=
></body></html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/Z6rk0s2wQIqJvKFvrCQBXg%40geopod-ismtpd-2?utm_mediu=
m=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailhouse-=
dev/Z6rk0s2wQIqJvKFvrCQBXg%40geopod-ismtpd-2</a>.<br />

--4d9a6178a51e9a4735e19c2191048d146d2fbe66991027fbdc59e37405fc--
