Return-Path: <jailhouse-dev+bncBAABBDM7UKTAMGQEH45NL7I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FA076A809
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Aug 2023 06:52:31 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id 5b1f17b1804b1-3fc08035926sf31260305e9.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 31 Jul 2023 21:52:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1690865550; cv=pass;
        d=google.com; s=arc-20160816;
        b=I0YHtF2MYBhHDOLiyj7j6Pj2ALY0c/zCbV71rNcmXYe81PlDbRrDAtqpw0hYvjc/9A
         ZMMEIwSHHauQnN6Tp0Nc1laBe1XVDvUsUqlLGROH9e/JNSoavTg6e/8zUvKw7X9CuzoY
         AM6UKeUIyFoUqITCmB0UDxLtW3ZC4DipJi1vYfsR071jHJwsEIowbvtErzI65o72cEWb
         dqLz2mnp4+lAInl84XmQDuUtmYsgwCxCFoZ9mnNGDXEZBFM4RUaDKLHJ7LcVwe/pOQbc
         bA+mg6YG4sSx3+4Av1wZ4jVrV/Lu4bxieeMOS8pRn3D2Qldzy7ZTFQkVKIeVYODENrLP
         vmTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:reply-to:date:from:to
         :subject:content-description:content-transfer-encoding:mime-version
         :sender:dkim-signature;
        bh=u4Nnuwtu5D6RdU4nkoJkR2Dpi8BGbtH9vUTRFvAOIpg=;
        fh=7mMxHpbopq18kJcLfdEy1muhL9F1LmZojgNwPf1Q/V4=;
        b=WphNOICV4Z9iijBea+ame4BS5T3snD13653yLskYcUMKywIpYbOmCsTbJV0IuxqRgc
         pcETxxv/Sry9jao65nI3eXilFyqRXILW9hu0CsNwgP8bw0qQAj4AhdmiYpMsexY2K6az
         cemaF1bmZE+myBY/kOnZI5nOEc8UDzO7lZVfUSj2EabjW6rL0/TqrVGMK4TwwHBoRiU2
         9D4RV3UBhcJkfZTe9n6en8A+BCj9JA6UXIOqdAWgpC26iKte1D5JQ/DMyOZtqav8uCoK
         w45cjKtgei3+Bv6fXNKlwOAvyvZG8sw19wL54fSYOEiAM4MunRJqCVhsdy3jUs+rpzL1
         hRXw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of testuser@e-guven.com designates 31.25.168.78 as permitted sender) smtp.mailfrom=testuser@e-guven.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1690865550; x=1691470350;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:message-id:reply-to:date:from:to:subject
         :content-description:content-transfer-encoding:mime-version:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u4Nnuwtu5D6RdU4nkoJkR2Dpi8BGbtH9vUTRFvAOIpg=;
        b=AeObqi4pgOULB5wSuWHtxf4TlBrQcjt9k0M9HpAB4+ZxGXBoIwnnV7phTgMKP1Eqc6
         /JrIiOcLEbVuPHzuRvNrT5NN7SFpZGvXMF09ILElfsy57U0GEnQRMwt2xyU181zqoZBv
         OMkD0T+5YBFrgCOCPkiUl9DH+lRKiY5CZwJrXJ1sP7F3NRIi5jmc6cz+bTtNxKpZu8n3
         /kMDyKqqZu7jnUuxcqBKkZRiu+aFrg9UzExts0I8ubrIIbyi20kaEsIWda6cIcTwTtLD
         f7966ubtdzYJSLHpBN7i8pQzcqNbELFzO4AsbQV7reiwiv8e+xXAh9/lBNfuxqGGVPc+
         Z08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690865550; x=1691470350;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:message-id
         :reply-to:date:from:to:subject:content-description
         :content-transfer-encoding:mime-version:x-beenthere
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u4Nnuwtu5D6RdU4nkoJkR2Dpi8BGbtH9vUTRFvAOIpg=;
        b=Md6wc0rVBugDiwTRBe81wKTAbjsWbdmKfwWZsBuZjJQDGgzAJWqTOtHw8eYld88075
         oL/40r5DyLGq1gvXZoNPHGy2vu8nsiGGyLzsOAEtrd3+Y5KxK8Xz7jCH+qBpTqd+mb9m
         cnrEz7czEIDsGbvLqc8WpqAuJe2LPMV9xP2nEBxx13CT0OMJPoSQesLoN30NtbMyJvSk
         DevjW1Vbq6jG3V3Fi7Tzd/Q1uPNbQnaFSJuZExOCw7VmiA1g8yGD078zEFboL56NxoCL
         a6OhBd5Sy7xzof3ctmeuenFO2ZCWE8ihpoYImLCCyPSeLkapet6OG3cIXQUfbyNBBWYJ
         bHYQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ABy/qLYS6zAQwfGoBxmDwdlzRgYz41o3nDYj/JM75bOBZBCw6OARsUNB
	ekKahkZ8XkoLWodXVU34rFA=
