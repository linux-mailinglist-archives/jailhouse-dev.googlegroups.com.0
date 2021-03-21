Return-Path: <jailhouse-dev+bncBAABBZPS3OBAMGQE6I3CJCQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C723431A2
	for <lists+jailhouse-dev@lfdr.de>; Sun, 21 Mar 2021 08:44:37 +0100 (CET)
Received: by mail-lj1-x23d.google.com with SMTP id q20sf20059982lja.20
        for <lists+jailhouse-dev@lfdr.de>; Sun, 21 Mar 2021 00:44:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616312677; cv=pass;
        d=google.com; s=arc-20160816;
        b=lytrKQl51Algl+MBidf8oeqvg7E9KBb9uEf8adpmJuoLwdgWaPt326ZRiAu2nO9YKS
         5bdjknfPrmG7uoLazWHqY7YBLfdAgLtEKR0fioP1Ou4YH4IK/nsgYpnSUCi8kqavBMoj
         sEZyAi69KpZAeHXEZRuGYxPymLqe7jr4oAcURaK8E7k1wv++5OTFxQLqhUTInipB50eL
         ILrpBYqJRb1CFrEXyPfrwa+h4uZJdnC8RCEnRF8TyL9POnqjKU6APNOe9cZJgHRKOltJ
         zvDmI1m43tghRF+yLVRNkOvuE5dxI0SzAh/9/CxujZG/cIIlGlCSKZfOvCoHwr8pzk1g
         prZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-transfer-encoding:mime-version
         :subject:list-unsubscribe:feedback-id:message-id:date:reply-to:from
         :to:sender:dkim-signature;
        bh=5Cj+p8U1dGvupcnjP6C/tTCqLpkS8oTOW/S41LM+wWE=;
        b=na1XFvd3Ymod6uwDJV4dhGeF8uQjXP71/VxVSD+vhfhYG5vp1iEnhFe7tUj8jqVA0U
         QVT3h8jQB4j0freXr5spigmeTTWie8iugreeh3SyRt5aTN8F657ASpSUTdjDw5i4cc6i
         5cr4a5gBvBsY9qI7vfp+2fGlVF4rImqXCm4cv05KsmZClIPBskCLrs/qS1s+kD78nufV
         mI9NrptKh3H1K2Q+PfrHufuN8QfkLBGSew2k6DrsDZh/MLBhjJWoWc3KlamlqeaYEW0t
         YybS2fIt5gGqTTj0wExAY8P+oQorL9z06hE5m5ALWeiw4j75y3x6rAiLY9CKnWRgBfJ3
         VxGw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=neutral (invalid public key) header.i=@ics.events header.s=dkim header.b=E+fM0Any;
       spf=softfail (google.com: domain of transitioning conf@ics.events does not designate 93.159.215.162 as permitted sender) smtp.mailfrom=conf@ics.events
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:reply-to:date:message-id:feedback-id
         :list-unsubscribe:subject:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe;
        bh=5Cj+p8U1dGvupcnjP6C/tTCqLpkS8oTOW/S41LM+wWE=;
        b=Hoh1A0Gk7rqOhCUb3WdCYo3mLf2+Z2+fZdDcxc/XWevxOQyc31Zjc4wXMM3LCQfryA
         GnDcg7DTAHzzPRkdKU5S4O+ejZXSiicy5LPV0pnHyAqejxI5b1nmEshIVCoTehwMVeDG
         A2vWhJdR/oC3PfyE+GxL7gB29asE0J3aXVRGojR+T8y1plrlJx7jx9TtBIS4G7q2XiTY
         NxXtmIyvJji95stNqRks9djs4Oon1MB+qojVEV1HnE2Jia8i6N2HrJYGTmdalk1gI6FJ
         sY6kCn5TdcBoyZTqhmxbvM8O0h2Rh1DIF05BkliuXBksuYbp90ZZnFocwAwuiCIF2XV+
         l83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:reply-to:date:message-id
         :feedback-id:list-unsubscribe:subject:mime-version
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe;
        bh=5Cj+p8U1dGvupcnjP6C/tTCqLpkS8oTOW/S41LM+wWE=;
        b=XCn6bhQaP7kSaIjgY0lqbZZzvN2s/kG2LX82QePS7IW10+W7pprkzzOr1jLmjKZbDJ
         AS1eBEHumkIg+D9qiwP6sZYeaoqX9PeBEMm5ljVCVHaDOJ0x/WXLyJutjXy5zURFCazf
         zzY+6y/uLC0qbV40npdt+zZYpsYR1aFf3fUWLimi7YrYvtIZp9Gny2hHvxY7eNdmcHyx
         7+mYBLxaf1I9N0QCU0hRWISrxHFUOz7QLaoAcwmsGOfpDjxuvASKMQiGjwKt8VjFpfwV
         44vjR7Ar+tK3V1yyXzZl5lw8gUqqHiYGAjfusyotpJ3HZQPx5uKw7WowDZ0H4iC5fYBZ
         S92w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531QtuWLJizPllBySBg3gHCaj3lhSktGYFumvZwrdtK2IPRaEMMy
	FEHvz7x3TxT0JAt5s+XlPQg=
