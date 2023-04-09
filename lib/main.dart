import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class FormDemo extends StatelessWidget {
  const FormDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

Future<GithubUser> getData() async {
  final response =
      await http.get(Uri.parse("https://api.github.com/users/AliJawadSubhan"));
  return GithubUser.fromJson(jsonDecode(response.body));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<GithubUser>(
          future: getData(),
          builder: (ctx, snaptho) {
            if (snaptho.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snaptho.data == null) {
              return const Center(
                child: Text('Some sort of error'),
              );
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    snaptho.data!.name.toString(),
                  ),
                  SizedBox(
                    height: 100,
                    width: 150,
                    child: Image(
                      image: NetworkImage(
                        snaptho.data!.avatarUrl.toString(),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class GithubUser {
  String? login;
  int? id;
  String? nodeId;
  String? avatarUrl;
  String? gravatarId;
  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? starredUrl;
  String? subscriptionsUrl;
  String? organizationsUrl;
  String? reposUrl;
  String? eventsUrl;
  String? receivedEventsUrl;
  String? type;
  bool? siteAdmin;
  String? name;
  Null? company;
  String? blog;
  Null? location;
  Null? email;
  Null? hireable;
  String? bio;
  Null? twitterUsername;
  int? publicRepos;
  int? publicGists;
  int? followers;
  int? following;
  String? createdAt;
  String? updatedAt;

  GithubUser(
      {this.login,
      this.id,
      this.nodeId,
      this.avatarUrl,
      this.gravatarId,
      this.url,
      this.htmlUrl,
      this.followersUrl,
      this.followingUrl,
      this.gistsUrl,
      this.starredUrl,
      this.subscriptionsUrl,
      this.organizationsUrl,
      this.reposUrl,
      this.eventsUrl,
      this.receivedEventsUrl,
      this.type,
      this.siteAdmin,
      this.name,
      this.company,
      this.blog,
      this.location,
      this.email,
      this.hireable,
      this.bio,
      this.twitterUsername,
      this.publicRepos,
      this.publicGists,
      this.followers,
      this.following,
      this.createdAt,
      this.updatedAt});

  GithubUser.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    nodeId = json['node_id'];
    avatarUrl = json['avatar_url'];
    gravatarId = json['gravatar_id'];
    url = json['url'];
    htmlUrl = json['html_url'];
    followersUrl = json['followers_url'];
    followingUrl = json['following_url'];
    gistsUrl = json['gists_url'];
    starredUrl = json['starred_url'];
    subscriptionsUrl = json['subscriptions_url'];
    organizationsUrl = json['organizations_url'];
    reposUrl = json['repos_url'];
    eventsUrl = json['events_url'];
    receivedEventsUrl = json['received_events_url'];
    type = json['type'];
    siteAdmin = json['site_admin'];
    name = json['name'];
    company = json['company'];
    blog = json['blog'];
    location = json['location'];
    email = json['email'];
    hireable = json['hireable'];
    bio = json['bio'];
    twitterUsername = json['twitter_username'];
    publicRepos = json['public_repos'];
    publicGists = json['public_gists'];
    followers = json['followers'];
    following = json['following'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['id'] = this.id;
    data['node_id'] = this.nodeId;
    data['avatar_url'] = this.avatarUrl;
    data['gravatar_id'] = this.gravatarId;
    data['url'] = this.url;
    data['html_url'] = this.htmlUrl;
    data['followers_url'] = this.followersUrl;
    data['following_url'] = this.followingUrl;
    data['gists_url'] = this.gistsUrl;
    data['starred_url'] = this.starredUrl;
    data['subscriptions_url'] = this.subscriptionsUrl;
    data['organizations_url'] = this.organizationsUrl;
    data['repos_url'] = this.reposUrl;
    data['events_url'] = this.eventsUrl;
    data['received_events_url'] = this.receivedEventsUrl;
    data['type'] = this.type;
    data['site_admin'] = this.siteAdmin;
    data['name'] = this.name;
    data['company'] = this.company;
    data['blog'] = this.blog;
    data['location'] = this.location;
    data['email'] = this.email;
    data['hireable'] = this.hireable;
    data['bio'] = this.bio;
    data['twitter_username'] = this.twitterUsername;
    data['public_repos'] = this.publicRepos;
    data['public_gists'] = this.publicGists;
    data['followers'] = this.followers;
    data['following'] = this.following;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class TvShow {
  String? total;
  int? page;
  int? pages;
  List<TvShows>? tvShows;

  TvShow({this.total, this.page, this.pages, this.tvShows});

  TvShow.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    page = json['page'];
    pages = json['pages'];
    if (json['tv_shows'] != null) {
      tvShows = <TvShows>[];
      json['tv_shows'].forEach((v) {
        tvShows!.add(TvShows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['page'] = this.page;
    data['pages'] = this.pages;
    if (this.tvShows != null) {
      data['tv_shows'] = this.tvShows!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TvShows {
  int? id;
  String? name;
  String? permalink;
  String? startDate;
  Null? endDate;
  String? country;
  String? network;
  String? status;
  String? imageThumbnailPath;

  TvShows(
      {this.id,
      this.name,
      this.permalink,
      this.startDate,
      this.endDate,
      this.country,
      this.network,
      this.status,
      this.imageThumbnailPath});

  TvShows.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    permalink = json['permalink'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    country = json['country'];
    network = json['network'];
    status = json['status'];
    imageThumbnailPath = json['image_thumbnail_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['permalink'] = this.permalink;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['country'] = this.country;
    data['network'] = this.network;
    data['status'] = this.status;
    data['image_thumbnail_path'] = this.imageThumbnailPath;
    return data;
  }
}