X-Google-Smtp-Source: APBJJlGda7dOOt83d/EGTGMi/yWVA6k3XN5ryqOLX4ymA1liOE2X30wnb393yEqX2xXc9R+VnTyiOQ==
X-Received: by 2002:adf:db51:0:b0:313:f75b:c552 with SMTP id f17-20020adfdb51000000b00313f75bc552mr1162893wrj.15.1690865550084;
        Mon, 31 Jul 2023 21:52:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4811:0:b0:312:831e:dc1b with SMTP id l17-20020a5d4811000000b00312831edc1bls1095667wrq.2.-pod-prod-00-eu;
 Mon, 31 Jul 2023 21:52:28 -0700 (PDT)
X-Received: by 2002:a5d:660b:0:b0:311:b18:9ca4 with SMTP id n11-20020a5d660b000000b003110b189ca4mr1175010wru.17.1690865548203;
        Mon, 31 Jul 2023 21:52:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690865548; cv=none;
        d=google.com; s=arc-20160816;
        b=y4GPP6gzQcaHp+mV3wQmTnXHNTEaeh1CPWwKxv8AaLa9yX9rV+5ZOVHmKF4xLGaOwQ
         qZ7J/+P5Cb/KhnIrXPxA8PfZRs12SJfMMyCPdvpcFMHZnS8rgR5YoHxbBlpjbJCM4lyV
         WF6YN2928NfWmht500a4QK9iT3s0AZEcYQ5TWYNZhnAyww6L6aZL4fDQACCQkV4YKh6C
         eLMZByaeUmsD+qf/ZhsIxoAeZ038xr0cLCWZWtv+G0C72fs1IfLBaMeZThIe77bmRIuU
         5fEGeIjJwsX4repmSwcSnLEdypt68r36QFn/DtDzclrl3LGtFM//4Z7S7/s5zr/SZCc1
         40ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:reply-to:date:from:to:subject:content-description
         :content-transfer-encoding:mime-version;
        bh=sOGI9tSxIEHYciPcvkcHY7M1AD9aE3bOOs69sziNdxE=;
        fh=7mMxHpbopq18kJcLfdEy1muhL9F1LmZojgNwPf1Q/V4=;
        b=ls2sSK43wo2KkO0TXz8WeSFMiz92HXnqhreLHCWZ5jovc1/ikceALuDAcUy/GhWREM
         Mr/yxJ2i+5AoHcHML5xhjWHvh2qQfX4ztb1G8kUw2kasMGcadibmGjWj0kMeJT7+9iN+
         khkePysN53jLpBnqsVVAgBzDRLJ90U1KJYc3i0YfuTc50mN/OfhZD/K70VbDa8uj6xhB
         DSkoc32iKpDqNspIkPsa+Uq/PNkST3UFUnCVaHXv9GuVyjhEfItRO7490gD/qh9gfNeS
         f+ozOYInRGtMv2ZP0Mns3Erm61NXXxKWYyG+pJx8Y0W3byj8itc4htqhYMK83bO9jPN1
         QLpA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of testuser@e-guven.com designates 31.25.168.78 as permitted sender) smtp.mailfrom=testuser@e-guven.com
Received: from newsmg.ebi.com.tr (mail.ebi.com.tr. [31.25.168.78])
        by gmr-mx.google.com with ESMTP id bu25-20020a056000079900b00317685aa000si725151wrb.4.2023.07.31.21.52.28
        for <jailhouse-dev@googlegroups.com>;
        Mon, 31 Jul 2023 21:52:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of testuser@e-guven.com designates 31.25.168.78 as permitted sender) client-ip=31.25.168.78;