X-Google-Smtp-Source: ABdhPJwFra3QDlO2l0urjcOPOZJ/rFeAf73rs1efpsj655DKd+f/decaudeTKRoMoZa92QqrKhq6Kg==
X-Received: by 2002:a2e:9d14:: with SMTP id t20mr5947332lji.391.1616312677399;
        Sun, 21 Mar 2021 00:44:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:6c2:: with SMTP id u2ls190969lff.3.gmail; Sun, 21
 Mar 2021 00:44:36 -0700 (PDT)
X-Received: by 2002:a05:6512:3290:: with SMTP id p16mr5557468lfe.150.1616312676370;
        Sun, 21 Mar 2021 00:44:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616312676; cv=none;
        d=google.com; s=arc-20160816;
        b=KQz4pjgVfRBeUJeIvro1BwNF59WuJ1swKubAwtaTT+Blw1A/XVUl3tcFuPLFkOAdob
         xF2Ny0jB+7+sfx4nwpKU4/BwQyRGcKr7OLz9xzXlY7rLE4Mec23ps9kGdbEga0QNRCk5
         yi4H3VTIyFx+JaRLBk3Z5QNGiDvxa6AuPRctyYXmGn5IYoNld0HabvyHMqjGniFU/hsv
         10i4RlVU3PyCMCTPvKw6w98Zs5omO0sdURP+/p/I0PXpzHE3ddQ6aXcxhUQSb27cwtzK
         6P9Kb97eEcOvvcLJWa5Tif6N6sS8/7pdN0PYVfAZFXmsWAhcLtAMEPlLlWQ66gKexBDh
         dkEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:list-unsubscribe
         :feedback-id:message-id:date:reply-to:from:to:dkim-signature;
        bh=zU0yHVyDv5DHZgEg0tCRe9uBVUWntGn7qhSwlIlE7hQ=;
        b=Bh35I0/MI428SjtWNbgDrJ5kDGprgwWYSGrfQzttxZhvDmNyga6PHs1OaZotNevf1F
         bT8A0ceu8kgeWO20W4euv6xDhayxXEjvB7LDdkFMeYpG3PuHTybp7/2G8Ejhq7fsPUrg
         s9Ef55m0TnzZr2sqeAnc/PrVXyAwZ6RdyKgzgmZVdB5F8kceZRaYCHtB4wZPxD40foC7
         OoQ0burPIsVwetlS3sJfcVjKdwszJbttpY53mKIN68hKONARGqlQRUByCv3zvWpGqvxe
         3UO6HglJzpSlp/RFBskrxpkoedILiva2VHreHMyH0bnqp7mMbvuoN0RSXuN8Vqi9Va6q
         kwGA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=neutral (invalid public key) header.i=@ics.events header.s=dkim header.b=E+fM0Any;
       spf=softfail (google.com: domain of transitioning conf@ics.events does not designate 93.159.215.162 as permitted sender) smtp.mailfrom=conf@ics.events
Received: from s5mt162p.consultorpc.com (s5mt162p.consultorpc.com. [93.159.215.162])
        by gmr-mx.google.com with ESMTPS id p18si317145lji.8.2021.03.21.00.44.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Mar 2021 00:44:36 -0700 (PDT)
