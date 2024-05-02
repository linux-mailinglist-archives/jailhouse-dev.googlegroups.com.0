Return-Path: <jailhouse-dev+bncBCDLVQP2RIKBBPHGZWYQMGQE2JBMRAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3f.google.com (mail-oo1-xc3f.google.com [IPv6:2607:f8b0:4864:20::c3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC7F8B99A0
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 May 2024 13:04:30 +0200 (CEST)
Received: by mail-oo1-xc3f.google.com with SMTP id 006d021491bc7-5aa727d8e64sf13337683eaf.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 May 2024 04:04:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1714647869; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZyLa7QszbXcZ4HvTtlaYWsDJttsjZZ+u6WQkAq2rbkT9AVtOABKqnDT9YbcU9NSQJm
         S9TKDLv26OoA+j8M1yphe2zIpJV7UK+SvhN9VJV1OLz0O4SMOu92TG9mhqs8WpRu+AD/
         5fux2qK47YVH1HobBHIgHZG4DaI15cxERQFPvVIG6TEWplMLQcgPMkR/kjrppo0BhTQI
         9RTXJp5EPqW6iDQm5eP1WDMmcOYZq6wIMRY4wjfZi4m0hSbXa+oHUQ9EbruiB2vR8EBp
         O9YU+zIu64rZjrHrbBc0ktGh5ommdbRYawKQtFrHHwxbeIpySm3mHaKuYygq3vm+ysUT
         jBAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:to:feedback-id:sid:list-unsubscribe
         :reply-to:subject:message-id:mime-version:from:date:dkim-signature;
        bh=wWFhgjpfeBNOp6h9CTqmPBHZS0m9rFjzyP7pxGHCQ4Y=;
        fh=jQMGt2wVO1/+K+jeAsUE+xLe+Gm2l/souI4bHjS57W8=;
        b=tuBOukrYH/y907Or4ueDB0xD7GHXi9kptGK4hMYaNnNTgir4XgYhB3irdhfQpBOpHw
         //0t86I0BW6nT2SivVVkS4E+a/SSQ4Qghlh8HovTZN3zAxvXyVln9F41yRi0GGgXdLTz
         600NyuSvtSZLlw0LUrvaVr7jkzovX7tSVPWrOTaLAXW3GBYQndlLAYQ4VZ3WXyeEr3YC
         PEY7NhIgBDq2crAqgtzu/xlwgq/2txKOl3Bz1TnM5xaEaQLHapHb40DH7fuHJl6wfLzv
         yt+0SfWMdOtz4RIb/gRjqsrSylK1CsWoaAPPfWI0dpK1HTy/n12szV8Ox0zY3VNWbhMe
         4b4g==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@mail.beehiiv.com header.s=s1 header.b=bm6t63BZ;
       spf=pass (google.com: domain of bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com designates 159.183.141.16 as permitted sender) smtp.mailfrom="bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=beehiiv.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1714647869; x=1715252669; darn=lfdr.de;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:feedback-id:sid:list-unsubscribe:reply-to
         :subject:message-id:mime-version:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWFhgjpfeBNOp6h9CTqmPBHZS0m9rFjzyP7pxGHCQ4Y=;
        b=o6ynWeXapoT5AfGhrhQHBd0N5i/fAObhUepikmSNiZ9zMo29nYZkkqUBRj9yk+lCIF
         c+RHbncjivb+2gMt9wR7GfsDhRXOA5m9GtdNuxXAh/jaVf0hxxTkzCt5vOvsymtmt0WU
         HHwPtw+W9lohMaROuUuNTFU0daRxJeg71RsL+hcnjpIlJnXAqRBITjl32ReemBuXW/O8
         m8wQQEns8JUioWfT1RMRraMIZEUABGFVKQNIL2WHF3mrjL0KIg3P/CjYoRgMfDK2vWFl
         30tgse9KspsYggtp6bRlVhXQlFPFdB9c3rQ8bvjQnRRfn02M9eGbh4iUImvRhbZD0GsI
         yZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714647869; x=1715252669;
        h=list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:to:feedback-id
         :sid:list-unsubscribe:reply-to:subject:message-id:mime-version:from
         :date:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWFhgjpfeBNOp6h9CTqmPBHZS0m9rFjzyP7pxGHCQ4Y=;
        b=Z5x2zOjVUf0MrIAzXYhAjJhxHOHXR+xFwv+uydugAItXQr4Z/gqgBVaoKXgL09WJ7i
         Gf2PVB+bpc9E69Wk11y90MPjuD13o8++lAdrH6oOlSkHKLaktz7OZVFjATQpGPAR0xC0
         CsIOahbGMHokDiRIFpDe1pzg3aAFaraRus0Kd8OcWiqYcHU6uyMd+mOrGhZzr88PPQ2B
         wnf8ag0n+qBdv6Roe7XzCTyfOff+aSh7f7EKtrPntkQX3iKRloz4xtKBeFQTcwimZzay
         KcOhMm68PJ5kQ/csOBDltyZfkj5wAPFvQ1e3NRQVsuV4KnzGRtIOF/3wazoCT9QlJyVI
         SRhQ==
X-Forwarded-Encrypted: i=2; AJvYcCXjZtuLopTBEXdwuw+y9LabcXVZEeeXbgGjvSgaYi99SMrs3CUuXWIw+WHpEgxMdIXIr8J8y90U5VZnWxmOqNdIVVKduzjoYTsTjCc=
X-Gm-Message-State: AOJu0YwfhPmkHLnpejDRhzGk9Uxskk8V6r5siSIXQulj5RceUKj/gaUj
	2CSeGntscSzICkz7PbeM0IkxeMgkhy7BIv2Sy4tKwSjOkLOC5Fc8
X-Google-Smtp-Source: AGHT+IFknDDtwnKlWD/3dAL+X85IIYmnFlSwandCtX1zn9yjwabIyJr4o1bfLru4M+0gguCc96z9AA==
X-Received: by 2002:a4a:acc9:0:b0:5a1:cefd:73d6 with SMTP id c9-20020a4aacc9000000b005a1cefd73d6mr5794851oon.7.1714647868787;
        Thu, 02 May 2024 04:04:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6820:2218:b0:5a4:6ef1:24f0 with SMTP id
 006d021491bc7-5b1bac65d75ls1167464eaf.0.-pod-prod-03-us; Thu, 02 May 2024
 04:04:27 -0700 (PDT)
X-Received: by 2002:a05:6808:1b12:b0:3c6:f339:7f4c with SMTP id bx18-20020a0568081b1200b003c6f3397f4cmr6859951oib.49.1714647867295;
        Thu, 02 May 2024 04:04:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714647867; cv=none;
        d=google.com; s=arc-20160816;
        b=XdRUNzDWpRXAa7Adtpc2ui9KJQwACr2w+myuok6MNIFJmA1R6uHk+O+YyiE4/E/mqg
         qgxTO7lF8SJ33KzVLG+6eepeqNqB95vAiFCUv+2/iNeBysiNL/1BEALnpVCg4heXfitp
         mvjMtE6tkw/9DH6QYw9QuKcSqWvIyCwMJfZSbQ7oZ89+u0vaQLETBjF8gw65qSeLCmEA
         IreI2fIfKf/n8j2KsGINdkIW0RS+0jWS5aEk7vXORHPeC/wf/UNToB09VhGmJ5EEoj93
         CxWlRARnxa5tB0GaGp+VJMfXHb6AtvtS1poGsaiNOEhckHyu8oLcZWnT88CONTbFCn2I
         3flQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:feedback-id:sid:list-unsubscribe:reply-to:subject:message-id
         :mime-version:from:date:dkim-signature;
        bh=qhruskvhT8driNFPjopzoR8+ir8W2UyI1sjW1JENe+M=;
        fh=gxv6KPRH6O+Oq3mqvhuXuTetS01385E93D+NhmqUcp4=;
        b=APyApB9QhfHkiAYwFu7smv6AWPiCZh0QLmG7QyeaSPrryLgo+QhGIGF7nI/8jHSDGk
         x3TJorqJM6daJSxn/xYruBLTnW0Prxs2skARhHfBGN6SHOup6HiNf1A9OO4oG2+IgJcj
         wEspi7Nag6sgb/CuDg+fmEe6N52MtC2cPQeaAbro3bDMZbYVb1gc/dv3gQsfdctnTD9j
         1DZLvrp9d9EDhAgY/WORZr8COQFYna86ooamsvZeLCOijkbS/Hqs9dF77wOQphm8zgJa
         TaW8Jw3gg3JGDuccAno52Bj3sH6AqQDXgcodNxZ8k1bQmN1/q9Wi7XLPwOwbvPh+purf
         ilXQ==;
        dara=google.com
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@mail.beehiiv.com header.s=s1 header.b=bm6t63BZ;
       spf=pass (google.com: domain of bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com designates 159.183.141.16 as permitted sender) smtp.mailfrom="bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=beehiiv.com
Received: from o11.ptr8898.mail.beehiiv.com (o11.ptr8898.mail.beehiiv.com. [159.183.141.16])
        by gmr-mx.google.com with ESMTPS id a17-20020a056808121100b003c752d2d1e9si75472oil.5.2024.05.02.04.04.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 May 2024 04:04:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com designates 159.183.141.16 as permitted sender) client-ip=159.183.141.16;
Received: by filterdrecv-55cbcb4974-h7dmm with SMTP id filterdrecv-55cbcb4974-h7dmm-1-66337338-CE
        2024-05-02 11:04:24.883022059 +0000 UTC m=+217393.327204024
Received: from NDAzNDMyOTY (unknown)
	by geopod-ismtpd-25 (SG) with HTTP
	id ybcju4VXTwK9dZU5lQTHSw
	Thu, 02 May 2024 11:04:24.481 +0000 (UTC)
Content-Type: multipart/alternative; boundary=2036cbabd157bf75cdb20dd477c34da18f834c758a245cd3573332a3ff23
Date: Thu, 02 May 2024 11:04:25 +0000 (UTC)
From: "'SEED Conference' via Jailhouse" <jailhouse-dev@googlegroups.com>
Mime-Version: 1.0
Message-ID: <ybcju4VXTwK9dZU5lQTHSw@geopod-ismtpd-25>
Subject: SEED Conference
Reply-To: SEED Conference <seedconf@upv.es>
x-newsletter-id: https://seed-conference-valencia.beehiiv.com/
x-newsletter-signup: https://seed-conference-valencia.beehiiv.com/subscribe
x-beehiiv-type: newsletter
x-list-id: 71fc7e6d-cd28-47c6-aa1e-5d673d88c28e
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
sId: 71fc7e6d-cd28-47c6-aa1e-5d673d88c28e
x-beehiiv-ids: =?us-ascii?Q?{=22account=5Fname=22=3A=22https=3A=2F=2Fseed-conference-valencia=2Ebeehiiv=2Ecom=2F?=
 =?us-ascii?Q?=22=2C=22campaign=5Fid=22=3A=22ab27a74d-d91c-4b18-9ac?=
 =?us-ascii?Q?1-7082dd35d1fa=22=2C=22category=22=3A=22newsletter=22?=
 =?us-ascii?Q?=2C=22email=5Fgenerated=5Fat=22=3A1714647864=2C=22user=5F?=
 =?us-ascii?Q?id=22=3A=2271fc7e6d-cd28-47c6-aa1e-5d673d88c2?=
 =?us-ascii?Q?8e=22}?=
x-newsletter: https://seed-conference-valencia.beehiiv.com/p/seed-conference-02052004
Feedback-ID: =?us-ascii?Q?ab27a74d-d91c-4b18-9ac1-7082dd35d1fa=3Anewsletter=3A71fc7e6d-cd28-?=
 =?us-ascii?Q?47c6-aa1e-5d673d88c28e=3A73c7af638dd0cac?=
x-list-owner: <mailto:seedconf@upv.es>
X-SG-EID: =?us-ascii?Q?u001=2EMt=2FpfclHn1+UMtV8LJLhNNy4mEHVvqc1hZQ2Olx3PhEx8x0AjXbaNLDVr?=
 =?us-ascii?Q?pzjLLk3hXXJDPZv5bNMhpkmvRjphJxDILoXEE4z?=
 =?us-ascii?Q?Yuf6F8BgxpnnFfu2t5sseT1ln7RWy6T7Q593Uvp?=
 =?us-ascii?Q?xQTRhuZjJDAizueJ8kjrJ9d3N731uI=2FmHyDGL7O?=
 =?us-ascii?Q?XUjqTPJ97NwrkGLiDddjeu8lEWwB58pcJoNjqpU?=
 =?us-ascii?Q?SjF6nsgYEYLn9FhlVPs6LkBA5WqMw3S=2FOqtFiYJ?=
 =?us-ascii?Q?+=2FGHucCc9q+t4JopJJ+tdBBjpqXYGNVAnpijfXH?=
 =?us-ascii?Q?9UxyPch8=3D?=
X-SG-ID: =?us-ascii?Q?u001=2ESdBcvi+Evd=2FbQef8eZF3BpTL9BgbK5wfSJMJGMsmprAVgeiC8iaV7rEmQ?=
 =?us-ascii?Q?+cYi2k79638SyYeW7kSf4iBdlTS4w7mMBslAxfh?=
 =?us-ascii?Q?WPHWOzwrUxVKTC8zKXn+rvnkOB7zU4BU0aO0J8f?=
 =?us-ascii?Q?oGc5AxrLEj9GbvNlxd5bvV3fqhkaUJa6i0UCeNl?=
 =?us-ascii?Q?dF9zdjhpbxotmLxpOB2Nm3C3k3iIOA2kwg8ZDDV?=
 =?us-ascii?Q?EdWCf1L3ia29JPTRhij9LAlq81I5drUxhQPwuXB?=
 =?us-ascii?Q?VSRm1hVUPcNiWj+BnsL14=2FZyQg=3D=3D?=
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
X-Entity-ID: u001.GINWaumzpjWck0y5/PF8TQ==
X-Original-Sender: seed-conference-valencia@mail.beehiiv.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@mail.beehiiv.com header.s=s1 header.b=bm6t63BZ;       spf=pass
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

--2036cbabd157bf75cdb20dd477c34da18f834c758a245cd3573332a3ff23
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0

View image: (https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,forma=
t=3Dauto,onerror=3Dredirect,quality=3D80/uploads/asset/file/dcbc0422-e91e-4=
be2-9044-0744bbc94e07/6543f3704bcc1407f3339baf.png?t=3D1702884418)
Follow image link: (https://www.seedconference.eu/)
Caption:=20

### **The Social Program for SEED 2024 is available now!**=20

### Do not miss the opportunity to join the best summer vibes of 2024=20

Learn more (https://www.seedconference.eu/program/social-program/)

View image: (https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,forma=
t=3Dauto,onerror=3Dredirect,quality=3D80/uploads/asset/file/378f4e5b-3265-4=
283-9c94-56cb6d8fc3d3/hero-NL.jpg?t=3D1714555264)
Follow image link: (https://www.seedconference.eu/registration/)
Caption:=20

----------
# In this newsletter:


--------------------
Click on the topic below to read more:


--------------------
Social program
**[Welcome reception](#event1)****    |    ****[Conference dinner](#event2)=
****    |    ****[Farewell wine](#event3)**


--------------------
Workshops
**[WS01](#ws1)****    |    ****[WS02](#ws2)****    |    ****[WS03](#ws3)***=
*    |    ****[WS04](#ws4)****    |    ****[WS05](#ws5)****    |    ****[WS=
06](#ws6)**
**[WS07](#ws7)****    |    ****[WS08](#ws8)****    |    ****[WS09](#ws9)***=
*    |    ****[WS10](#ws10)****    |    ****[WS11](#ws11)****   |    ****[W=
S12](#ws12)**
**[WS13](#ws13)****    |    ****[WS14](#ws14)****    |    ****[WS15](#ws15)=
****   |    ****[WS16](#ws16)****    |    ****[WS17](#ws17)****    |    ***=
*[WS18](#ws18)**


----------# Social program

----------
## Welcome reception

on July 3rd at the=C2=A0_[Marine Sky](https://marinabeachclub.com/)_, Marin=
a Beach Club, Valencia


--------------------
View image: (https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,forma=
t=3Dauto,onerror=3Dredirect,quality=3D80/uploads/asset/file/ba02412b-e311-4=
6b1-acde-9797e246c512/marine-sky.jpg?t=3D1714630735)
Follow image link: (https://www.seedconference.eu/program/social-program#ev=
ent1)
Caption:=20


--------------------
Read More (https://www.seedconference.eu/program/social-program#event1)


--------------------
## Conference dinner

on July 4th=C2=A0at the=C2=A0_[El Mirador de Only YOU](https://www.onlyyouh=
otels.com/en/hotels/only-you-hotel-valencia/gastro-spaces/el-mirador/)_=C2=
=A0on the top floor of the 5-star hotel Only YOU in downtown Valencia


--------------------
View image: (https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,forma=
t=3Dauto,onerror=3Dredirect,quality=3D80/uploads/asset/file/8074b466-f5c8-4=
edc-b929-a9aa2c2562bf/only-you.jpg?t=3D1714631813)
Follow image link: (https://www.seedconference.eu/program/social-program#ev=
ent2)
Caption:=20


--------------------
Read More (https://www.seedconference.eu/program/social-program#event2)


--------------------
## Farewell wine

on July 5th at the Hall of the Faculty


--------------------
View image: (https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,forma=
t=3Dauto,onerror=3Dredirect,quality=3D80/uploads/asset/file/638d30fe-0f97-4=
968-93be-172a228d4507/facultat.jpg?t=3D1714632022)
Follow image link: (https://www.seedconference.eu/program/social-program#ev=
ent3)
Caption:=20


--------------------
Read More (https://www.seedconference.eu/program/social-program#event3)


----------=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=
=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=
=94=E2=80=94=E2=80=94=E2=80=94

# Workshops

----------
## WS01. Enabling the flow of knowledge for the Energy and Hydrogen Transit=
ion

In this workshop, we will share our good practices from The Netherlands, of=
 which the proven method of Learning Communities. We will illustrate how re=
search, education, and practical implementation of innovations can reinforc=
e each other and better tackling societal challenges like the energy transi=
tion. Next, we would like to discuss the possibilities of an international =
network in which we can share learnings of proven and new concepts.

Read more (https://www.seedconference.eu/ws1)


--------------------
## WS02. Sustainable Energy Education: Delivering the energy workforce of t=
he future

This workshop aims to address the evolving landscape of the energy sector a=
nd the educational needs to deliver a skilled work force that is ready to d=
eliver clean energy access that is technologically sound, economically feas=
ible, and locally appropriate. Through a panel discussion and interactive s=
ession, this workshop will explore the role of energy education in cultivat=
ing a workforce that is capable of addressing the multiple, complex challen=
ges faced within the sector.

Read more (https://www.seedconference.eu/ws2)


--------------------
## WS03. ESExNBS@NEB - Exploring Sustainable Education implementing the Nat=
ure-Based Solution in the New European Bauhaus perspective

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
## WS04. MINDS =E2=80=93 Meaningful Immersive Narratives Driving Sustainabi=
lity

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
## WS05. Game-based Learning for Sustainability in Management Education (GA=
ME-SME)

This workshop aims to provide an interactive platform for participants to s=
hare and discuss research findings, pedagogical strategies, and practical e=
xperiences in utilizing business games as tools for teaching sustainability=
 principles in management courses. The primary objective is to explore the =
intersection of two dynamic streams of research and educational trends: the=
 utilization of learning/experimental games and the incorporation of sustai=
nability themes in management education.=20

Read more (https://www.seedconference.eu/ws5)


--------------------
## WS06. Empowering Through Education: T-Shore's Approach to Wind Turbine T=
echnician Training  (T-shoreEdu)

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
## WS07. Build your own LEAF: Learning Ecosystem Taking Action for the Futu=
re

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
## WS08. Sustainable Business Models in practice: a business game competiti=
on (BG-COMP)

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
## WS09. JUST GREEN AFRH2ICA - Unlocking African green hydrogen potential f=
or mutual benefit cooperation with Europe

Europe and Africa have to jointly promote a hydrogen transition to boost su=
stainable economic development and a decarbonization of their economic sect=
or. African green hydrogen transition could boost local economies developme=
nt, that=E2=80=99s why it=E2=80=99s important that both EU and AU hydrogen =
policies and development roadmaps have to be conceived in a cross-fertilizi=
ng way.

Read more (https://www.seedconference.eu/ws9)


--------------------
## WS10. Unveiling Training and Skill Requirements for Driving the Adoption=
 of Emerging Technologies in the Renewable Energy field. - RE-SKILLS Worksh=
op

The RE-SKILLS workshop aims to address the demand for skilled professionals=
 capable of implementing cutting-edge technological proposals in the dynami=
c landscape of the energy sector. With a focus on novel technological conce=
pts, the event will bring together industry experts, academia, and professi=
onals to identify essential skills and capabilities required for successful=
 integration.

Read more (https://www.seedconference.eu/ws10)


--------------------
## WS11. Attract and train European technicians in Energy Transition

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
## WS12. Transforming Sustainable Energy Education (TranSEED)

In this workshop we invite you to experience a technology demonstration and=
 subsequently help us to transform traditional mono-disciplinary technology=
 education into transdisciplinary and multilevel challenge-based education.=
 You will gain insights in two interesting technology applications and will=
 have the opportunity to enrich your and our perspectives on transdisciplin=
ary, multilevel and challenge-based education.

Read more (https://www.seedconference.eu/ws12)


--------------------
## WS13. Applied and Innovative Research within VET Education for the Energ=
y transition

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
## WS14. H2 VIRTUAL TRAINING

H2 VIRTUAL TRAINING is a digital training program developed at the Universi=
ty of Toulouse which addresses safety issues during maintenance operations =
on hydrogen vehicles

Read more (https://www.seedconference.eu/ws14)


--------------------
## WS15. Facilitating upliftings in solar energy storage (FUSES)

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
## WS16. Challenges of International Master Degree Courses in Renewable Ene=
rgy Systems

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
## WS17. Explore integration of sustainability in education from a reflexiv=
e, SDG and entrepreneurship perspective

In this inspirational workshop you will explore three approaches to integra=
te sustainability in education from three perspectives: reflexive, SDGs in =
education and the relevance of entrepreneurial skills. You will review the =
three approaches and find out how you can apply the three different perspec=
tives to your own education or in your institute.

Read more (https://www.seedconference.eu/ws17)


--------------------
## WS18. Accelerate matchmaking in a network: what can we learn from trees =
and computers?

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
https://seed-conference-valencia.beehiiv.com/p/seed-conference-02052004

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/ybcju4VXTwK9dZU5lQTHSw%40geopod-ismtpd-25.

--2036cbabd157bf75cdb20dd477c34da18f834c758a245cd3573332a3ff23
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
ence</title><!--[if mso]><xml><o:OfficeDocumentSettings><o:AllowPNG/><o:Pix=
elsPerInch>96</o:PixelsPerInch></o:OfficeDocumentSettings></xml><![endif]--=
><style>
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
upported-color-schemes" content=3D"light"/><title>SEED Conference</title><!=
--[if mso]><xml><o:OfficeDocumentSettings><o:AllowPNG/><o:PixelsPerInch>96<=
/o:PixelsPerInch></o:OfficeDocumentSettings></xml><![endif]--><style>
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
0px;overflow:hidden;"> Join SEED&#39;24: participate in the Social Program =
& 18 workshops &#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#=
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
;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#=
160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204=
;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8=
204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;=
&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#1=
60;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;=
&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204; </div><ta=
ble role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" align=3D"ce=
nter" cellpadding=3D"0" class=3D"gg"><tr><td align=3D"center" valign=3D"top=
"><table role=3D"none" width=3D"670" border=3D"0" cellspacing=3D"0" cellpad=
ding=3D"0" class=3D"aa" style=3D"width:670px;table-layout:fixed;"><tr><td c=
lass=3D"bodyWrapper" align=3D"center" valign=3D"top" style=3D"padding:10px =
5px 10px 5px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0" align=3D"center"><tr><td align=3D"center" valign=
=3D"top" style=3D"border:0px solid #FFFFFF;border-radius:10px;background-co=
lor:#ffffff;" class=3D"c"><table role=3D"none" width=3D"100%" border=3D"0" =
cellspacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td class=3D"f" al=
ign=3D"right" valign=3D"top" style=3D"padding:20px 15px;"><p> May 02, 2024 =
&nbsp; | &nbsp; <a href=3D"https://link.mail.beehiiv.com/ss/c/u001.ja41VZAt=
R_qfVYIA2l6dByPcgm40JQbxLouneWPj9NO-QaAKU5v3Uihq7_J7Kxc8t6d4j3XtkHRy-MgDZN9=
3o2llsXvGl2pqvbRMM-W7uTHxc1JMircfZkyjfERmsK3WuPZ5PpRYensCr_9lXHZ3GPJk2TTjcE=
W8D7glaC6j_DTtd3kS_9otid7dmylyp8N-iw5AMCFScEa6gZfd2lr-7C6fwlBgch1_G_8TwK7X7=
WG0EL_TnJb2hRuayNdvG6Vu4EijV9o04L9Y37h4CSEuTh8IITM8f0tK-GAwzUgBXVltAjVKSsuq=
zGnNKLnlCsLfpPj2ZFcrn0Z0rlLnYHIU3xvNr5iU5r0GVvcgiploOfT78_wbUL2_qTgLAdmKueG=
zFPoKgeFc7FHlXsWKEGbCqkHQoqD8TY7Kbla90L2cGmc_7RLCuUc088lHOrXe6Dr7iJJ_E1i67R=
_d9ZxkjHbGHOshl0ivTsBaCfmS0K4vstwOL0jOb9zoTOTvalKYgYO57DAAgnra_ZAko_qYtXPUj=
KgsFF8vzhjjj-c2K53ovwl_3sQ3WdCiV6nqrelR0dAqU40LyTV7eIV4p44EHInRrhUpUUj18DJW=
3cAgM0dhApTJMyG9b-TXBTYfHLLPT4NlBuolibGCEBCWBg6XAtnHmLWi68ubsTL4pSV5lY9XT-M=
/460/pZ-bDj7tTQG8OujmTzb7cw/h0/h001.CUG-81a8TCxpkAh2rVBSVsDFn5Y48D6FrUE3q_p=
bt8s">Read Online</a></p></td></tr><tr><td style=3D"height:0px;width:0px;">=
<div style=3D"height:1px;" data-open-tracking=3D"true"> <img src=3D"https:/=
/link.mail.beehiiv.com/ss/o/u001.76lOL-0293a1YMnLUs-4IA/460/pZ-bDj7tTQG8Ouj=
mTzb7cw/ho.gif" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"hei=
ght:1px !important;width:1px !important;border-width:0 !important;margin-to=
p:0 !important;margin-bottom:0 !important;margin-right:0 !important;margin-=
left:0 !important;padding-top:0 !important;padding-bottom:0 !important;padd=
ing-right:0 !important;padding-left:0 !important;"/> </div></td></tr><tr id=
=3D"content-blocks"><td class=3D"email-card-body" align=3D"center" valign=
=3D"top" style=3D"padding-bottom:15px;"><table role=3D"none" width=3D"100%"=
 border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td =
class=3D"dd" align=3D"center" style=3D"padding:0px 15px;text-align:center;w=
ord-break:break-word;"><p></p></td></tr><tr><td align=3D"center" valign=3D"=
top" style=3D"padding: 0px 15px 0px; " class=3D"dd"><table role=3D"none" bo=
rder=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"margin:0 auto 0 aut=
o;"><tr><td align=3D"center" valign=3D"top" style=3D"width:252px;"><a href=
=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9=
u8hVzFrpIad1LOGaFg9-6Ik4koUqS_adtppE6NmAHVhAcf_h8YchlOJaQ_TQg9QzMw_wdkLd6ez=
Xe4B58ARO8CCLsXDtfqN35oJ8F7nGDK_XiN2ykpZMZAy4M3CZ3LJaRMpsrsWYTWr66nECrNMKAB=
04qPaA6RI6kMjYgTGBSkH-FE0txa8THRg/460/pZ-bDj7tTQG8OujmTzb7cw/h1/h001.zRZHQa=
MvG3w7r99OfZNZDusS2QJSmYQE0M9zil23ZAs" rel=3D"noopener noreferrer nofollow"=
 style=3D"text-decoration:none;" target=3D"_blank"><img src=3D"https://medi=
a.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,format=3Dauto,onerror=3Dredire=
ct,quality=3D80/uploads/asset/file/dcbc0422-e91e-4be2-9044-0744bbc94e07/654=
3f3704bcc1407f3339baf.png?t=3D1702884418" alt=3D"" height=3D"auto" width=3D=
"252" style=3D"display:block;width:100%;" border=3D"0"/></a></td></tr></tab=
le></td></tr><tr><td class=3D"dd" align=3D"center" valign=3D"top" style=3D"=
padding:0px 15px;text-align:center;"><h3><span style=3D"color:rgb(67, 138, =
201);font-family:Arial;font-size:36px;"><b>The Social Program for SEED 2024=
 is available now!</b></span><span style=3D"color:#438ac9;font-family:Arial=
;font-size:36px;">=C2=A0</span></h3></td></tr><tr><td class=3D"dd" align=3D=
"center" valign=3D"top" style=3D"padding:0px 15px;text-align:center;"><h3><=
span style=3D"color:rgb(232, 25, 90);font-family:Arial;font-size:36px;">Do =
not miss the opportunity to join the best summer vibes of 2024 </span></h3>=
</td></tr><tr><td align=3D"center" valign=3D"top" style=3D"padding-bottom:1=
4px;padding-left:15px;padding-right:15px;padding-top:14px;text-align:center=
;width:100%;word-break:break-word;" class=3D"dd"><table role=3D"none" borde=
r=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td class=
=3D"v" align=3D"center" valign=3D"middle" height=3D"52" style=3D"height:52p=
x;"><a href=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUC=
EtII-f83mS9u8hVzFrpIad22iyZsEIsXTeH_dvqXk2lGHRqyg0j-N2xpGPC4XiBZZZYMg9gZFSV=
GuhxVLo1z-3_GBHFGAD3BMIU5ehCtGAvlQTrUQOH5Obw-TdX-wQ96vqLwyNpXAor9FDQ4TmktFo=
NzGUo4YwdXdufNkDhWPS33M4mQSPYgtm-f29Dw5RGNOMkXDQ5sXjh1-LRWcOTt6hQ/460/pZ-bD=
j7tTQG8OujmTzb7cw/h2/h001.Q_DfnUv2Kfm3g5uwiEN7QLHVijtUqMrvfbVHVxcFUJE" targ=
et=3D"_blank" rel=3D"noopener noreferrer nofollow" style=3D"color:#155d9e;f=
ont-size:18px;padding:0px 22px;text-decoration:none;"> Learn more </a></td>=
</tr></table></td></tr><tr><td align=3D"center" valign=3D"top" style=3D"pad=
ding: 0px 15px 0px; " class=3D"dd"><table role=3D"none" border=3D"0" cellsp=
acing=3D"0" cellpadding=3D"0" style=3D"margin:0 auto 0 auto;"><tr><td align=
=3D"center" valign=3D"top" style=3D"width:630px;"><a href=3D"https://link.m=
ail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad2S3JbPM=
GacTyZyB5EOQz_xp0aw93paP535UwgPq13Wo3HJXLKqW_RDfZnxIIfvHuoTnoOM1Qi-GD0MJG7X=
oSBvCDoITof3IarWuUVzVUfK6P4-HXEdC4dTVz1rUJUFt5liXhrFn7ReTZLr2cRwdRvt5XI9tBD=
Pm439YVNpxPwt1kxF3mcmchdlAkfc5vE2bWs/460/pZ-bDj7tTQG8OujmTzb7cw/h3/h001.PT2=
4i2IZlDaINtA8dPo-ksWWscbfFrU-YoF0j4pHgrA" rel=3D"noopener noreferrer nofoll=
ow" style=3D"text-decoration:none;" target=3D"_blank"><img src=3D"https://m=
edia.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,format=3Dauto,onerror=3Dred=
irect,quality=3D80/uploads/asset/file/378f4e5b-3265-4283-9c94-56cb6d8fc3d3/=
hero-NL.jpg?t=3D1714555264" alt=3D"" height=3D"auto" width=3D"630" style=3D=
"display:block;width:100%;" border=3D"0"/></a></td></tr></table></td></tr><=
tr><td><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" c=
ellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#E8BEC7" style=3D"background=
-color:#E8BEC7;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%=
" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" ali=
gn=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-align:center;">=
<h1><span style=3D"color:#e8195a;">In this newsletter:</span></h1></td></tr=
></table></td></tr></table></td></tr><tr><td><table role=3D"none" width=3D"=
100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td b=
gcolor=3D"#E8BEC7" style=3D"background-color:#E8BEC7;padding:0px 0px 0px 0p=
x;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cell=
padding=3D"0"><tr><td class=3D"dd" align=3D"center" style=3D"padding:0px 15=
px;text-align:center;word-break:break-word;"><p><span style=3D"color:#e8195=
a;">Click on the topic below to read more:</span></p></td></tr></table></td=
></tr></table></td></tr><tr><td><table role=3D"none" width=3D"100%" border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#E=
8BEC7" style=3D"background-color:#E8BEC7;padding:0px 0px 0px 0px;"><table r=
ole=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0=
"><tr><td class=3D"dd" align=3D"center" style=3D"padding:0px 15px;text-alig=
n:center;word-break:break-word;"><p><span style=3D"color:rgb(232, 25, 90);"=
>Social program</span><br><span style=3D"color:#e8195a;"><b><a class=3D"lin=
k" href=3D"#event1" rel=3D"noopener noreferrer nofollow" clicktracking=3D"o=
ff"><span>Welcome reception</span></a></b></span><span style=3D"color:rgb(2=
32, 25, 90);"><b> | </b></span><span style=3D"color:rgb(232, 25, 90);"><b><=
a class=3D"link" href=3D"#event2" rel=3D"noopener noreferrer nofollow" clic=
ktracking=3D"off"><span>Conference dinner</span></a></b></span><span style=
=3D"color:rgb(232, 25, 90);"><b> | </b></span><span style=3D"color:rgb(232,=
 25, 90);"><b><a class=3D"link" href=3D"#event3" rel=3D"noopener noreferrer=
 nofollow" clicktracking=3D"off"><span>Farewell wine</span></a></b></span><=
/p></td></tr></table></td></tr></table></td></tr><tr><td><table role=3D"non=
e" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D=
""><tr><td bgcolor=3D"#E8BEC7" style=3D"background-color:#E8BEC7;padding:0p=
x 0px 0px 0px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacin=
g=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=3D"center" style=3D"pa=
dding:0px 15px;text-align:center;word-break:break-word;"><p><span style=3D"=
color:rgb(232, 25, 90);">Workshops</span><br><span style=3D"color:#e8195a;"=
><b><a class=3D"link" href=3D"#ws1" rel=3D"noopener noreferrer nofollow" cl=
icktracking=3D"off"><span>WS01</span></a></b></span><span style=3D"color:#e=
8195a;"><b> | </b></span><span style=3D"color:#e8195a;"><b><a class=3D"link=
" href=3D"#ws2" rel=3D"noopener noreferrer nofollow" clicktracking=3D"off">=
<span>WS02</span></a></b></span><span style=3D"color:rgb(232, 25, 90);"><b>=
 | </b></span><span style=3D"color:rgb(232, 25, 90);"><b><a class=3D"link" =
href=3D"#ws3" rel=3D"noopener noreferrer nofollow" clicktracking=3D"off"><s=
pan>WS03</span></a></b></span><span style=3D"color:rgb(232, 25, 90);"><b> |=
 </b></span><span style=3D"color:rgb(232, 25, 90);"><b><a class=3D"link" hr=
ef=3D"#ws4" rel=3D"noopener noreferrer nofollow" clicktracking=3D"off"><spa=
n>WS04</span></a></b></span><span style=3D"color:rgb(232, 25, 90);"><b> | <=
/b></span><span style=3D"color:rgb(232, 25, 90);"><b><a class=3D"link" href=
=3D"#ws5" rel=3D"noopener noreferrer nofollow" clicktracking=3D"off"><span>=
WS05</span></a></b></span><span style=3D"color:rgb(232, 25, 90);"><b> | </b=
></span><span style=3D"color:rgb(232, 25, 90);"><b><a class=3D"link" href=
=3D"#ws6" rel=3D"noopener noreferrer nofollow" clicktracking=3D"off"><span>=
WS06</span></a></b></span><br><span style=3D"color:rgb(232, 25, 90);"><b><a=
 class=3D"link" href=3D"#ws7" rel=3D"noopener noreferrer nofollow" clicktra=
cking=3D"off"><span>WS07</span></a></b></span><span style=3D"color:rgb(232,=
 25, 90);"><b> | </b></span><span style=3D"color:rgb(232, 25, 90);"><b><a c=
lass=3D"link" href=3D"#ws8" rel=3D"noopener noreferrer nofollow" clicktrack=
ing=3D"off"><span>WS08</span></a></b></span><span style=3D"color:rgb(232, 2=
5, 90);"><b> | </b></span><span style=3D"color:rgb(232, 25, 90);"><b><a cla=
ss=3D"link" href=3D"#ws9" rel=3D"noopener noreferrer nofollow" clicktrackin=
g=3D"off"><span>WS09</span></a></b></span><span style=3D"color:rgb(232, 25,=
 90);"><b> | </b></span><span style=3D"color:rgb(232, 25, 90);"><b><a class=
=3D"link" href=3D"#ws10" rel=3D"noopener noreferrer nofollow" clicktracking=
=3D"off"><span>WS10</span></a></b></span><span style=3D"color:rgb(232, 25, =
90);"><b> | </b></span><span style=3D"color:rgb(232, 25, 90);"><b><a class=
=3D"link" href=3D"#ws11" rel=3D"noopener noreferrer nofollow" clicktracking=
=3D"off"><span>WS11</span></a></b></span><span style=3D"color:rgb(232, 25, =
90);"><b> | </b></span><span style=3D"color:rgb(232, 25, 90);"><b><a class=
=3D"link" href=3D"#ws12" rel=3D"noopener noreferrer nofollow" clicktracking=
=3D"off"><span>WS12</span></a></b></span><br><span style=3D"color:rgb(232, =
25, 90);"><b><a class=3D"link" href=3D"#ws13" rel=3D"noopener noreferrer no=
follow" clicktracking=3D"off"><span>WS13</span></a></b></span><span style=
=3D"color:rgb(232, 25, 90);"><b> | </b></span><span style=3D"color:rgb(232,=
 25, 90);"><b><a class=3D"link" href=3D"#ws14" rel=3D"noopener noreferrer n=
ofollow" clicktracking=3D"off"><span>WS14</span></a></b></span><span style=
=3D"color:rgb(232, 25, 90);"><b> | </b></span><span style=3D"color:rgb(232,=
 25, 90);"><b><a class=3D"link" href=3D"#ws15" rel=3D"noopener noreferrer n=
ofollow" clicktracking=3D"off"><span>WS15</span></a></b></span><span style=
=3D"color:rgb(232, 25, 90);"><b> | </b></span><span style=3D"color:rgb(232,=
 25, 90);"><b><a class=3D"link" href=3D"#ws16" rel=3D"noopener noreferrer n=
ofollow" clicktracking=3D"off"><span>WS16</span></a></b></span><span style=
=3D"color:rgb(232, 25, 90);"><b> | </b></span><span style=3D"color:rgb(232,=
 25, 90);"><b><a class=3D"link" href=3D"#ws17" rel=3D"noopener noreferrer n=
ofollow" clicktracking=3D"off"><span>WS17</span></a></b></span><span style=
=3D"color:rgb(232, 25, 90);"><b> | </b></span><span style=3D"color:rgb(232,=
 25, 90);"><b><a class=3D"link" href=3D"#ws18" rel=3D"noopener noreferrer n=
ofollow" clicktracking=3D"off"><span>WS18</span></a></b></span></p></td></t=
r></table></td></tr></table></td></tr><tr><td id=3D"event1" class=3D"dd" al=
ign=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-align:center;"=
><h1>Social program</h1></td></tr><tr><td><table id=3D"ws" role=3D"none" wi=
dth=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><t=
r><td bgcolor=3D"transparent" style=3D"background-color:transparent;padding=
:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspa=
cing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=3D"center" valign=
=3D"top" style=3D"padding:0px 15px;text-align:center;"><h2><span style=3D""=
>Welcome reception</span></h2></td></tr><tr><td class=3D"dd" align=3D"cente=
r" style=3D"padding:0px 15px;text-align:center;word-break:break-word;"><p><=
span style=3D"color:rgb(36, 36, 36);font-family:Segoe UI, Segoe UI Web (Wes=
t European), Segoe UI, -apple-system, BlinkMacSystemFont, Roboto, Helvetica=
 Neue, sans-serif;font-size:15px;">on July 3rd at the=C2=A0</span><span sty=
le=3D"color:inherit;font-family:inherit;font-size:inherit;"><span style=3D"=
text-decoration:underline;"><a class=3D"link" href=3D"https://link.mail.bee=
hiiv.com/ss/c/u001.HWbaIzN_Uwz6M_iGulQC_38Hzmya9X_QjNcfZKXcOU8hrgPrj_SGx35r=
bBt-RtrM4saj3FfO-ySqP363FPaId_ezIZ4Azt-8qHehjHUdj2F2EBJEHIMDmQo1q1EYIr5SeuF=
mdhMrN-tO5FgfKRX72XHEg6wHRGXq2jVfBRlg3wgKZqJkdScQnMZXukRZco7FGdpnyCWhclE-rr=
_TgIFATQ/460/pZ-bDj7tTQG8OujmTzb7cw/h4/h001.NNSfdMRkhFCJz_HABK641yPQC2cG_tn=
M1_R5KjNVEg8" target=3D"_blank" rel=3D"noopener noreferrer nofollow"><span>=
Marine Sky</span></a></span></span><span style=3D"color:rgb(36, 36, 36);fon=
t-family:Segoe UI, Segoe UI Web (West European), Segoe UI, -apple-system, B=
linkMacSystemFont, Roboto, Helvetica Neue, sans-serif;font-size:15px;">, Ma=
rina Beach Club, Valencia</span></p></td></tr></table></td></tr></table></t=
d></tr><tr><td><table id=3D"ws" role=3D"none" width=3D"100%" border=3D"0" c=
ellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"transparen=
t" style=3D"background-color:transparent;padding:0px 0px 0px 0px;"><table r=
ole=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0=
"><tr><td align=3D"center" valign=3D"top" style=3D"padding: 0px 15px 0px; "=
 class=3D"dd"><table role=3D"none" border=3D"0" cellspacing=3D"0" cellpaddi=
ng=3D"0" style=3D"margin:0 auto 0 auto;"><tr><td align=3D"center" valign=3D=
"top" style=3D"width:441px;"><a href=3D"https://link.mail.beehiiv.com/ss/c/=
u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad22iyZsEIsXTeH_dvqXk2lG_x0T1t=
-11p8anhR50nW9-QT7R3bdWNIbZRVJYhkB5cfSlAN4yh9uUZ3EZL-OXo8rf7wJxtrY4Umh9hqwL=
o5sSgIPA3zrmtbD1SDchjdMo8pc7OUSl_JPQPuPMAaNM0VeKkIJFXLr5of4OYIlKKKVvo0saAsI=
o9-wfHuZ2929k7-lJx-kzPK1lUZcz0JsK8al/460/pZ-bDj7tTQG8OujmTzb7cw/h5/h001.Bi4=
VjYuJ5r0mTtUdkmLX5nrSGVBPxbwQLovnySxhwks" rel=3D"noopener noreferrer nofoll=
ow" style=3D"text-decoration:none;" target=3D"_blank"><img src=3D"https://m=
edia.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,format=3Dauto,onerror=3Dred=
irect,quality=3D80/uploads/asset/file/ba02412b-e311-46b1-acde-9797e246c512/=
marine-sky.jpg?t=3D1714630735" alt=3D"" height=3D"auto" width=3D"441" style=
=3D"display:block;width:100%;" border=3D"0"/></a></td></tr></table></td></t=
r></table></td></tr></table></td></tr><tr><td><table role=3D"none" width=3D=
"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td =
bgcolor=3D"transparent" style=3D"background-color:transparent;padding:0px 0=
px 0px 0px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0"><tr><td align=3D"center" valign=3D"top" style=3D"p=
adding-bottom:14px;padding-left:15px;padding-right:15px;padding-top:14px;te=
xt-align:center;width:100%;word-break:break-word;" class=3D"dd"><table role=
=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"center"=
><tr><td class=3D"v" align=3D"center" valign=3D"middle" height=3D"42" style=
=3D"height:42px;"><a href=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjLy=
NeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad22iyZsEIsXTeH_dvqXk2lG_x0T1t-11p8anhR50=
nW9-QT7R3bdWNIbZRVJYhkB5cfSlAN4yh9uUZ3EZL-OXo8rf7wJxtrY4Umh9hqwLo5sSgIPA3zr=
mtbD1SDchjdMo8pc7OUSl_JPQPuPMAaNM0VeKkIJFXLr5of4OYIlKKKVvo0saAsIo9-wfHuZ292=
9k7-lJx-kzPK1lUZcz0JsK8al/460/pZ-bDj7tTQG8OujmTzb7cw/h6/h001.mnZRjEVJIrBg2L=
LYZfnIzPP18Bg7C75ioEhBUXlI-yI" target=3D"_blank" rel=3D"noopener noreferrer=
 nofollow" style=3D"color:#155d9e;font-size:16px;padding:0px 14px;text-deco=
ration:none;"> Read More </a></td></tr></table></td></tr></table></td></tr>=
</table></td></tr><tr><td><table id=3D"event2" role=3D"none" width=3D"100%"=
 border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolo=
r=3D"#EFF2F7" style=3D"background-color:#EFF2F7;padding:0px 0px 0px 0px;"><=
table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpaddi=
ng=3D"0"><tr><td class=3D"dd" align=3D"center" valign=3D"top" style=3D"padd=
ing:0px 15px;text-align:center;"><h2><span style=3D"">Conference dinner</sp=
an></h2></td></tr><tr><td class=3D"dd" align=3D"center" style=3D"padding:0p=
x 15px;text-align:center;word-break:break-word;"><p><span style=3D"color:rg=
b(36, 36, 36);font-family:Segoe UI, Segoe UI Web (West European), Segoe UI,=
 -apple-system, BlinkMacSystemFont, Roboto, Helvetica Neue, sans-serif;font=
-size:15px;">on July 4th=C2=A0</span><span style=3D"color:rgb(33, 41, 52);f=
ont-family:Assistant, Arial, Helvetica, sans-serif;font-size:16px;">at the<=
/span><span style=3D"color:inherit;font-family:inherit;font-size:inherit;">=
=C2=A0</span><span style=3D"color:inherit;font-family:inherit;font-size:inh=
erit;"><span style=3D"text-decoration:underline;"><a class=3D"link" href=3D=
"https://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEj_KGo4KpT4LKE=
D127QZr5Qw4eeMUURVqUb5N7b9QrMftMRt2429oILCXlIeHv-EyF0tCbAxpelS476qWlx-Xo3Ek=
n0k3sjIHZf5gm2A_tErGWi2z6mH63uwF5yiUfJptb0c9CivmuQIKJRHWzMBXWKXq_2AC_YylN6O=
2mAeYN7KT-B019CPvVVqREp0tqjehB6JaSbgAeBkoPt43C8RyxML8ylv07T6gOvNKY5V1DOq8dd=
7Xf08lcpEFYbgD8xrPg/460/pZ-bDj7tTQG8OujmTzb7cw/h7/h001.3_40oFe3s0BqAinJG3wg=
jgbuTC3OTD4Lc13I3FUj1cU" target=3D"_blank" rel=3D"noopener noreferrer nofol=
low"><span>El Mirador de Only YOU</span></a></span></span><span style=3D"co=
lor:inherit;font-family:inherit;font-size:inherit;">=C2=A0</span><span styl=
e=3D"">on the top floor of the 5-star hotel Only YOU in downtown Valencia</=
span></p></td></tr></table></td></tr></table></td></tr><tr><td><table role=
=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" s=
tyle=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:#EFF2F7;pad=
ding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" border=3D"0" cel=
lspacing=3D"0" cellpadding=3D"0"><tr><td align=3D"center" valign=3D"top" st=
yle=3D"padding: 0px 15px 0px; " class=3D"dd"><table role=3D"none" border=3D=
"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"margin:0 auto 0 auto;"><tr=
><td align=3D"center" valign=3D"top" style=3D"width:441px;"><a href=3D"http=
s://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrp=
Iad22iyZsEIsXTeH_dvqXk2lG_x0T1t-11p8anhR50nW9-QT7R3bdWNIbZRVJYhkB5cfSlAN4yh=
9uUZ3EZL-OXo8rf7wJxtrY4Umh9hqwLo5sSgIPA3zrmtbD1SDchjdMo8pc7OUSl_JPQPuPMAaNM=
0VeKkIJFXLr5of4OYIlKKKVviW7_dszAp31srv6EYvDESe1nZrt7fjBVB7xMmwToMeJ/460/pZ-=
bDj7tTQG8OujmTzb7cw/h8/h001.SJYJa8sjEPC-l_Bh0D2RQH_5Myo3KtxJZgTEWqADWOI" re=
l=3D"noopener noreferrer nofollow" style=3D"text-decoration:none;" target=
=3D"_blank"><img src=3D"https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale=
-down,format=3Dauto,onerror=3Dredirect,quality=3D80/uploads/asset/file/8074=
b466-f5c8-4edc-b929-a9aa2c2562bf/only-you.jpg?t=3D1714631813" alt=3D"" heig=
ht=3D"auto" width=3D"441" style=3D"display:block;width:100%;" border=3D"0"/=
></a></td></tr></table></td></tr></table></td></tr></table></td></tr><tr><t=
d><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpa=
dding=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"background-colo=
r:#EFF2F7;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" bor=
der=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td align=3D"center" vali=
gn=3D"top" style=3D"padding-bottom:14px;padding-left:15px;padding-right:15p=
x;padding-top:14px;text-align:center;width:100%;word-break:break-word;" cla=
ss=3D"dd"><table role=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" align=3D"center"><tr><td class=3D"v" align=3D"center" valign=3D"midd=
le" height=3D"42" style=3D"height:42px;"><a href=3D"https://link.mail.beehi=
iv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad22iyZsEIsXTeH_dv=
qXk2lG_x0T1t-11p8anhR50nW9-QT7R3bdWNIbZRVJYhkB5cfSlAN4yh9uUZ3EZL-OXo8rf7wJx=
trY4Umh9hqwLo5sSgIPA3zrmtbD1SDchjdMo8pc7OUSl_JPQPuPMAaNM0VeKkIJFXLr5of4OYIl=
KKKVviW7_dszAp31srv6EYvDESe1nZrt7fjBVB7xMmwToMeJ/460/pZ-bDj7tTQG8OujmTzb7cw=
/h9/h001.HJyDPIZDjIleWR8_4omz5GsKRSw6PiAqERYBF1milak" target=3D"_blank" rel=
=3D"noopener noreferrer nofollow" style=3D"color:#155d9e;font-size:16px;pad=
ding:0px 14px;text-decoration:none;"> Read More </a></td></tr></table></td>=
</tr></table></td></tr></table></td></tr><tr><td><table id=3D"event3" role=
=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" s=
tyle=3D""><tr><td bgcolor=3D"transparent" style=3D"background-color:transpa=
rent;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=3D"ce=
nter" valign=3D"top" style=3D"padding:0px 15px;text-align:center;"><h2><spa=
n style=3D"">Farewell wine</span></h2></td></tr><tr><td class=3D"dd" align=
=3D"center" style=3D"padding:0px 15px;text-align:center;word-break:break-wo=
rd;"><p><span style=3D"color:rgb(33, 41, 52);font-family:Assistant, Arial, =
Helvetica, sans-serif;font-size:medium;">on July 5th at the Hall of the Fac=
ulty</span></p></td></tr></table></td></tr></table></td></tr><tr><td><table=
 role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D=
"0" style=3D""><tr><td bgcolor=3D"transparent" style=3D"background-color:tr=
ansparent;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" bor=
der=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td align=3D"center" vali=
gn=3D"top" style=3D"padding: 0px 15px 0px; " class=3D"dd"><table role=3D"no=
ne" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"margin:0 auto=
 0 auto;"><tr><td align=3D"center" valign=3D"top" style=3D"width:441px;"><a=
 href=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f=
83mS9u8hVzFrpIad22iyZsEIsXTeH_dvqXk2lG_x0T1t-11p8anhR50nW9-QT7R3bdWNIbZRVJY=
hkB5cfSlAN4yh9uUZ3EZL-OXo8rf7wJxtrY4Umh9hqwLo5sSgIPA3zrmtbD1SDchjdMo8pc7OUS=
l_JPQPuPMAaNM0VeKkIJFXLr5of4OYIlKKKVvnLXSvhwfA47Uj588xwH4ZussmWn8TXU9qNgElw=
On7KB/460/pZ-bDj7tTQG8OujmTzb7cw/h10/h001.VTPtbCsRFR_zc2xyTCZOM7CdowJwhOppm=
oVrfl4jSg4" rel=3D"noopener noreferrer nofollow" style=3D"text-decoration:n=
one;" target=3D"_blank"><img src=3D"https://media.beehiiv.com/cdn-cgi/image=
/fit=3Dscale-down,format=3Dauto,onerror=3Dredirect,quality=3D80/uploads/ass=
et/file/638d30fe-0f97-4968-93be-172a228d4507/facultat.jpg?t=3D1714632022" a=
lt=3D"" height=3D"auto" width=3D"441" style=3D"display:block;width:100%;" b=
order=3D"0"/></a></td></tr></table></td></tr></table></td></tr></table></td=
></tr><tr><td><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"transparent" style=
=3D"background-color:transparent;padding:0px 0px 0px 0px;"><table role=3D"n=
one" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><t=
d align=3D"center" valign=3D"top" style=3D"padding-bottom:14px;padding-left=
:15px;padding-right:15px;padding-top:14px;text-align:center;width:100%;word=
-break:break-word;" class=3D"dd"><table role=3D"none" border=3D"0" cellspac=
ing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td class=3D"v" align=3D"c=
enter" valign=3D"middle" height=3D"42" style=3D"height:42px;"><a href=3D"ht=
tps://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzF=
rpIad22iyZsEIsXTeH_dvqXk2lG_x0T1t-11p8anhR50nW9-QT7R3bdWNIbZRVJYhkB5cfSlAN4=
yh9uUZ3EZL-OXo8rf7wJxtrY4Umh9hqwLo5sSgIPA3zrmtbD1SDchjdMo8pc7OUSl_JPQPuPMAa=
NM0VeKkIJFXLr5of4OYIlKKKVvnLXSvhwfA47Uj588xwH4ZussmWn8TXU9qNgElwOn7KB/460/p=
Z-bDj7tTQG8OujmTzb7cw/h11/h001.L2S7-CoERQV8tNVuN-0eISjCvz3TlrULsfsuPnv_bSA"=
 target=3D"_blank" rel=3D"noopener noreferrer nofollow" style=3D"color:#155=
d9e;font-size:16px;padding:0px 14px;text-decoration:none;"> Read More </a><=
/td></tr></table></td></tr></table></td></tr></table></td></tr><tr><td alig=
n=3D"center" valign=3D"top" style=3D"font-size:0px;line-height:0px;padding:=
30px 0px;" class=3D"dd"><table class=3D"j" role=3D"none" width=3D"50%%" bor=
der=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td> &nb=
sp; </td></tr></table></td></tr><tr><td id=3D"workshops" class=3D"dd" align=
=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-align:center;"><h=
1>Workshops</h1></td></tr><tr><td><table id=3D"ws1" role=3D"none" width=3D"=
100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td b=
gcolor=3D"transparent" style=3D"background-color:transparent;padding:0px 0p=
x 0px 0px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D=
"0" cellpadding=3D"0"><tr><td class=3D"dd" align=3D"center" valign=3D"top" =
style=3D"padding:0px 15px;text-align:center;"><h2><span style=3D"">WS01. En=
abling the flow of knowledge for the Energy and Hydrogen Transition</span><=
/h2></td></tr><tr><td class=3D"dd" align=3D"center" style=3D"padding:0px 15=
px;text-align:center;word-break:break-word;"><p><span style=3D"color:rgb(0,=
 0, 0);">In this workshop, we will share our good practices from The Nether=
lands, of which the proven method of Learning Communities. We will illustra=
te how research, education, and practical implementation of innovations can=
 reinforce each other and better tackling societal challenges like the ener=
gy transition. Next, we would like to discuss the possibilities of an inter=
national network in which we can share learnings of proven and new concepts=
.</span></p></td></tr><tr><td align=3D"center" valign=3D"top" style=3D"padd=
ing-bottom:14px;padding-left:15px;padding-right:15px;padding-top:14px;text-=
align:center;width:100%;word-break:break-word;" class=3D"dd"><table role=3D=
"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"center"><t=
r><td class=3D"v" align=3D"center" valign=3D"middle" height=3D"42" style=3D=
"height:42px;"><a href=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNei=
HZgnZ0InFUCEtII-f83mS9u8hVzFrpIad14hr7oMXwaREjCGwTDWZ3Yr2-cBt-iaZ4P3kIhKy9x=
W80HcqUZDLTGfrnlk1dssW8R8FoNFKbgnfRBWkPmP6b8LOmVuzZB88eSFzk5z1PwZ24FI7-tpYb=
xzwDEVSLXYpMMQ6dbXoQZyopAbbP9_9DwL-Bv4EyhQ2Vc266psFCQdQ/460/pZ-bDj7tTQG8Ouj=
mTzb7cw/h12/h001.m-nN8nmGCs8M_9UzmyguEPw1av748HD73K8SvaXXmKI" target=3D"_bl=
ank" rel=3D"noopener noreferrer nofollow" style=3D"color:#155d9e;font-size:=
16px;padding:0px 14px;text-decoration:none;"> Read more </a></td></tr></tab=
le></td></tr></table></td></tr></table></td></tr><tr><td><table id=3D"ws2" =
role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"=
0" style=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:#EFF2F7=
;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" border=3D"0"=
 cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=3D"center" =
valign=3D"top" style=3D"padding:0px 15px;text-align:center;"><h2><span styl=
e=3D"">WS02. Sustainable Energy Education: Delivering the energy workforce =
of the future</span></h2></td></tr><tr><td class=3D"dd" align=3D"center" st=
yle=3D"padding:0px 15px;text-align:center;word-break:break-word;"><p><span =
style=3D"color:rgb(0, 0, 0);">This workshop aims to address the evolving la=
ndscape of the energy sector and the educational needs to deliver a skilled=
 work force that is ready to deliver clean energy access that is technologi=
cally sound, economically feasible, and locally appropriate. Through a pane=
l discussion and interactive session, this workshop will explore the role o=
f energy education in cultivating a workforce that is capable of addressing=
 the multiple, complex challenges faced within the sector.</span></p></td><=
/tr><tr><td align=3D"center" valign=3D"top" style=3D"padding-bottom:14px;pa=
dding-left:15px;padding-right:15px;padding-top:14px;text-align:center;width=
:100%;word-break:break-word;" class=3D"dd"><table role=3D"none" border=3D"0=
" cellspacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td class=3D"v" =
align=3D"center" valign=3D"middle" height=3D"42" style=3D"height:42px;"><a =
href=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f8=
3mS9u8hVzFrpIad35n8hCZE2kHba0yP4siU_de0TDKi_mUO9BNaZU_1wHb_8tt0GxWsofCNnaeJ=
i3SZD-8tDm9D5cAFKO4yFHf_xXVFtfWN2UPRY7mZq3Q0V9O-kldTwYbudJQAW_GczX4OKHYeoGL=
bnoIWPF4rmhhMTdVEl9P1V-MxXwVKULQLLEmg/460/pZ-bDj7tTQG8OujmTzb7cw/h13/h001.G=
zCdvyxfXM7_lYqUWc0deFHo0LesNkutUG_GBFuQgjk" target=3D"_blank" rel=3D"noopen=
er noreferrer nofollow" style=3D"color:#155d9e;font-size:16px;padding:0px 1=
4px;text-decoration:none;"> Read more </a></td></tr></table></td></tr></tab=
le></td></tr></table></td></tr><tr><td><table id=3D"ws3" role=3D"none" widt=
h=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr>=
<td bgcolor=3D"transparent" style=3D"background-color:transparent;padding:0=
px 0px 0px 0px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspaci=
ng=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=3D"center" valign=3D"=
top" style=3D"padding:0px 15px;text-align:center;"><h2><span style=3D"">WS0=
3. ESExNBS@NEB - Exploring Sustainable Education implementing the Nature-Ba=
sed Solution in the New European Bauhaus perspective</span></h2></td></tr><=
tr><td class=3D"dd" align=3D"center" style=3D"padding:0px 15px;text-align:c=
enter;word-break:break-word;"><p><span style=3D"color:rgb(0, 0, 0);">New Eu=
ropean Bauhaus (NEB) initiative aligns with the EU&#39;s goal of carbon neu=
trality by 2050, integrating aesthetics and sustainability inspired by hist=
oric Bauhaus movement. This workshop explores the key concepts of NEB =E2=
=80=93 sustainability, inclusiveness, aesthetics and social engagement =E2=
=80=93 =E2=80=8B=E2=80=8Bidentifying crucial skills for upskilling the work=
force in nature-based solutions (NBS) for urban regeneration. The workshop,=
 using the World Caf=C3=A9 method, aims to devise effective teaching techni=
ques, discovering skills essential to NEB&#39;s values =E2=80=8B=E2=80=8Ban=
d addressing environmental challenges. It brings together educators, profes=
sionals and organizations for cross-sector collaboration, emphasizing commu=
nity involvement and raising awareness about the potential of NBS in the NE=
B perspective.</span></p></td></tr><tr><td align=3D"center" valign=3D"top" =
style=3D"padding-bottom:14px;padding-left:15px;padding-right:15px;padding-t=
op:14px;text-align:center;width:100%;word-break:break-word;" class=3D"dd"><=
table role=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=
=3D"center"><tr><td class=3D"v" align=3D"center" valign=3D"middle" height=
=3D"42" style=3D"height:42px;"><a href=3D"https://link.mail.beehiiv.com/ss/=
c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad3uzjQNhPONTz0OXKTKbeUaJDOL=
EB156Agx-YqDpUJ5lvqC8Xb9IPbLAmWgv_0CCxQSDVpx1eM3ocRTctvAu57WIYuSovJeNoG_tIC=
kIfc4QKOhaqaaubad4ZY4Qqy1X9OzAXLsIDSCrPArxRo4BthIoKQfkq9grm02glfZ54oJYg/460=
/pZ-bDj7tTQG8OujmTzb7cw/h14/h001.nIBCRMOTWHf82M240VdmLlxxlX7F-lAn2OVaKapuCd=
Q" target=3D"_blank" rel=3D"noopener noreferrer nofollow" style=3D"color:#1=
55d9e;font-size:16px;padding:0px 14px;text-decoration:none;"> Read more </a=
></td></tr></table></td></tr></table></td></tr></table></td></tr><tr><td><t=
able id=3D"ws4" role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0"=
 cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"backgrou=
nd-color:#EFF2F7;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"10=
0%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" a=
lign=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-align:center;=
"><h2><span style=3D"">WS04. MINDS =E2=80=93 Meaningful Immersive Narrative=
s Driving Sustainability</span></h2></td></tr><tr><td class=3D"dd" align=3D=
"center" style=3D"padding:0px 15px;text-align:center;word-break:break-word;=
"><p><span style=3D"color:rgb(0, 0, 0);">The MINDS project aims to change y=
oung people&#39;s attitudes towards sustainability using Virtual Reality (V=
R) for immersive storytelling, marking a significant shift in sustainabilit=
y education. By making these complex issues more relatable and engaging, VR=
 can help foster a deeper understanding and urgency for environmental matte=
rs. This workshop shares experiences from the project&#39;s pilot, focusing=
 on narrative techniques in sustainability education, addressing educationa=
l challenges, and enhancing skills in creating compelling environmental nar=
ratives. To ensure that the project=E2=80=99s outcomes are tailored to the =
needs and expectations of educators, we invite you to share your thoughts a=
nd challenges in sustainability education. </span></p></td></tr><tr><td ali=
gn=3D"center" valign=3D"top" style=3D"padding-bottom:14px;padding-left:15px=
;padding-right:15px;padding-top:14px;text-align:center;width:100%;word-brea=
k:break-word;" class=3D"dd"><table role=3D"none" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0" align=3D"center"><tr><td class=3D"v" align=3D"cent=
er" valign=3D"middle" height=3D"42" style=3D"height:42px;"><a href=3D"https=
://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpI=
ad3v5YHnYr1vYAljlb2Ox0GzXUjq2V_FWtJMrl5O4MpvipkLw6bIHtWL7vU41B-dNZXVgUg7Mfq=
lqCjSPu0Kn9B0Xt3o44PegXj4FdzQhMUjLk9NghdQAaQj_D8q9kq5SMMsrTwRJzXBA3are7F09C=
aceu4wI6SJCNfXqT3766epuw/460/pZ-bDj7tTQG8OujmTzb7cw/h15/h001.guMUEWAHtX01Q5=
mpe5iihWGneKq3UaEO-oc6YXUYt6Y" target=3D"_blank" rel=3D"noopener noreferrer=
 nofollow" style=3D"color:#155d9e;font-size:16px;padding:0px 14px;text-deco=
ration:none;"> Read more </a></td></tr></table></td></tr></table></td></tr>=
</table></td></tr><tr><td><table id=3D"ws5" role=3D"none" width=3D"100%" bo=
rder=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=
=3D"#FFFFFF" style=3D"background-color:#FFFFFF;padding:0px 0px 0px 0px;"><t=
able role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpaddin=
g=3D"0"><tr><td class=3D"dd" align=3D"center" valign=3D"top" style=3D"paddi=
ng:0px 15px;text-align:center;"><h2><span style=3D"">WS05. Game-based Learn=
ing for Sustainability in Management Education (GAME-SME)</span></h2></td><=
/tr><tr><td class=3D"dd" align=3D"center" style=3D"padding:0px 15px;text-al=
ign:center;word-break:break-word;"><p><span style=3D"color:rgb(0, 0, 0);">T=
his workshop aims to provide an interactive platform for participants to sh=
are and discuss research findings, pedagogical strategies, and practical ex=
periences in utilizing business games as tools for teaching sustainability =
principles in management courses. The primary objective is to explore the i=
ntersection of two dynamic streams of research and educational trends: the =
utilization of learning/experimental games and the incorporation of sustain=
ability themes in management education. </span></p></td></tr><tr><td align=
=3D"center" valign=3D"top" style=3D"padding-bottom:14px;padding-left:15px;p=
adding-right:15px;padding-top:14px;text-align:center;width:100%;word-break:=
break-word;" class=3D"dd"><table role=3D"none" border=3D"0" cellspacing=3D"=
0" cellpadding=3D"0" align=3D"center"><tr><td class=3D"v" align=3D"center" =
valign=3D"middle" height=3D"42" style=3D"height:42px;"><a href=3D"https://l=
ink.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad1l=
HmmqP5iOdZUm1f9JVYI2CO2SKs76ucV09PC1q4mVZpG_C6sO9X1hQNcdwxN3ywhQsgE0PU36mS3=
6YWxk_GzZ9AO_pC4EOBjd6-xr0DPkn4XEwahxctaIL73y6pu5IBiJEgN6Gn80UAiPcOsvBA9sWS=
iCNEWRm0xWmbP57kUkPg/460/pZ-bDj7tTQG8OujmTzb7cw/h16/h001.T7looawT3Kr4nZERGq=
3Fj1oUYKl1KCvoKbYMSMIro8o" target=3D"_blank" rel=3D"noopener noreferrer nof=
ollow" style=3D"color:#155d9e;font-size:16px;padding:0px 14px;text-decorati=
on:none;"> Read more </a></td></tr></table></td></tr></table></td></tr></ta=
ble></td></tr><tr><td><table id=3D"ws6" role=3D"none" width=3D"100%" border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#E=
FF2F7" style=3D"background-color:#EFF2F7;padding:0px 0px 0px 0px;"><table r=
ole=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0=
"><tr><td class=3D"dd" align=3D"center" valign=3D"top" style=3D"padding:0px=
 15px;text-align:center;"><h2><span style=3D"">WS06. Empowering Through Edu=
cation: T-Shore&#39;s Approach to Wind Turbine Technician Training (T-shore=
Edu)</span></h2></td></tr><tr><td class=3D"dd" align=3D"center" style=3D"pa=
dding:0px 15px;text-align:center;word-break:break-word;"><p><span style=3D"=
color:rgb(0, 0, 0);">Welcome to &quot;Empowering Through Education: T-Shore=
&#39;s Approach to Wind Turbine Technician Training,&quot; a workshop desig=
ned for educators, trainers, and professionals committed to the advancement=
 of sustainable energy education. At the heart of our mission is the harmon=
isation of training programs across Europe, aiming to establish a standardi=
sed yet flexible curriculum that meets the diverse needs of offshore wind t=
echnicians. This ambition confronts the intricate challenge of aligning edu=
cational practices across five countries, each with its unique education sy=
stem and course programming methodologies.</span></p></td></tr><tr><td alig=
n=3D"center" valign=3D"top" style=3D"padding-bottom:14px;padding-left:15px;=
padding-right:15px;padding-top:14px;text-align:center;width:100%;word-break=
:break-word;" class=3D"dd"><table role=3D"none" border=3D"0" cellspacing=3D=
"0" cellpadding=3D"0" align=3D"center"><tr><td class=3D"v" align=3D"center"=
 valign=3D"middle" height=3D"42" style=3D"height:42px;"><a href=3D"https://=
link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad2=
bbZFje0nmw6yQ-lrxSMYVu129vJq51CBgCzK1xVpexVcStGdrkPrpxw2VRs--7OOLHTeh9yZJkP=
b3Zhi3vQwheFrvqFJ256rzbvxKtFCPKqcep8U9d080tEWwOfY4UkUv3OiZH2RKIwQENWYDdQn5q=
yAPvDuNueWGyP49xgFoDA/460/pZ-bDj7tTQG8OujmTzb7cw/h17/h001.VXdmB-yoVeHsxls7b=
qJPX3huRC_Wt_qBC7VF6khHqns" target=3D"_blank" rel=3D"noopener noreferrer no=
follow" style=3D"color:#155d9e;font-size:16px;padding:0px 14px;text-decorat=
ion:none;"> Read more </a></td></tr></table></td></tr></table></td></tr></t=
able></td></tr><tr><td><table id=3D"ws7" role=3D"none" width=3D"100%" borde=
r=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"t=
ransparent" style=3D"background-color:transparent;padding:0px 0px 0px 0px;"=
><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpad=
ding=3D"0"><tr><td class=3D"dd" align=3D"center" valign=3D"top" style=3D"pa=
dding:0px 15px;text-align:center;"><h2><span style=3D"">WS07. Build your ow=
n LEAF: Learning Ecosystem Taking Action for the Future</span></h2></td></t=
r><tr><td class=3D"dd" align=3D"center" style=3D"padding:0px 15px;text-alig=
n:center;word-break:break-word;"><p><span style=3D"color:rgb(0, 0, 0);">The=
 urgent sustainability challenges that students are expected to solve or co=
pe with in the future require holistic interventions. We developed learning=
 communities as part of a wider ecosystem to offer our students the opportu=
nity to collaborate, learn and innovate on equal footing with all sorts of =
knowledge partners. Involvement from applied sciences and vocational educat=
ion students, as well as private sector, government, and citizens ensures t=
hat they experience the complexity of the real world. Our workshop consists=
 of a simulation game that walks participants through the process of settin=
g up a learning ecosystem on climate action education.</span></p></td></tr>=
<tr><td align=3D"center" valign=3D"top" style=3D"padding-bottom:14px;paddin=
g-left:15px;padding-right:15px;padding-top:14px;text-align:center;width:100=
%;word-break:break-word;" class=3D"dd"><table role=3D"none" border=3D"0" ce=
llspacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td class=3D"v" alig=
n=3D"center" valign=3D"middle" height=3D"42" style=3D"height:42px;"><a href=
=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9=
u8hVzFrpIad3g-nYS-am3PsP2WxhBJR2e9wI_R_XqUtr3ByeBjh1MFmJs6vh92PuSKhLKx7LKj6=
HE7t7hIQFjIms3Oe6rBfGswNsV7NDD-xPX-_gDK38eT2QPs94rxI6OdS5ip50Ca8ldrVQLh8_WP=
2xzj85LL8eLMyi-L_5Ff53P5UssNF5dvw/460/pZ-bDj7tTQG8OujmTzb7cw/h18/h001.nN8fd=
jv5uWjS_rFst1-mb8LIclbjVFIwTBXLKVGeJMw" target=3D"_blank" rel=3D"noopener n=
oreferrer nofollow" style=3D"color:#155d9e;font-size:16px;padding:0px 14px;=
text-decoration:none;"> Read more </a></td></tr></table></td></tr></table><=
/td></tr></table></td></tr><tr><td><table id=3D"ws8" role=3D"none" width=3D=
"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td =
bgcolor=3D"#eef2f7" style=3D"background-color:#eef2f7;padding:0px 0px 0px 0=
px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cel=
lpadding=3D"0"><tr><td class=3D"dd" align=3D"center" valign=3D"top" style=
=3D"padding:0px 15px;text-align:center;"><h2><span style=3D"">WS08. Sustain=
able Business Models in practice: a business game competition (BG-COMP)</sp=
an></h2></td></tr><tr><td class=3D"dd" align=3D"center" style=3D"padding:0p=
x 15px;text-align:center;word-break:break-word;"><p><span style=3D"color:rg=
b(0, 0, 0);">The workshop immerses participants in a virtual clothing compa=
ny, challenging them to reevaluate traditional business models and achieve =
a sustainable balance between economic viability, environmental stewardship=
, and social responsibility. Through dynamic business game simulations, par=
ticipants gain practical experience, navigating real-world challenges and r=
efining their decision making acumen. The workshop aims to foster an unders=
tanding of sustainable business principles and their practical application =
in the fashion industry. Participants are encouraged to integrate the tripl=
e bottom line framework into their decision-making processes. </span></p></=
td></tr><tr><td align=3D"center" valign=3D"top" style=3D"padding-bottom:14p=
x;padding-left:15px;padding-right:15px;padding-top:14px;text-align:center;w=
idth:100%;word-break:break-word;" class=3D"dd"><table role=3D"none" border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td class=
=3D"v" align=3D"center" valign=3D"middle" height=3D"42" style=3D"height:42p=
x;"><a href=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUC=
EtII-f83mS9u8hVzFrpIad2J7XBKXMD8XKWIhly8A38ITt-rV2we4VuFZub-Faq5ACn3-H3aql9=
I52h2G4Ls4gNvz24XwvjOwPhQUOdzMtD25gD7sPNT3ngE5ad7Z8cWtLpCgMfM3g0nofYU9egcDi=
V76L9HppkaLUGAJOUr7IE9DEMMKR35ADpE7vQx2-Qnnw/460/pZ-bDj7tTQG8OujmTzb7cw/h19=
/h001.MHGZBGOIPv4ChE3tJC6HVXvH_7pAGAFViev9r_GoYys" target=3D"_blank" rel=3D=
"noopener noreferrer nofollow" style=3D"color:#155d9e;font-size:16px;paddin=
g:0px 14px;text-decoration:none;"> Read more </a></td></tr></table></td></t=
r></table></td></tr></table></td></tr><tr><td><table id=3D"ws9" role=3D"non=
e" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D=
""><tr><td bgcolor=3D"transparent" style=3D"background-color:transparent;pa=
dding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" border=3D"0" ce=
llspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=3D"center" val=
ign=3D"top" style=3D"padding:0px 15px;text-align:center;"><h2><span style=
=3D"">WS09. JUST GREEN AFRH2ICA - Unlocking African green hydrogen potentia=
l for mutual benefit cooperation with Europe</span></h2></td></tr><tr><td c=
lass=3D"dd" align=3D"center" style=3D"padding:0px 15px;text-align:center;wo=
rd-break:break-word;"><p><span style=3D"color:rgb(0, 0, 0);">Europe and Afr=
ica have to jointly promote a hydrogen transition to boost sustainable econ=
omic development and a decarbonization of their economic sector. African gr=
een hydrogen transition could boost local economies development, that=E2=80=
=99s why it=E2=80=99s important that both EU and AU hydrogen policies and d=
evelopment roadmaps have to be conceived in a cross-fertilizing way.</span>=
</p></td></tr><tr><td align=3D"center" valign=3D"top" style=3D"padding-bott=
om:14px;padding-left:15px;padding-right:15px;padding-top:14px;text-align:ce=
nter;width:100%;word-break:break-word;" class=3D"dd"><table role=3D"none" b=
order=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td cl=
ass=3D"v" align=3D"center" valign=3D"middle" height=3D"42" style=3D"height:=
42px;"><a href=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0In=
FUCEtII-f83mS9u8hVzFrpIad318-k_uEFhQwXXmy2KCANdJDFBQNSzjty4f1iv1Yb8iW_SjS5p=
tDQXLGyyPZviL_RWvh1qQDlrypKFfWyPN9BfQehPBHPb5Y3GjeV4b8eOQAtB62XpLeWQL8u4Wh2=
onODY_cbmhLdeqgOhUas5BjbwV-G0P1CwFxOn_I81pEcHLA/460/pZ-bDj7tTQG8OujmTzb7cw/=
h20/h001.SkJEoymWz50oTG_Urm86BCe3WJHY3m-iu1c6lY1BlpA" target=3D"_blank" rel=
=3D"noopener noreferrer nofollow" style=3D"color:#155d9e;font-size:16px;pad=
ding:0px 14px;text-decoration:none;"> Read more </a></td></tr></table></td>=
</tr></table></td></tr></table></td></tr><tr><td><table id=3D"ws10" role=3D=
"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" styl=
e=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:#EFF2F7;paddin=
g:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" border=3D"0" cellsp=
acing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=3D"center" valign=
=3D"top" style=3D"padding:0px 15px;text-align:center;"><h2><span style=3D""=
>WS10. Unveiling Training and Skill Requirements for Driving the Adoption o=
f Emerging Technologies in the Renewable Energy field. - RE-SKILLS Workshop=
</span></h2></td></tr><tr><td class=3D"dd" align=3D"center" style=3D"paddin=
g:0px 15px;text-align:center;word-break:break-word;"><p><span style=3D"colo=
r:rgb(0, 0, 0);">The RE-SKILLS workshop aims to address the demand for skil=
led professionals capable of implementing cutting-edge technological propos=
als in the dynamic landscape of the energy sector. With a focus on novel te=
chnological concepts, the event will bring together industry experts, acade=
mia, and professionals to identify essential skills and capabilities requir=
ed for successful integration.</span></p></td></tr><tr><td align=3D"center"=
 valign=3D"top" style=3D"padding-bottom:14px;padding-left:15px;padding-righ=
t:15px;padding-top:14px;text-align:center;width:100%;word-break:break-word;=
" class=3D"dd"><table role=3D"none" border=3D"0" cellspacing=3D"0" cellpadd=
ing=3D"0" align=3D"center"><tr><td class=3D"v" align=3D"center" valign=3D"m=
iddle" height=3D"42" style=3D"height:42px;"><a href=3D"https://link.mail.be=
ehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad3vONXJ1IzhwhL=
ChX2LjQZMNlzyiMeXYZDILNhcsZ0mp8jtYcACUlE_s7c2h2LDr5OugDzqHEQpmKfsArCDw9beaY=
-isjFOSnicBCLAc9eEboYPXwSG4OYNP9jwRrwyzLOyxUQqSkEeVLPiLn0LAtKAqZe6hH7t_1FnG=
A_rYd9uRg/460/pZ-bDj7tTQG8OujmTzb7cw/h21/h001.2_vomoqbPB45b8NxcBZMKTYcG9DsI=
hcjREiCb0GY0l8" target=3D"_blank" rel=3D"noopener noreferrer nofollow" styl=
e=3D"color:#155d9e;font-size:16px;padding:0px 14px;text-decoration:none;"> =
Read more </a></td></tr></table></td></tr></table></td></tr></table></td></=
tr><tr><td><table id=3D"ws11" role=3D"none" width=3D"100%" border=3D"0" cel=
lspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"transparent"=
 style=3D"background-color:transparent;padding:0px 0px 0px 0px;"><table rol=
e=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0">=
<tr><td class=3D"dd" align=3D"center" valign=3D"top" style=3D"padding:0px 1=
5px;text-align:center;"><h2><span style=3D"">WS11. Attract and train Europe=
an technicians in Energy Transition</span></h2></td></tr><tr><td class=3D"d=
d" align=3D"center" style=3D"padding:0px 15px;text-align:center;word-break:=
break-word;"><p><span style=3D"">In Europe, the shift towards sustainable e=
nergy faces a chagenge: a shortage of skilled technicians. Studies show a n=
eed for maintenance and operational experts, with around 1.5 million indivi=
duals requiring training yearly. For this reasson, a workshop, building upo=
n the Erasmus+ GreenTech project (2022-2024) focusing on renewable energy t=
raining, seeks to exchange insights and best practices.</span></p></td></tr=
><tr><td class=3D"dd" align=3D"center" style=3D"padding:0px 15px;text-align=
:center;word-break:break-word;"><p><span style=3D"">Core discussions revolv=
e around improving training attractivity understanding industry demands, ev=
aluating current and future training schemes, and spreading practical cours=
es. The workshop aims to promote collaboration on regional, national, and i=
nternational levels to tackle Europe&#39;s technician deficit and achieve c=
arbon neutrality and energy transition.</span></p></td></tr><tr><td align=
=3D"center" valign=3D"top" style=3D"padding-bottom:14px;padding-left:15px;p=
adding-right:15px;padding-top:14px;text-align:center;width:100%;word-break:=
break-word;" class=3D"dd"><table role=3D"none" border=3D"0" cellspacing=3D"=
0" cellpadding=3D"0" align=3D"center"><tr><td class=3D"v" align=3D"center" =
valign=3D"middle" height=3D"42" style=3D"height:42px;"><a href=3D"https://l=
ink.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad0B=
Q1dc2LHWElEAyyRiasAD25-ZEt02kBowHMwRv1giuLX4JWQJec27vhiVgJnaqWi5r0qItZLMpsm=
hWLCr-8Nn1VtbjmtbR5g0rof0Ogu12TgxkizR9OAd9BsUU23M9uayQT3IR0EA3X-pmAUX158lRt=
hRJrmj4o-_QmrhaqdXBg/460/pZ-bDj7tTQG8OujmTzb7cw/h22/h001.mDz6ws4G-oVwtRQQd0=
pLmJ8L-neiFoP_S3_AffZ58c0" target=3D"_blank" rel=3D"noopener noreferrer nof=
ollow" style=3D"color:#155d9e;font-size:16px;padding:0px 14px;text-decorati=
on:none;"> Read more </a></td></tr></table></td></tr></table></td></tr></ta=
ble></td></tr><tr><td><table id=3D"ws12" role=3D"none" width=3D"100%" borde=
r=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#=
EFF2F7" style=3D"background-color:#EFF2F7;padding:0px 0px 0px 0px;"><table =
role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"=
0"><tr><td class=3D"dd" align=3D"center" valign=3D"top" style=3D"padding:0p=
x 15px;text-align:center;"><h2><span style=3D"">WS12. Transforming Sustaina=
ble Energy Education (TranSEED)</span></h2></td></tr><tr><td class=3D"dd" a=
lign=3D"center" style=3D"padding:0px 15px;text-align:center;word-break:brea=
k-word;"><p><span style=3D"color:rgb(0, 0, 0);">In this workshop we invite =
you to experience a technology demonstration and subsequently help us to tr=
ansform traditional mono-disciplinary technology education into transdiscip=
linary and multilevel challenge-based education. You will gain insights in =
two interesting technology applications and will have the opportunity to en=
rich your and our perspectives on transdisciplinary, multilevel and challen=
ge-based education.</span></p></td></tr><tr><td align=3D"center" valign=3D"=
top" style=3D"padding-bottom:14px;padding-left:15px;padding-right:15px;padd=
ing-top:14px;text-align:center;width:100%;word-break:break-word;" class=3D"=
dd"><table role=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" a=
lign=3D"center"><tr><td class=3D"v" align=3D"center" valign=3D"middle" heig=
ht=3D"42" style=3D"height:42px;"><a href=3D"https://link.mail.beehiiv.com/s=
s/c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad03s2UdVRXT4QYQ5oyiTS0r5N=
IXzkEovPwF4kJ_yJj7YHIQaWcsf5aI75SHp5kcbFtCFBrvXgR3MZk7-98v2gJdtA0OeXsLPAj65=
s7AcSu-QbuD5O5oBB2KYBWoLpUXYT0zfnigqaXS4ovLelbFZOEq3FDjHh3W1_cY6jBkC5AnCw/4=
60/pZ-bDj7tTQG8OujmTzb7cw/h23/h001.WNdRuJKJoJMwdy9yoe47S4JzHp0aC-jqp8eCCxkp=
Pjs" target=3D"_blank" rel=3D"noopener noreferrer nofollow" style=3D"color:=
#155d9e;font-size:16px;padding:0px 14px;text-decoration:none;"> Read more <=
/a></td></tr></table></td></tr></table></td></tr></table></td></tr><tr><td>=
<table id=3D"ws13" role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D=
"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"transparent" style=3D"b=
ackground-color:transparent;padding:0px 0px 0px 0px;"><table role=3D"none" =
width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td cla=
ss=3D"dd" align=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-al=
ign:center;"><h2><span style=3D"">WS13. Applied and Innovative Research wit=
hin VET Education for the Energy transition</span></h2></td></tr><tr><td cl=
ass=3D"dd" align=3D"center" style=3D"padding:0px 15px;text-align:center;wor=
d-break:break-word;"><p><span style=3D"color:rgb(0, 0, 0);">Research learni=
ng to enhance innovation in cooperation with SME, industries and vocation t=
raining facilitators is a crucial way for the sustainable and digital trans=
formation in all areas of the society. One of the outcomes of the AIRinVET =
Project (</span><span style=3D"color:rgb(0, 0, 0);"><a class=3D"link" href=
=3D"https://link.mail.beehiiv.com/ss/c/u001.o98ZmFoeX17ibF2OqvnWIxI6P7jeHjZ=
hoDGFpIirc_yAZ4cKTVW7zgBY7YhSm1O0I5vIhcaaOEUBAgiae_KiIhOzKHWR3Z795sOq7LkQrZ=
aLBteEl6vb85IreTZ_tC96US6B2HiJZtEPWCR9SlzXNLLdhnviS1BNDuadVPW72tSV_bFBe08dJ=
K1qv3Ewt8IP/460/pZ-bDj7tTQG8OujmTzb7cw/h24/h001.Q9XjswDVvZgeBBRpeVL3xfk2VIS=
sOL1tKN8IZOAlEO0" target=3D"_blank" rel=3D"noopener noreferrer nofollow"><s=
pan>https://airnvet.eu</span></a></span><span style=3D"color:rgb(0, 0, 0);"=
>) is a mapping of applied research activities in vocational education and =
Training. The workshop will show and discuss approaches as well as results =
of the AIRinVET Project and give best practice from Germany and The Netherl=
ands on how to design cooperative curricula and research learning programs =
with the private sector for a successful implementation of sustainable ener=
gy education.</span></p></td></tr><tr><td align=3D"center" valign=3D"top" s=
tyle=3D"padding-bottom:14px;padding-left:15px;padding-right:15px;padding-to=
p:14px;text-align:center;width:100%;word-break:break-word;" class=3D"dd"><t=
able role=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=
=3D"center"><tr><td class=3D"v" align=3D"center" valign=3D"middle" height=
=3D"42" style=3D"height:42px;"><a href=3D"https://link.mail.beehiiv.com/ss/=
c/u001.ZwnjLyNeiHZgnZ0InFUCEtII-f83mS9u8hVzFrpIad0OGvyvqDFNShBzjBgWsnOtMcy-=
EeLw1HIlO7CV4zPpndTr6R0wi0SlJt_mcRYiXCfLNiZxRM9OaN-GjWs7hOndqLmH76iBaWedmAT=
bnPlZlzV9qxLVp_Q92KS61WmI_5aEEmBDDsUJLWyE90uhGl6UIS7laaCx1br85t-Ad0qzbw/460=
/pZ-bDj7tTQG8OujmTzb7cw/h25/h001.WtI9r_v183MRjrY1dlfc4PIq80BBsr-8rwhThnoZVN=
8" target=3D"_blank" rel=3D"noopener noreferrer nofollow" style=3D"color:#1=
55d9e;font-size:16px;padding:0px 14px;text-decoration:none;"> Read more </a=
></td></tr></table></td></tr></table></td></tr></table></td></tr><tr><td><t=
able id=3D"ws14" role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0=
" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"backgro=
und-color:#EFF2F7;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"1=
00%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" =
align=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-align:center=
;"><h2><span style=3D"">WS14. H2 VIRTUAL TRAINING</span></h2></td></tr><tr>=
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
1P2hoOyNSvCoL0gmjenKZxbgfGcpxQRR30X3CWm4_I-lxEYnO9S4eyfEGc_Ybaqxg/460/pZ-bD=
j7tTQG8OujmTzb7cw/h26/h001.-CJPLH_Wfo9mAWUN8yPjOayO3gvKKeRcZWAc3NAfoxM" tar=
get=3D"_blank" rel=3D"noopener noreferrer nofollow" style=3D"color:#155d9e;=
font-size:16px;padding:0px 14px;text-decoration:none;"> Read more </a></td>=
</tr></table></td></tr></table></td></tr></table></td></tr><tr><td><table i=
d=3D"ws15" role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cell=
padding=3D"0" style=3D""><tr><td bgcolor=3D"transparent" style=3D"backgroun=
d-color:transparent;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D=
"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd=
" align=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-align:cent=
er;"><h2><span style=3D"">WS15. Facilitating upliftings in solar energy sto=
rage (FUSES)</span></h2></td></tr><tr><td class=3D"dd" align=3D"center" sty=
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
LZNplvbaJGNQw67zK7sfs8GlWhPVVWQ8lUq-3QtDtcwIsvx1LOmnVFLseAk38N_t2JTWlHewfpI=
K-pkyvoKapU4tzqIBmNVpRAIVw/460/pZ-bDj7tTQG8OujmTzb7cw/h27/h001.2-8yV-AwnfSl=
sL_5vw0QVLb1aSc9eb9eOAkzC464UZs" target=3D"_blank" rel=3D"noopener noreferr=
er nofollow" style=3D"color:#155d9e;font-size:16px;padding:0px 14px;text-de=
coration:none;"> Read more </a></td></tr></table></td></tr></table></td></t=
r></table></td></tr><tr><td><table id=3D"ws16" role=3D"none" width=3D"100%"=
 border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolo=
r=3D"#EFF2F7" style=3D"background-color:#EFF2F7;padding:0px 0px 0px 0px;"><=
table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpaddi=
ng=3D"0"><tr><td class=3D"dd" align=3D"center" valign=3D"top" style=3D"padd=
ing:0px 15px;text-align:center;"><h2><span style=3D"">WS16. Challenges of I=
nternational Master Degree Courses in Renewable Energy Systems</span></h2><=
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
kmELBQ8UtwoHQboQTPkEXZAX6UxUhEex6oNtbIedumn2oL46Kj4a239llgG--v-BbSNEPPue2WG=
BeqgtCnueaEBJEVKASGLU7k1QXE7WHfCQ/460/pZ-bDj7tTQG8OujmTzb7cw/h28/h001.wRn1G=
rRISA9DvZ911BzM8Ie3zNbxwrk_VUJJAnFBca8" target=3D"_blank" rel=3D"noopener n=
oreferrer nofollow" style=3D"color:#155d9e;font-size:16px;padding:0px 14px;=
text-decoration:none;"> Read more </a></td></tr></table></td></tr></table><=
/td></tr></table></td></tr><tr><td><table id=3D"ws17" role=3D"none" width=
=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><=
td bgcolor=3D"transparent" style=3D"background-color:transparent;padding:0p=
x 0px 0px 0px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacin=
g=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=3D"center" valign=3D"t=
op" style=3D"padding:0px 15px;text-align:center;"><h2><span style=3D"">WS17=
. Explore integration of sustainability in education from a reflexive, SDG =
and entrepreneurship perspective</span></h2></td></tr><tr><td class=3D"dd" =
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
Seg-mXY_GQ0Hgc5FY_GJan3HRd2iHAmBwVZ6BdncBgUGyOwDt8cDNOuitKwAj-SCOjT26GFoeAB=
rw/460/pZ-bDj7tTQG8OujmTzb7cw/h29/h001.hFji-AonOfNKa3hhgZa7YbV3ylm3AAtJCUiX=
hjuyUJQ" target=3D"_blank" rel=3D"noopener noreferrer nofollow" style=3D"co=
lor:#155d9e;font-size:16px;padding:0px 14px;text-decoration:none;"> Read mo=
re </a></td></tr></table></td></tr></table></td></tr></table></td></tr><tr>=
<td><table id=3D"ws18" role=3D"none" width=3D"100%" border=3D"0" cellspacin=
g=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"b=
ackground-color:#EFF2F7;padding:0px 0px 0px 0px;"><table role=3D"none" widt=
h=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=
=3D"dd" align=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-alig=
n:center;"><h2><span style=3D"">WS18. Accelerate matchmaking in a network: =
what can we learn from trees and computers?</span></h2></td></tr><tr><td cl=
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
Qxrby5dSJPnA8rsF5MvSlnMdh1rGxyMUEWzgXeFLJA6A/460/pZ-bDj7tTQG8OujmTzb7cw/h30=
/h001.wl1ZwLx-w4Uf-5XQlRg4JdzcOrfMZoKfZyAkLZ1eLuU" target=3D"_blank" rel=3D=
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
S4h67bDL_SP68WxGrLL304w4Jj6qV4xNyIDDLiKyrw/460/pZ-bDj7tTQG8OujmTzb7cw/h31/h=
001.ukQ0m7B9tSgKX1k8qk7XgPUhuQ8QMC3sJHjinkFvTLc" style=3D"text-decoration:n=
one;"><img width=3D"22" alt=3D"fb" border=3D"0" style=3D"display:block;max-=
width:22px;" src=3D"https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-dow=
n,format=3Dauto,onerror=3Dredirect,quality=3D80/static_assets/facebook_ligh=
t.png"/></a></td><td align=3D"center" valign=3D"middle" width=3D"75" style=
=3D"width:75px;"><a href=3D"https://link.mail.beehiiv.com/ss/c/u001.DkovfOe=
42zeF8J2PGc-l9JWeF4Fr-3YAtmHtZ2Sv9HWS82eIFxttnHWrIIQXrZT6ByPO9IaiKIb6411H-Y=
1F-xyZ_4h5YgpQ3H-yLh09RU6dbr-kgaHQmZgGeq_2XPiG0E5j02gLVyKm8dfBSZ7QQL0Xy_RG-=
r4TPmZwWrf84TXd_jmaFyIrFTPwo9rbYNAW5luZ9DqeN36wDQcWOMqHuuvsJWgGMfNGPVYCIUcP=
FfOiTvHcGLS_T_VVoQcs9HYh/460/pZ-bDj7tTQG8OujmTzb7cw/h32/h001.wgJVRtMyIYTsAR=
GLU5vtwt5c_RYlLP3hdWAWPSQIY2M" style=3D"text-decoration:none;"><img width=
=3D"22" alt=3D"tw" border=3D"0" style=3D"display:block;max-width:22px;" src=
=3D"https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,format=3Dauto,=
onerror=3Dredirect,quality=3D80/static_assets/x_light.png"/></a></td><td al=
ign=3D"center" valign=3D"middle" width=3D"75" style=3D"width:75px;"><a href=
=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0InFUCEgQL3fCPI0U=
GohOuyW2ouphYybemeBB4ZMDoBTQY0JS0bHFoVLDfCyK6TRiAhZmKE6XTaXy-999lEhk2imgQvO=
uzPswMMxEn0-Ae0fy6E7YW3KwXYEOfSdQS_wIVUWzHj5I41vyJKDDIExM4w_OPd40H9qGi5yATl=
AI-PBaXMc8Cc0idDfWVmxoHfcxO16ce8A/460/pZ-bDj7tTQG8OujmTzb7cw/h33/h001.7a8qb=
cf3uACf4KXN2kGxTBUthF8pbHjBpuMtnJvZDT0" style=3D"text-decoration:none;"><im=
g width=3D"22" alt=3D"ig" border=3D"0" style=3D"display:block;max-width:22p=
x;" src=3D"https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,format=
=3Dauto,onerror=3Dredirect,quality=3D80/static_assets/instagram_light.png"/=
></a></td><td align=3D"center" valign=3D"middle" width=3D"75" style=3D"widt=
h:75px;"><a href=3D"https://link.mail.beehiiv.com/ss/c/u001.ZwnjLyNeiHZgnZ0=
InFUCEm2dDc-sVKPd-Sw1-4Z05tGknkZ8i31iC4ZoYOXs_yCE1KJniN4EfcFzIiiGROI_JwEUnQ=
0pN4BlSU7SPgGWrNSbLvNcLsCNrWQ3wikzNdA6HfwYwAPSLNtwtwIC-dx8CbuGIPn-NhWmo1zut=
t916G9mhs302RkyNoeApon7PMJUtHIBZXCYXqTK2AdcwTVXHasLNsBqQzM1o9Evrln6_TM/460/=
pZ-bDj7tTQG8OujmTzb7cw/h34/h001.eZbnZdcVEVyHZL0SF_2-E11uR5G5k05D3YEeJyxVdLc=
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
N0F-xqwnBuAa_i-kaVYEO8cjZBYqwQ4e-miYY71Jp8NiIXQo0F0ykt7Xh-49gqsXvyQTysRfxlA=
-H3eR-r6vZVUKmlGwOChJ3tFwhKxtqh7iJHpvt9TC7FnUoNQ6g7Mczqf3QuDBu42GU3RtnHFiYp=
PNHNueysFI3Yy01-aM3rGcfxVzQY4eu-i5iYKCAfK68pCjprQCHikTioFXvPVCz7vnNNziN5GTe=
wgGkDt8D24tm6BBvRIL1bI1BzS32SKOUWGXD7sRZQurfN9Jf3qBGp7Bx1pI6saYojlOxwzDA8CO=
r7hIhlE5_MyD6DdZMQdC4Ih9MZCdf0eI_lOUS-mZddy5Aqltly2EFaF8eYHsqbaudGTSlGwCHbw=
QMO3aTjDAHYB2AbPgoAm-HaUTJ8MTvM1mzMira2aLm9dFqDqYe-bgCC38-3Wv820TODj98lkiin=
zkyfKl6kCbXH2vd2WBrgSgH2m4JqANIqrwWdyPkKKvXsTu2XUwnpJ7t2gNtgtSF7H4WV8gd6_U0=
VLlTgmrEhv3ZQZ12au7ZGA_VANwj6KvzLziRPNRDxVSKAWgp609yGeIx4rH7d8TwjOq5FkVjA/4=
60/pZ-bDj7tTQG8OujmTzb7cw/h35/h001.wqP2lUjUlBcT8D34JkNp_n0b0XpO55cOy8YrZsZL=
nVM" style=3D"text-decoration:underline;text-decoration-color:#FFFFFF!impor=
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
aJNeZkZa1HU3u4RNHfuYoYPXavoK406lhyBVN5-otKIJyhtvFlJhzGdZDjRS2yPDGEi2eQy7DUY=
NQD1J_FsLSOXec_2Iyv-4KkUpP_-rVi8NNOZ8bfzoPHa5S7o4PKe_nkxtyCsd2mZ3ecLKUYWmB6=
ALqsAQBRjDrKAOwTGYecG1-BBkKCdDnSA/460/pZ-bDj7tTQG8OujmTzb7cw/h36/h001.s6C9v=
5A2UZe0ePFv745PlLUwCHBXBdt5-HHnmOm2GBI"><img src=3D"https://media.beehiiv.c=
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
om/d/msgid/jailhouse-dev/ybcju4VXTwK9dZU5lQTHSw%40geopod-ismtpd-25?utm_medi=
um=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailhouse=
-dev/ybcju4VXTwK9dZU5lQTHSw%40geopod-ismtpd-25</a>.<br />

--2036cbabd157bf75cdb20dd477c34da18f834c758a245cd3573332a3ff23--
