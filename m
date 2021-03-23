Return-Path: <jailhouse-dev+bncBAABBM6H42BAMGQE6E6FM4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x740.google.com (mail-qk1-x740.google.com [IPv6:2607:f8b0:4864:20::740])
	by mail.lfdr.de (Postfix) with ESMTPS id 33ADB34596B
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 09:15:48 +0100 (CET)
Received: by mail-qk1-x740.google.com with SMTP id x11sf1388189qki.22
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 01:15:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616487347; cv=pass;
        d=google.com; s=arc-20160816;
        b=qBMbHHXVJ9sA6S/b1J3q+XPwVYjQBSPMxRHFrNjmuK03koB21ZT+fWhof3/rKl87iD
         e2U/TH8G3JlyIlzOsD7uWn8445YnMNF6pH8B4krYShFfG/xhfd7zt/kMM0+WIKd5cB/Z
         CEM5lAq50oh1cDAOyav3JGAqOD/R5YPlVE110A6P0TDbnrAmck5s8OSEh7ZZUm10lBnl
         0UB3w6M06aU0bjPhZBrovyAQ4nLv0Csd2Bm7gJgaXqdxy49cf9l7OqdL0BBgu4VPqIkL
         2nRe9O1IDpQJ6SrR6tXOJ+pNoeiBf/zVOLEoecyp9EItw6un05QvzwOUso91/BRIMYzZ
         Rw3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references
         :content-transfer-encoding:mime-version:subject:message-id:reply-to
         :from:date:dkim-signature;
        bh=b99wpD69NQIUm+SyBTl5wlvM14YMwLUvfaNlbZw8blQ=;
        b=BUM3qHrBNwDaQSG659e3TPwBLeHTTPBsNTNn6tphVRU4MQl4Z/p/CYHM9sR2HQp6LX
         QiMkfz0Ci7WBOVSvV6KtJWTceF3PYqyHBla7F6N1QzFX36FBqdBatgHGFnVwEPxsZ9oj
         iJ+jR9IGjwLtcb77Pp4VMCA5imi0UrC89dW2pk3umt/nY54DMg/MduTT1utnDetmBBIT
         eazKOAUB/IHeKj36O+2VVSGC13NDFgC/yf1iqy3JoLc8yR6huM0+2CfZecCZEwTsAQL8
         R7TQ6AlYpUHohdf3PCkKlajh9H7oTUXypcwKq438WvkDmb5KHVYXcnDRfjNqpq57GOSX
         5lPw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@yahoo.com header.s=s2048 header.b=bqstHl1B;
       spf=pass (google.com: domain of mariamsterbenc@yahoo.com designates 66.163.191.173 as permitted sender) smtp.mailfrom=mariamsterbenc@yahoo.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=yahoo.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:reply-to:message-id:subject:mime-version
         :content-transfer-encoding:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=b99wpD69NQIUm+SyBTl5wlvM14YMwLUvfaNlbZw8blQ=;
        b=dpQWv9iby3T9n+tgHx8qOVjcFbc7SwX9Ow9BIxn+QVHdJ8e4gZiw+KRTFdNbC+zOEy
         n1c2w6PDppQDAlRW/DksgjORFbmRcgxo2bsghjwTb+/Cl474qlinuFidRRS6J83Vbv7W
         DgM3KUv8VaGhJ/D4ohwejNRKDQgOsujlxhy6sqgjrZCd++PGNcKR51aDBuYTYkZX1sFd
         j5x7Dw4oPA+eIrNpPQZ+TZsO/7eu/gM4Rjis7GQ+pr9OG1Az8SZoKvuq8jkDebAwTT15
         YO3wnlWeVTbRszt+0HakJg+HTVHN0uOsFjHI2bsCle56MUzZ+H6F6Ta9bQ0kFqeiS9RX
         7wLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:reply-to:message-id:subject
         :mime-version:content-transfer-encoding:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=b99wpD69NQIUm+SyBTl5wlvM14YMwLUvfaNlbZw8blQ=;
        b=Hm3NBvNysMV9Ylf5A8gcO6VZvOi9zSL96FvFKuqAhxseql6ntvLgt8PoXJmZm1jujx
         ClA1ACEOFb7nZq6BQQsPEfXDfEotXo9PJtvvq2I2fe7FJJyqMxD3xw8ruNk9k9eQlvNm
         vGCUUBWTSMLh2ACElxmbanmtSPH78Vg/1PKHzZDUOavhAwJLO/q2lE43F8x3hNKGWOiY
         jhjH8QNuflM55Ji6xxnXmVso9D0plalCEaZv9qym5cctFvSavyR3gLH8Bt8U+7j594YS
         o8pRiJgL7eKVxu1+ZbtS9rm0ImlVPhQ9aI4WxE8+ZD3hKIgaEeBUUKqRkeueX2a+FBBY
         9i6Q==