Received-SPF: softfail (google.com: domain of transitioning conf@ics.events does not designate 93.159.215.162 as permitted sender) client-ip=93.159.215.162;
Received: by s5mt162p.consultorpc.com id harsm616r3g3 for <jailhouse-dev@googlegroups.com>; Sun, 21 Mar 2021 08:35:32 +0100 (envelope-from <conf@ics.events>)
To: <jailhouse-dev@googlegroups.com>
From: "ICS" <conf@ics.events>
Reply-To: "ICS" <conf@ics.events>
Date: Sun, 21 Mar 2021 08:35:12 +0100
Message-ID: <57500d04020c0b070553590401095704500404545754540051510b060054065252000751005d0907005f59065254@ics_ip-zone_com-6>
X-CcmId: 0c0246685a491d495f08046d555d0c5e5653005904060d5507
Feedback-ID: 218315:218315-44:1:Mailrelay
X-Report-Abuse: Please report abuse for this campaign here http://ics.mailrelay-v.com/ccm/abuse?a=218315&m=44&s=28238
X-OriginalSender: conf@ics.events
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
Subject: 9th International Conference. Springer Publication. Scopus, WoS Indexation | Deadline for papers submission-August 11, 2021
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="-------6056f7302d8e8"
Content-Transfer-Encoding: 7bit
X-Original-Sender: conf@ics.events
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=neutral
 (invalid public key) header.i=@ics.events header.s=dkim header.b=E+fM0Any;
       spf=softfail (google.com: domain of transitioning conf@ics.events does
 not designate 93.159.215.162 as permitted sender) smtp.mailfrom=conf@ics.events
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>

This is a multi-part message in MIME format

---------6056f7302d8e8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


9th International Conference. Springer Publication. Scopus, WoS Indexation =
| Deadline for papers submission-August 11, 2021
Dear Author/Researcher,

=C2=A0

We hope you continue to be safe as we all work through these extraordinary =
times

and already published seven Conferences Proceedings in Springer books since=
 2018 - https://ics.events/past-events/.


		=09
		=09
		=09
	=09
		=09
		=09
			COMING SOON ...
	=09
The first six of above books have been indexed by Scopus, and the first thr=
ee of them =E2=80=93 by Web of Science.

=C2=A0
You are cordially invited to submit your full paper of 6 - 12 pages.
=C2=A0
The 2021 International Conference on Digital Science (DSIC 2021) will be he=
ld in Luxembourg, Luxembourg, on October 15 =E2=80=93 17, 2021. Conference =
website is https://ics.events/dsic-2021/.

=C2=A0

This conference has contemplated the two modalities of participation: face =
to face and virtual. However, given the current Coronavirus situation and t=
ravel restrictions,

at this moment we are accepting submissions for virtual participation for a=
 while. If the situation changes and we feel the safety of our participants=
 would not be at risk,

we will start accepting submissions for face-to-face participation, and tho=
se authors who submitted their article for virtual participation will have =
the ability to change

their participation modality to face-to-face, if they wish.

Early submissions are greatly appreciated. A single attending author may pr=
esent a maximum of two papers onsite/online.

The presentation, award submission and proceedings submission for a paper m=
ust all be in English.

You may submit your paper via Submission Form on https://ics.events/dsic-20=
21/. Submitted papers (until 12-page limit)

must comply with the requested format Template, be written in English, must=
 not have been published before, not be under review for any other conferen=
ce or publication.

All submissions will be twice =C2=ABblind=C2=BB reviewed based on relevance=
, timeliness, originality, importance and clarity of expression with convin=
cing argumentative.

Besides globally relevant meetings with internationally representative prog=
ram/scientific committees guaranteeing a strict peer-reviewing and paper se=
lection process.

After that you will receive an email notification containing an acceptance =
or rejection letter. This letter will contain a paper ID that you should in=
clude in all further correspondences.

=C2=A0
Publication and Indexation

Accepted, registered, and oral/virtual presented Papers will be published i=
n the 2021 International Conference on Digital Science Proceeding by Spring=
er

in a book of the =E2=80=9CAdvances in Intelligent Systems and Computing=E2=
=80=9D (included in Scopus source list, Q3 / JSR 0,184),=20

and then will be submitted to SCOPUS, WoS, Google Scholar and other indexat=
ions.

=C2=A0

Due to the restrictions caused this year by COVID-19 Pandemic, correspondin=
g authors with ICCS2021 registration will have a discount of 50 USD in the =
DSIC 2021 registration.

=C2=A0
Important Deadlines:

Submission: =C2=A0=C2=A0 August 11, 2021

Notification: =C2=A0 September 17, 2020

Registration:=C2=A0=C2=A0 September 23, 2021

Event Dates:=C2=A0=C2=A0 October 15 =E2=80=93 17, 2021

=C2=A0