X-AuditID: ac1f0a62-94bff70000002080-9a-64c89307c8de
Received: from [192.168.8.119] (188.213.34.99) by EGUVENEX.EGUVEN.LOCAL
 (192.168.127.11) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Tue, 1 Aug
 2023 07:39:19 +0300
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: I'm Azim Hashim Premji,
To: Recipients <testuser@EGUVEN.LOCAL>
From: <testuser@EGUVEN.LOCAL>
Date: Mon, 31 Jul 2023 21:39:12 -0700
Reply-To: <premjiazim01@outlook.com>
Message-ID: <66cb73b765dd4463ba6378e9a93c7437@EGUVENEX.EGUVEN.LOCAL>
X-Originating-IP: [188.213.34.99]
X-ClientProxiedBy: EGUVENEX.EGUVEN.LOCAL (192.168.127.11) To
 EGUVENEX.EGUVEN.LOCAL (192.168.127.11)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Re0hTYRjG+c6+HU+T4WkJfhnpHDayy9KU+EgJkcwThVl0sSjmbEdbed3M
	0pBMU2OZeclis+xihqZhmeYmlrr94dSGkaHS0ig3K2WamNoFM5dE/vfwex5efvBSHEENdKcU
	CSmsMkEWJyJ5sK3qvPNGpxKT3NdodMFDc/Uknrk0ReLBXh2Br9tScZnJ7oTvXv5N4rE7ATj7
	1SjEti/PnfDMty4CV1peQ1yq+cLFVbl9HDz3OZfABv0MwENN90jc87iLi836WQLnVmcR+KOp
	GwS7Mhf6s0mmxPqEYCo1PZDpySuDjF476MS0FHWSzHD+S5LJul1CMFfabwLGXlRHMJaRZ5DR
	ao0EUzgwDCL4R3hBcjZOkcoqN22L4p0w183ApAry7MR8PycTlHPVYBmF6ADUUP4LqgGPEtCP
	APrQ0cJxFBxaggZKr5GOzKeXo06NFS7y9ejB3bGFDbWQxWhaneLAK2ghmsrpBo7suoCbWi8S
	jglJr0YFfbQDQ3oNqqh7/hcLaG/UMggWj29HdlsudxGLkLVm36KYF2rsuA0cGNEsslYHFgIX
	7RIz7RIz7RIz7X+zOwA+BHS8TBHnJ2GjFZLjifGSFGU9WPhnrScvWgd6GyYlBkBQwAAQxRG5
	8lf96pAL+HJZWjqrTJQqT8exKgNYRUGRG9/X54VUQMfKUthTLJvEKv+1BLXMPZNoy4jfrW4I
	M4+rE6Sm8EPrDIS5jH56Rp7Umjweacl0NrrBwK86/ns7d3Z6OuycaqN+S3N/aJU/Q3gc8+yH
	XYHZc+etzybCPj0e0R/u2b/nfuuPYcHWEdPeW+LqTo+jIHTYkrySnhV6nTxYHtPdoPF5b4wa
	hU+PMyGF5bv2zlmMwqEDfhP28OCIzW80U3n+r5prY1rr04Wlt9757GwpFuu8E1N59qzvLh7j
	zmHi2oSrkzfcVWvy1T62G3ad2aXx8PL5iJDZyKkXadfH3iq53Tv8gw9ENRXlnYkp8NPVu9Xw
	cmyNQbU/1xqji9trCjOEZX2KgCI7ijXwpM0D0g0iEVSdkPmt4yhVsj/DNPxkPgMAAA==
X-Original-Sender: testuser@eguven.local
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of testuser@e-guven.com designates 31.25.168.78 as
 permitted sender) smtp.mailfrom=testuser@e-guven.com
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

Hallo,

Ich bin Azim Hashim Premji, ein indischer Wirtschaftsmagnat, Investor und P=
hilanthrop. Ich bin der Vorsitzende von Wipro Limited. Ich habe 25 Prozent =
meines pers=C3=B6nlichen Verm=C3=B6gens f=C3=BCr wohlt=C3=A4tige Zwecke ges=
pendet. Und ich habe auch versprochen, die restlichen 25 % dieses Jahr 2023=
 an Einzelpersonen zu verschenken.
Ich habe beschlossen, Ihnen 2.500.000,00 $ zu spenden. Wenn Sie an meiner S=
pende interessiert sind, kontaktieren Sie mich f=C3=BCr weitere Information=
en.

Unter folgendem Link k=C3=B6nnen Sie auch mehr =C3=BCber mich erfahren

http://en.wikipedia.org/wiki/Azim_Premji

Antworten Sie per E-Mail an ( premjiazim01@outlook.com ).

Antworten Sie per E-Mail an ( premjiazim01@outlook.com ).

Gr=C3=BC=C3=9Fe
Gesch=C3=A4ftsf=C3=BChrer Wipro Limited
Azim Hashim Premji

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/66cb73b765dd4463ba6378e9a93c7437%40EGUVENEX.EGUVEN.LOCAL.