X-Gm-Message-State: AOAM530hhi0TxaMt8ZAyCnDoVWDH8LFwqlE645c5z7anqlqay3U+NHGN
	Ntix/fDJicS05wNPFKNsRrw=
X-Google-Smtp-Source: ABdhPJxIF7CbMy8paGtlynt9K0R4TlY47R6LHz1N3MEYo/78JacXk+pijihAVZtkqHhk1lhSPgH4Xg==
X-Received: by 2002:a37:6887:: with SMTP id d129mr4208289qkc.252.1616487347222;
        Tue, 23 Mar 2021 01:15:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aed:2f03:: with SMTP id l3ls5885614qtd.4.gmail; Tue, 23 Mar
 2021 01:15:46 -0700 (PDT)
X-Received: by 2002:ac8:431e:: with SMTP id z30mr3312540qtm.216.1616487346790;
        Tue, 23 Mar 2021 01:15:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616487346; cv=none;
        d=google.com; s=arc-20160816;
        b=x7i4MyLntna8coiHr1+JgtzVVZeS+o68rth/jUjvKtYUvszYxEP62KC21uBoHDKUv1
         bg20GX90XZoMQ3XJNRlWnHRwy8YP0i23ZCq7xT5NHbozlQFupPw7EU0yNgyi2mlUicWt
         Y/e6Kuj3k+LKfOnocVgTsET5nwPIgOHwKfuN3iTCzC/1t0KmoDYlnTp4Fta64RPnth03
         jj0E5DkRwt79Hy1QNcd5yY1p0fp0Yh867dkU03qoF6wO7EVhyR562tZPGf25pU4xWoAU
         Ietw4xIuOixuJ9jZ4c9Z0bJ5BF6LhxI/QEtGQkbS3rzpOHc4to6soMxwmFxSi7iweU5G
         6tEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:content-transfer-encoding:mime-version:subject
         :message-id:reply-to:from:date:dkim-signature;
        bh=JDwVg1YeWij1bzVg6CXUMNyKMzRE7Mu8E1jiUyK+aHk=;
        b=vafURKVfgw3OjEgMqosq53cx7vw8K8wlEpe/hu/52EIw/tabENDCNRlJ2HggmV8+f8
         YNkner+wpvZF88Co6poJuMfNo3R7+UzQLYVW3bI1rwvuj4XvPae4m2GBZ5N8j152+5PC
         yTJF52FD/rKysMtNAbcHKY9J6WtX67v7ylsMU0AmJDEVqHQN+Dmo1LAjU8bO+VJtQ+0G
         04reW466fPVMev7OAA+sQKb1jDakmflfkGobKvJqEpdusPhEAAocJ3M61CjIdmMtIm6J
         rrkqN4F9XBRLt1xAY2paftQqMaW+0lL0CA/HPwqgE4KOk0M+M1tmZxGNGhOg2r2Y3FyQ
         g/3Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@yahoo.com header.s=s2048 header.b=bqstHl1B;
       spf=pass (google.com: domain of mariamsterbenc@yahoo.com designates 66.163.191.173 as permitted sender) smtp.mailfrom=mariamsterbenc@yahoo.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=yahoo.com