Convener DSIC 2021.
https://ics.events.

=C2=A0


=C2=A0

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/57500d04020c0b070553590401095704500404545754540051510b0600540=
65252000751005d0907005f59065254%40ics_ip-zone_com-6.

---------6056f7302d8e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w=
3.org/TR/REC-html40/loose.dtd">
<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8"><title>9th International Conference. Springer Publication. Scopus=
, WoS Indexation | Deadline for papers submission-August 11, 2021</title></=
head><body>
<div style=3D"text-align: center;"><strong><span style=3D"color:#FF0000;">D=
ear Author/Researcher,</span></strong></div>

<div style=3D"text-align: center;">=C2=A0</div>

<div style=3D"text-align: center;">We hope you continue to be safe as we al=
l work through these extraordinary times<br>
and already published seven Conferences Proceedings in Springer books since=
 2018 - <a href=3D"http://ics.mailrelay-v.com/newslink/455867/21.html">http=
s://ics.events/past-events/</a>.</div>

<table border=3D"1" cellpadding=3D"1" cellspacing=3D"1" style=3D"width:500p=
x;"><tbody><tr><td style=3D"text-align: center;"><a href=3D"http://ics.mail=
relay-v.com/newslink/455867/27.html"><img alt=3D"" src=3D"http://ics.ip-zon=
e.com/mailing-manager/domains/ics_ip-zone_com/files/img//mosits-2017bookcov=
er.jpg" style=3D"width: 168px; height: 254px;" width=3D"168" height=3D"254"=
></a></td>
			<td style=3D"text-align: center;"><a href=3D"http://ics.mailrelay-v.com/=
newslink/455867/11.html"><img alt=3D"" src=3D"http://ics.ip-zone.com/mailin=
g-manager/domains/ics_ip-zone_com/files/img//digitalscience18coverbook.jpg"=
 style=3D"width: 168px; height: 254px;" width=3D"168" height=3D"254"></a></=
td>
			<td style=3D"text-align: center;"><a href=3D"http://ics.mailrelay-v.com/=
newslink/455867/28.html"><img alt=3D"" src=3D"http://ics.ip-zone.com/mailin=
g-manager/domains/ics_ip-zone_com/files/img//covericis2019.jpg" style=3D"wi=
dth: 168px; height: 254px;" width=3D"168" height=3D"254"></a></td>
			<td style=3D"text-align: center;"><a href=3D"http://ics.mailrelay-v.com/=
newslink/455867/16.html"><img alt=3D"" src=3D"http://ics.ip-zone.com/mailin=
g-manager/domains/ics_ip-zone_com/files/img//coverdsic2019.jpg" style=3D"wi=
dth: 168px; height: 254px;" width=3D"168" height=3D"254"></a></td>
		</tr><tr><td style=3D"text-align: center;"><a href=3D"http://ics.mailrela=
y-v.com/newslink/455867/29.html"><img alt=3D"" src=3D"http://ics.ip-zone.co=
m/mailing-manager/domains/ics_ip-zone_com/files/img//icis2020coverbook.jpg"=
 style=3D"width: 168px; height: 254px;" width=3D"168" height=3D"254"></a></=
td>
			<td style=3D"text-align: center;"><a href=3D"http://ics.mailrelay-v.com/=
newslink/455867/30.html"><img alt=3D"" src=3D"http://ics.ip-zone.com/mailin=
g-manager/domains/ics_ip-zone_com/files/img//covericcs2020.jpg" style=3D"wi=
dth: 168px; height: 254px;" width=3D"168" height=3D"254"></a></td>
			<td style=3D"text-align: center;"><a href=3D"http://ics.mailrelay-v.com/=
newslink/455867/31.html"><img alt=3D"" src=3D"http://ics.ip-zone.com/mailin=
g-manager/domains/ics_ip-zone_com/files/img//highqualitycovericads2021.jpg"=
 style=3D"width: 168px; height: 254px;" width=3D"168" height=3D"254"></a></=
td>
			<td style=3D"text-align: center;">COMING SOON ...</td>
		</tr></tbody></table>