Received: from sonic304-47.consmr.mail.ne1.yahoo.com (sonic304-47.consmr.mail.ne1.yahoo.com. [66.163.191.173])
        by gmr-mx.google.com with ESMTPS id r26si407174qtf.3.2021.03.23.01.15.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 01:15:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of mariamsterbenc@yahoo.com designates 66.163.191.173 as permitted sender) client-ip=66.163.191.173;
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1616487346; bh=9CQnlkWkMI08wo/Wzecki1oz8V6nSlU0ko8yZUKTC/J=; h=X-Sonic-MF:Date:From:Subject:From:Subject; b=TRLBC4ixqoH9wHrbc29D8h+gT3y2MP5tJTYv1y1H2+82MIDy6qpjfGw8K4EOAp4dKchIo8VweKPnAJ3AsvG3FIFeIjGsvn9h7hiMeF1yGPwx5iAWHVN9O1r2eRZEzB/to6JdNlk5+9aivqgkBXRIu1KjEXs6P6rYISOsHZ39r9JOUBAbz5dAQHcaHOt0pSDPR25zfu6JFUkiJVyBjRBJQ0AWSxzLHzsXhCiD6mvOOSWU/gCUJz9G0pNeQjm8eZiTh7HKB6OxR2d7bm65eZSt6RW9wkWkNX/ewnqU1S3KTxM+ptCO13DqIAamD6dL93rTr5OAOFDokTAF2xGYikh7Pw==
X-YMail-OSG: kvxcCOwVM1niuOE2915OfCQfq1d7ewYQosYKnOSuGjQG_PG.N_e._B_niPFcd8T
 8itH1HymQMG8o9ZUdjqzn.5kljl.5xGQtB9mO5LapIvZ2PvBMozpo6WCZE2sTDpICP6SL804jnk1
 k8D6bUITAAc3U4vKTOyxT5w03cDUgAzea19VvTeWZ1WQ0OLdBFv0daYVj5As5Ief0kYfJ2XDsqaH
 zhrzIbosuEDZW6q.rvmpTEvXQH6yK2ZU64TB84vvx0S.JgjF_iAzgquIKGo6C0E8AoeFdrbG6FFs
 MbfDLFJ33xOjCWIvJYJqnRDHvYLE4gPlD1CXqFjCVM6bY8AjSxHukjyBqGAe6AdM78NSw6I7FyhP
 8LsiHKaYWtTyjuQXHk10.mabUuGm5ts2qduUfVPq1o99X_np6_myj.fXOlcJw_XZKCuQWiBg64XT
 KdnjsIVjFRWY7zoKA6th5IoLXu6kERQtgq8yGF_y9LpI9hFpF3DGyMoADab01pGR.LsxBaZ5ymog
 sJ2nJ_JHHwph2ksJbBJ2OAQYs9L1ISxtaBVew.dccVOagc4PpN.wNrAvS5vopVB5u3Zbx6x8A3ug
 ugEFzIz9nRDMmc9H3hB82UJ2a0Rr1m..y7T5hw9A43G4AH.n.5Q6yPuczNvsZ4hJWEUlR5rH3w51
 sOYoQ7q6wL_DgmD4pl.4uyuM6L3nHRWxT0rgRJ5HEx.cXVtc91EaV5vqurm9EMu7fFZbCxuc4wll
 npFUGAL3J6De_NvnJBWNnjykv5Ack43JXOKeC42KKqDp9pTKebksXTsr9Wsg2qZ5vfonO1k0KXnT
 jXFrCo6jN5xJldZ8YNhddepwz_4a88dF8NRwXTAxu7DgK.xj7LOIFxxCnTYH9p57US7aNrm2GTMn
 pbJD0ejHEVEB7w136lm4XII3okm6c_XyfcRGib9nZ7JMDwu7D3cYvLdy8fmat4KrmK2IStmcrkqd
 9Zkdlf1ImbnSyKj2gZxv8d4.Dn5.6oapzMpNLOBQP7SzEKNeNiVMGDl7XKH0gyhkDoTYK7eOZMxq
 G5zhqOXvpzgamMmYYd3B114qBu_YWNkJva6G2JIXePwglRqrFhh2.sGFIFUCuDF2E.FIQOZHzEWV
 GhpI6Nqkvgu4MI_VYTC6oru9D.rBs2gw3YES_f2_36BlXCKqOwFw3frZxRFZ1pGvveAy7KIczuWL
 O7KREOeSppNTyeE1iyf.7DyY1iLlqAAZ2ZZEb2S3hnNHCxSdFr5bMOgpHvgWQx9zTI3yy6lzyN9A
 0EjEH1wSqZUUhrxuZBHT2m5cM9_AXhDJg21u3avvKGmQIp3byNqrnF5.77hv4O0apaKkpk6HoEVS
 w.Ze9lw9M19U2WhB7CKvGfsCGOCGQY5iU8aVZ6NhfEQg.3uqgmoKkB.wzql9VCyD1YCMkcolR_rH
 0HfXn91pFP1HqjslRwwFGDkvCPGxu_xnTrScXGTm2gucy39PnBuH7E40LYmxhwfnl08weNVOKWxE
 8KIZV.vIbqhcz7CNoc4JS02.9nGc0oVVnbGnabNL2pYz2PKCRuTNm5Tch9v7yECAm3UDiQgFUxG1
 2LiX1E6qkHx.G3pYlSAGTXlvgshm.U.LXPzxMZ_De2.EhQspuvnhOqlRDtMROjr.czs505QspB4c
 huF_l78tCYoK75T0r7wDL8q7kBbUXkB4u36rsxFp5vvGZfvHExW8dRlkx89T0e6HK.t49OlXwGwZ
 R2V5vj.CelSa91snhqNev6T4mYDGgLiKPsNqWyuLvBtsJyFQNEkdAAy5FvwWSxd_5q22ZdKd51Mc
 rCZygYuYBfu_gYTfzxrDERQLnpbLF.x0lXEJevelOYu5oGN1FHzv7Lnx9wtmSGO.s88_oCnosj39
 l7pxivRwuYHXjD.fKYqTGCY71aOLYphymUU2l2isnKECkZfB8W8GOQTEt.O325LpNziAE9sDbe_p
 RKKdIxb6w5UiyYurP1d4rjdGKvCkoE0zikAQNRo_Z3gvFXc3grj6s0u8mfr1Tbs7fI55PTKMzBqA
 2fQ2leCcBnruTHm5KOgJxYS5699zcqZsQYXJZBCRifIEJIlik7gRd.Ial9bcihqsoqLAVAQWOel.
 p2FBvNct33gzdVwVik5_75ZQrVYlYprwmSM_LL65hcB5mVB7Qt761NcuRy_A1BX.FDK4JoxEe.hi
 UlpyDJB4pF9gsv4YDN6OXZwKDjRRyUh3NuQLabCdLfDdNX6BQokPcuuX.Gqrr6VdNrVD0jWJEl.H
 DIsOuF7M1YkLX0lkxyAZyCVDMENz5sYgP8lHYqWzLGNtJFOKQIs7Pj66VgTJ24ObNScUKwFIUSkn
 kIRi3uRMp.5hDZHziuEFAvbuwiDBtRdxTXk1uad6u16yr9FVOT_TqCn20AYi7EJxFgyp9Wx9BgU9
 lU71jI22CZZJQGyr7_ExEGP.QiSAR7LlbQ6mZjvHvH0GyLf7inoHr3Sx2aXka13kZQMK3b1z25FI
 bYzFl.mZqaiiDnlnILfi9Fi5kzHcUXcEC.z6PLQF3DjlglF1xSSHPz6HVpcRiBZZesQMJ1KxspR7
 _vKTdMLDZ11R3xR1_yAEFcWIuSgfO93fw8mKgyM9IZ57ZQNjyiIsGiSG.s1eLwlPqe7kOizRYNCq
 D0OH1DoBGWtZ9xq2GUrX8HN1YVdt3cjv52eCMlF4WmHJ4N5w672oCsF8pIyTC8raZpjxIkCAcGJi
 kt5P9vX1wDORtG4R9XFzfsni6utkmmFa6E9vnzTXRoDoxNhku.0CDBpV6pJupVH8L1Kk.QOMMUw7
 I_QZgxzPxxzD6NrNS8VERVD91W0hHu9PR6yfv2_vr_Yq0rkgh1Zju98XxeTSrhUkjjYzanGdOQAX
 IOjwLcPGdY_FgUCyRdsKes4cuFQo1mw0biKgxp1wBC9H8mjBg2OOSbUpS8lhRA4zvqayNmtaYL96
 MK56qofMmRVHw0OswB8.8KjQupy.ZnKxOL.0ywwiFH6amk_Ap9cvBgqvZK6s0.pt0IBUi8IsI4my
 H23SMt5oElEveyp7s8_CdqXdWtQ2p7frKCqFopgxAqi3InTEE3Bo.2RvyFH29_C84DHhZhXdw6.w
 Wt.BHn_ocBofw3uiWn4ksmljCvst85j8Gt_8dDKUL4XSIBy9Uvi2eYWQmULz2SRetLpO2Byd.ol2
 NdVKI912uYuxsjwdFk7XWAljCWSYe8MYfNMifC8V4KdyyqWLpOv.fYDBubsgw58rTM9J.x3_31ye
 PZtWBl5TNYg9S39SCk7yvIDhikSl_YpzKAIb_yydBao9TUwF490XkVxjfRrDrSX_Nthzp18hTrwO
 eg6vyy7zWTELQ4mWREhvy7CizTjiAFREXcxpkuSh._gTXz9ejXEM5b6NKkPf1VIHypcg5U4oW.a3
 dcC93AoQr9.ylXslrkMiVPUr1glxIPIT0m3I8EDGNK82wcPNkzLpsnMJQt5DJmc8_tWQdvyIaXiP
 yPTZ54V.b4nRPIMEnDtWSoNwITtAO9FOPpybhy_Ik6hNE6P2xEkOktIMbqYptJV0ChZW.hb8F_xc
 xIf1pPIUpTnvLjFtBU5xBMmgLYT7evJcr5WAMxwwTK.NmoDvBQqsN0njkV5tYPKYFRNdg3YzOS6E
 J2nHNTUAaQKO9PNl2OHuVLsC9bGZozdgcGRra4O3Brei52dq_i3KSAeNj0ZkyRE0HV9gVIEJz5y2
 0_VwJqk3fiGm3hoQG3rViiYIer2pIeaLvnu8ktXG79rAvfcjbAUU6ncBGl142Y_ZfpWQIQz8pl_h
 _saf.hcp0lq.ymySgyLZXyW1rHxRQFgdagNTKsiaQAG6KJZpWDK9eIS15_UR4wMB42BVIURDcxjt
 V4G.xlZiJHPAFgVQXUKX67mBR0agiMNWJabBsIRbU6wWfbAr.lujHX2oXPiDIDIj2fIjdvAld1bA
 obnUPZoIJF4oEoibLIz5gfIbsSS9poF3heOsUI.Jeeyer3Gi_MdQfgU9Iq8gy6Q_PsNcjUqyiRUH
 q7aTfvlsIWMf7ZgNKJPRJldzd3p7fOi57NvJE6u77AIvoXhuK3ojcbfxhsVq6NGa5WARPgH0rSXV
 5nGKYsSVnIBc3otlYm4u0YssFHi86BUwmZ.sl5VD6qZ0F9rpiPbdyexp5ilnSAI_UwgL78W9oJNS
 00BbVlb7spcvRsXakbfsE_3hJd_Eqpkc50OQuOTsSvOM1tyRyX3Hr2uK89zNHwYJgEEIvUakDipy
 Jd1QJBiwGX8bvvpTQ2Yfx2BbN_Gcnpr.JnXSe0Ob.oDGtS5p0rFU4vxiHIN0vzj1rxofszy3WQ_G
 lp6G0OIz7zS_NwUyQuVoBsUMwwfv1pdhGAfHNvTwXMghDH8jULwAA9WTF8ZXVuEOnbFenoy87C8o
 EeihoLPm6NgdG4e4n4GNwgHR0SorYdVKEO9uOnd7OAxvRlAkCN9kPVpd4V7RHf0NaiJVrq9xGeIe
 CuO.dNSrzqa44mUXHZYUz0aIebrKEJWH8.2_lzN8plEK_uefHoj.Uv8kIwaiTLkpfCPRC5dCuYb.
 LMYW.I_W7eOdcmwRhUcejB5NCrmkyG4RZuP0Brs0m7o79Z7qazNtHNCZE4ytOBuhSwOsBXGi_Nwi
 B08.Jctl8FlnbnvYUnbBiLRprOVDmny4ButyMOH1oTiMy4hB1GZJAfKAPYvbvX.klUQf433MNPla
 k3ALAMmBpM8Jgtxh4Fb4ePmdZKJlxJWSha_1vJZtKIuB0WvT_Q9ne6_0Y8N_ECsGwLVjc87l5jNp
 yzPN6qM8L1AUde_CDaj8cDy_a2W8q4KrxV9WukefFeyd.XiGm52Z02BowZQKydPe1qDgAT_PwuFb
 12BVX_dZwuMBVpvhSdFfXDYundPbPDhVaRJYKdIlMq37XI22_9RTneyuAhY90ehFSAh_Xf1YMSpY
 o6g9kl4yJVcdR96qmq_JAjuPtUsFNya4YN7jmq5lvJ3InNBnGuTv5zTbEBts_9BYAMa8Y07XOsKh
 MPRdz._heGy9wjGIgbBZ3TllLYPG0Ar5nYxjAYXPlwBGVCqUVnUl03poF93PBgGj7c9DwaeGfbvM
 U3i73nZMlxWR7f6VSutPSPD5h5ncNMG6S1del78TE7WZ3it614m3Pdr3QSV2bflfJUlBujCz1DJ9
 STqgYPN8GSVd2aaKehetW3QGAItTKyJ__.WHbmFJT1U8u.orPorR3L6YhI6p7L6jADx2YUdbvQdI
 oByuwc8KdGXZKkTO0W5.GAqh8wR6oBzr1yHL4MK5.V_FBgR6udLEq6f_5_90FDKVX.voVx2eq60d
 uV9Bq44iAaEw43tZhluby3ev1MARvy.mQ.y5a5FJu2mT8NI.CMfFqlTUR8YJkpzeXxGyC899KpSQ
 tx2yK76Q.ZAjx3nCogexrJbPiwjaKFD3nsIz0NfWyhP4H6Q3X1p2o2dtPNY_uZ8l2XHIJlZ075RQ
 7hskLfBKA8a47bc3zs3zzE2GQ7e2XlXuIL8wEPHGYqsagz6U_wYjYMJ6vFq3XuPwAIGME5bGLoNZ
 hCY5UV6zOycueCH3bzWF8zrhrNBKJICbOGHlMj5YjWZKHZIi8WzIXlnN0P5Mi7SLimGk-