The first six of above books have been indexed by Scopus, and the first thr=
ee of them =E2=80=93 by Web of Science.<br>
=C2=A0
<div style=3D"text-align: center;"><span style=3D"color:#FF0000;"><strong>Y=
ou are cordially invited to submit your full paper of 6 - 12 pages.</strong=
></span></div>
=C2=A0<br><strong>The 2021 International Conference on Digital Science</str=
ong> (DSIC 2021) will be held in <a name=3D"_Hlk67213822" href=3D"http://ic=
s.mailrelay-v.com/newslink/455867/3.html">Luxembourg</a>, Luxembourg, on <a=
 name=3D"_Hlk67214091" href=3D"http://ics.mailrelay-v.com/newslink/455867/3=
.html">October 15 =E2=80=93 17</a>, 2021. Conference website is <a href=3D"=
http://ics.mailrelay-v.com/newslink/455867/32.html">https://ics.events/dsic=
-2021/</a>.<br>
=C2=A0<br>
This conference has contemplated the two modalities of participation: face =
to face and virtual. However, given the current Coronavirus situation and t=
ravel restrictions,<br>
at this moment we are accepting submissions for virtual participation for a=
 while. If the situation changes and we feel the safety of our participants=
 would not be at risk,<br>
we will start accepting submissions for face-to-face participation, and tho=
se authors who submitted their article for virtual participation will have =
the ability to change<br>
their participation modality to face-to-face, if they wish.<br>
Early submissions are greatly appreciated. A single attending author may pr=
esent a maximum of two papers onsite/online.<br>
The presentation, award submission and proceedings submission for a paper m=
ust all be in English.<br>
You may submit your paper via Submission Form on <a href=3D"http://ics.mail=
relay-v.com/newslink/455867/32.html">https://ics.events/dsic-2021/</a>. Sub=
mitted papers (until 12-page limit)<br>
must comply with the requested format <a href=3D"http://ics.mailrelay-v.com=
/newslink/455867/14.html" target=3D"_blank"><strong>Template</strong></a>, =
be written in English, must not have been published before, not be under re=
view for any other conference or publication.<br>
All submissions will be twice =C2=ABblind=C2=BB reviewed based on relevance=
, timeliness, originality, importance and clarity of expression with convin=
cing argumentative.<br>
Besides globally relevant meetings with internationally representative prog=
ram/scientific committees guaranteeing a strict peer-reviewing and paper se=
lection process.<br>
After that you will receive an email notification containing an acceptance =
or rejection letter. This letter will contain a paper ID that you should in=
clude in all further correspondences.<br>
=C2=A0<br><span style=3D"color:#FF0000;"><strong>Publication and Indexation=
</strong></span><br>
Accepted, registered, and oral/virtual presented Papers will be published i=
n the 2021 International Conference on Digital Science Proceeding <strong>b=
y Springer<br>
in a book of the =E2=80=9C<span style=3D"color:#FF0000;">Advances in Intell=
igent Systems and Computing</span>=E2=80=9D (included in Scopus source list=
, <span style=3D"color:#FF0000;">Q3 / JSR 0,184</span>), </strong><br>
and then will be submitted to <strong>SCOPUS, WoS, Google Scholar and other=
</strong> indexations.<br>
=C2=A0<br>
Due to the restrictions caused this year by COVID-19 Pandemic, correspondin=
g authors with ICCS2021 registration will have a <span style=3D"color:#FF00=
00;">discount of 50 USD</span> in the DSIC 2021 registration.<br>
=C2=A0<br><strong><span style=3D"color:#FF0000;">Important Deadlines</span>=
:</strong><br>
Submission: =C2=A0=C2=A0 August 11, 2021<br>
Notification: =C2=A0 September 17, 2020<br>
Registration:=C2=A0=C2=A0 September 23, 2021<br>
Event Dates:=C2=A0=C2=A0 October 15 =E2=80=93 17, 2021<br>
=C2=A0<br>
Convener DSIC 2021.<br><a href=3D"http://ics.mailrelay-v.com/newslink/45586=
7/23.html">https://ics.events</a>.<br>
=C2=A0
<div style=3D"text-align: center;"><br>
=C2=A0</div>
<img src=3D"http://ics.mailrelay-v.com/newsimg/455867/logo.gif" width=3D"1"=
 height=3D"1" alt=3D"" border=3D"0"></body></html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/57500d04020c0b070553590401095704500404545754540051=
510b060054065252000751005d0907005f59065254%40ics_ip-zone_com-6?utm_medium=
=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailhouse-d=
ev/57500d04020c0b070553590401095704500404545754540051510b060054065252000751=
005d0907005f59065254%40ics_ip-zone_com-6</a>.<br />

---------6056f7302d8e8--