X-Sonic-MF: <mariamsterbenc@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic304.consmr.mail.ne1.yahoo.com with HTTP; Tue, 23 Mar 2021 08:15:46 +0000
Date: Tue, 23 Mar 2021 08:13:45 +0000 (UTC)
From: "'Peter Florian' via Jailhouse" <jailhouse-dev@googlegroups.com>
Reply-To: peterflorian019@gmail.com
Message-ID: <1898585444.4164033.1616487225478@mail.yahoo.com>
Subject: Hello,
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
References: <1898585444.4164033.1616487225478.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.17936 YMailNodin Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36
X-Original-Sender: mariamsterbenc@yahoo.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@yahoo.com header.s=s2048 header.b=bqstHl1B;       spf=pass
 (google.com: domain of mariamsterbenc@yahoo.com designates 66.163.191.173 as
 permitted sender) smtp.mailfrom=mariamsterbenc@yahoo.com;       dmarc=pass
 (p=REJECT sp=REJECT dis=NONE) header.from=yahoo.com
X-Original-From: Peter Florian <mariamsterbenc@yahoo.com>
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



Hello,


My name is Mrs. Peter Florian and I am a British Citizen. My husband died r=
ecently on Coronavirus and I am presently in hospital suffering Cancer Dise=
ase. My husband has a deposit of 15.200.000 GBP in a prime Bank here in Lon=
don. Before my husband was taken to Isolation center where he died, he told=
 me to use the funds to establish animal care clinics. We have special love=
 for animals. Due to my present health condition, I will not be able to han=
dle this project. Therefore, I want to donate the 15.200.000.00 GBP to you =
so that you will set up an animal care Foundation in your country. A clinic=
 where animals will be treated in your country for free. I see in televisio=
n that people donates funds to orphanage homes and don't care about animals=
. I and my husband wants to make a difference in the world to let people un=
derstand that animals are important to nature. Please let me know your inte=
rest so that I will ask my lawyer to prepare a contract Agreement on your n=
ame. Please don't forget that my health condition is bad, therefore I want =
you to reply this message as soon as possible so you will receive the funds=
 before anything happens to me. I am waiting to hear from you.


Thank you,
Mrs. Peter Florian

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1898585444.4164033.1616487225478%40mail.yahoo.com.
